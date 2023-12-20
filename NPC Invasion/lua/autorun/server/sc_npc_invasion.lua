--[[
Modified NPC Invation

Commands:
 - sc_zinv: Enable NPC Invasion

Requirements:
 - Player must be in 'superadmin' group
--]]
include("npc_invasion_shared.lua")
--
-- Settings
--
distance_max = 3000
distance_min = 1000
timer_delay_npc_spawn = 1
timer_delay_npc_type = 10
explosion_magnitude = 35
settings = {
  -- 1 // https://developer.valvesoftware.com/wiki/Npc_zombie
  {
    chance = 100,
    class = "npc_zombie",
    explode = false,
    health = -1,
    max = 10,
    model = "",
    proficiency = -1,
    scale = 1,
    spawnflags = -1,
    type = "chaser",
    weapon = "",
  },
  -- 2 // https://developer.valvesoftware.com/wiki/Npc_fastzombie
  {
    chance = 30,
    class = "npc_fastzombie",
    explode = false,
    health = -1,
    max = 5,
    model = "",
    proficiency = -1,
    scale = 1,
    spawnflags = -1,
    type = "chaser",
    weapon = "",
  },
  -- 3 // https://developer.valvesoftware.com/wiki/Npc_poisonzombie
  {
    chance = 40,
    class = "npc_poisonzombie",
    explode = false,
    health = -1,
    max = 2,
    model = "",
    proficiency = -1,
    scale = 1,
    spawnflags = -1,
    type = "chaser",
    weapon = "",
  },
  -- 4 // https://developer.valvesoftware.com/wiki/Npc_combine_s
  {
    chance = 40,
    class = "npc_combine_s",
    explode = false,
    health = 200,
    max = 3,
    model = "models/npc/ikea_soldier.mdl",
    proficiency = WEAPON_PROFICIENCY_PERFECT,
    scale = 1,
    -- 131072: Don't drop grenades / 262144 : Don't drop ar2 alt fire (elite only)
    spawnflags = bit.bor(SF_NPC_FADE_CORPSE, SF_NPC_NO_WEAPON_DROP, 131072, 262144),
    -- tactical is npc_combine_s only!
    tactical = 2,
    type = "chaser",
    weapon = "weapon_ar2",
  },
  -- 5 // https://developer.valvesoftware.com/wiki/Npc_combine_s
  {
    chance = 80,
    class = "npc_combine_s",
    explode = true,
    health = 200,
    max = 3,
    model = "models/npc/ikea_soldier.mdl",
    proficiency = WEAPON_PROFICIENCY_PERFECT,
    scale = 1,
    -- 131072: Don't drop grenades / 262144 : Don't drop ar2 alt fire (elite only)
    spawnflags = bit.bor(SF_NPC_FADE_CORPSE, SF_NPC_NO_WEAPON_DROP, 131072, 262144),
    -- tactical is npc_combine_s only!
    tactical = 2,
    type = "chaser",
    weapon = "weapon_shotgun",
  },
}

--
-- Helper functions for Node Graph information
--
local sizeof_int = 4
local sizeof_short = 2
local ainet_version_number = 37
local function toUShort(b)
  local i = {string.byte(b, 1, sizeof_short)}

  return i[1] + i[2] * 256
end

local function toInt(b)
  local i = {string.byte(b, 1, sizeof_int)}
  i = i[1] + i[2] * 256 + i[3] * 65536 + i[4] * 16777216
  if i > 2147483647 then return i - 4294967296 end

  return i
end

local function ReadInt(f)
  return toInt(f:Read(sizeof_int))
end

local function ReadUShort(f)
  return toUShort(f:Read(sizeof_short))
end

--
-- Get Node Graph Information
--
function parse_node()
  if found_ain then return end
  local f = file.Open("maps/graphs/" .. game.GetMap() .. ".ain", "rb", "GAME")
  if not f then return end
  found_ain = true
  local map_ainet_ver = ReadInt(f)
  local map_ver = ReadInt(f)
  if map_ainet_ver ~= ainet_version_number then
    MsgN("ZINV: Error! Unknown Node Graph file! (", map_ainet_ver, ")")

    return
  end

  local node_count = ReadInt(f)
  if node_count < 0 then
    MsgN("ZINV: Error! Node count is ", node_count)

    return
  end

  MsgN("ZINV: Map version = ", map_ver, " / Node version = ", map_ainet_ver, " / Node count = ", node_count)
  for i = 1, node_count do
    local v = Vector(f:ReadFloat(), f:ReadFloat(), f:ReadFloat())
    local yaw = f:ReadFloat()
    local fl_offset = {}
    for j = 1, NUM_HULLS do
      fl_offset[j] = f:ReadFloat()
    end

    local node_type = f:ReadByte()
    local node_info = ReadUShort(f)
    local zone = f:ReadShort()
    if node_type == 4 then continue end
    local node = {
      info = node_info,
      link = {},
      neighbor = {},
      numlinks = 0,
      numneighbors = 0,
      offset = fl_offset,
      pos = v,
      type = node_type,
      yaw = yaw,
      zone = zone,
    }

    table.insert(nodes, node)
  end
end

--
-- Helper functions
--
function in_settings(class_str)
  for _, v in pairs(settings) do
    if v.class == class_str then return v end
  end

  return false
end

function simple_checks()
  -- Abort if this returns true
  if GetConVar("sc_zinv"):GetFloat() == 0 or table.Count(player.GetHumans()) <= 0 then return true end
  if not found_ain then
    parse_node()
  end

  if distance_max < distance_min then
    MsgN("ZINV: Setting Error! Max value is less than Min value")
  end

  if not settings then
    MsgN("ZINV: Error with Settings")

    return true
  end

  if not nodes or table.Count(nodes) < 1 then
    MsgN("ZINV: No info_node(s) in map! NPCs won't spawn")

    return true
  end

  if table.Count(nodes) <= 35 then
    MsgN("ZINV: NPCs may not spawn well on this map! Please re-create node graph")
  end

  return false
end

--
-- Functions
--
function create_npc(entry, pos)
  -- Spawn NPC
  if entry then
    local npc = ents.Create(entry.class)
    local npc_cn = npc:GetInternalVariable("classname")
    npc:SetKeyValue("classname", "sc_" .. npc_cn)
    if npc then
      if entry.weapon and entry.weapon ~= "" then
        npc:SetKeyValue("additionalequipment", entry.weapon)
      end

      if entry.spawnflags and entry.spawnflags >= 0 then
        npc:SetKeyValue("spawnflags", entry.spawnflags)
      end

      npc:SetPos(pos)
      npc:SetAngles(Angle(0, math.random(0, 360), 0))
      npc:Spawn()
      -- In case of weapon didn't given to NPC
      if entry.weapon and entry.weapon ~= "" then
        npc:Give(entry.weapon)
      end

      if entry.model and entry.model ~= "" then
        npc:SetModel(entry.model)
      end

      if entry.scale then
        npc:SetModelScale(entry.scale, 0.00001)
      end

      if entry.health and entry.health > 0 then
        npc:SetHealth(entry.health)
        npc:SetMaxHealth(entry.health)
      end

      if entry.proficiency and entry.proficiency >= 0 then
        npc:SetCurrentWeaponProficiency(entry.proficiency)
      end

      if entry.tactical and entry.tactical >= 0 then
        npc:SetKeyValue("tacticalvariant", entry.tactical)
      end

      npc:SetNWBool("ZINV_RemoveCorpse", true)
      npc:Activate()
    end
  end
end

function load_npc_info()
  total_chance = 0
  for _, v in pairs(settings) do
    total_chance = total_chance + v.chance
  end
end

--
-- Hook
--
hook.Add(
  "Initialize",
  "ZINV_Initialize",
  function()
    nodes = {}
    total_chance = 0
    load_npc_info()
    found_ain = false
    parse_node()
  end
)

hook.Add(
  "EntityKeyValue",
  "ZINV_NewKeyValue",
  function(ent)
    if ent:GetClass() == "info_player_teamspawn" then
      local valid = true
      for _, v in pairs(nodes) do
        if v.pos == ent:GetPos() then
          valid = false
        end
      end

      if valid then
        local node = {
          info = 0,
          link = {},
          neighbor = {},
          numlinks = 0,
          numneighbors = 0,
          offset = 0,
          pos = ent.GetPos(),
          type = 0,
          yaw = 0,
          zone = 0,
        }

        table.insert(nodes, node)
      end
    end
  end
)

hook.Add(
  "OnNPCKilled",
  "ZINV_NPC_Explode",
  function(victim, killer, weapon)
    local class = in_settings(victim:GetClass())
    if not class then return end
    if class.explode == true then
      local explosion = ents.Create("env_explosion")
      explosion:SetPos(victim:GetPos())
      explosion:Spawn()
      explosion:SetKeyValue("iMagnitude", explosion_magnitude)
      explosion:Fire("Explode", 0, 0)
      explosion:EmitSound("weapon_AWP.Single", 400, 400)
      explosion:Remove()
    end
  end
)

hook.Add(
  "OnNPCKilled",
  "ZINV_Headcrab_Check",
  function(entity, _, _)
    -- This is dumb, but I can't use 'OnEntityCreated' for some reason I don't know
    for _, v in ipairs(ents.FindByClass("npc_headcrab")) do
      if v:GetOwner():GetNWBool("ZINV_RemoveCorpse", false) then
        v:SetNWBool("ZINV_RemoveCorpse", true)
      end
    end

    for _, v in ipairs(ents.FindByClass("npc_headcrab_fast")) do
      if v:GetOwner():GetNWBool("ZINV_RemoveCorpse", false) then
        v:SetNWBool("ZINV_RemoveCorpse", true)
      end
    end

    -- It seems GMod treats Poison Headcrab as 'npc_headcrab_poison'
    -- but since VDC says that is 'npc_headcrab_black', I will put 'black' here too
    for _, v in ipairs(ents.FindByClass("npc_headcrab_black")) do
      if v:GetOwner():GetNWBool("ZINV_RemoveCorpse", false) then
        v:SetNWBool("ZINV_RemoveCorpse", true)
      end
    end

    for _, v in ipairs(ents.FindByClass("npc_headcrab_poison")) do
      if v:GetOwner():GetNWBool("ZINV_RemoveCorpse", false) then
        v:SetNWBool("ZINV_RemoveCorpse", true)
      end
    end
  end
)

--
-- Timer
--
timer.Create(
  "ZINV_NPC_Type",
  timer_delay_npc_type,
  0,
  function()
    local status, err = pcall(
      function()
        local npcs = {}
        if simple_checks() then return end
        for _, v in pairs(settings) do
          npcs = table.Add(npcs, ents.FindByClass(v.class))
        end

        -- Check NPC for type
        for _, v in pairs(npcs) do
          local closest = -1
          local closest_player = nil
          local npc_pos = v:GetPos()
          for _, v2 in pairs(player.GetHumans()) do
            local dist = npc_pos:Distance(v2:GetPos())
            if dist < closest or closest == -1 then
              closest_player = v2
              closest = dist
            end
          end

          -- Remove NPC that is far from player
          if closest > distance_max * 1.25 then
            v:Remove()
          else
            local class = in_settings(v.class)
            if not class or v.Base == "base_nextbot" then continue end
            if class.type == "chaser" then
              v:SetLastPosition(closest_player:GetPos())
              v:SetSaveValue("m_vecLastPosition", closest_player:GetPos())
              v:SetTarget(closest_player)
              if not v:IsCurrentSchedule(SCHED_TARGET_CHASE) then
                v:SetSchedule(SCHED_TARGET_CHASE)
              end
            elseif class.type == "roamer" then
              if not v:IsCurrentSchedule(SCHED_RUN_RANDOM) and v:IsCurrentSchedule(SCHED_IDLE_STAND) then
                v:SetSchedule(SCHED_RUN_RANDOM)
              end
            end
          end
        end
      end
    )

    if not status then
      print(err)
    end
  end
)

timer.Create(
  "ZINV_NPC_Spawn",
  1,
  0,
  function()
    local status, err = pcall(
      function()
        local valid_nodes = {}
        local npcs = {}
        if simple_checks() then return end
        for _, v in pairs(settings) do
          npcs = table.Add(npcs, ents.FindByClass(v.class))
        end

        -- Get valid nodes
        for _, v in pairs(nodes) do
          local valid = false
          if table.Count(valid_nodes) >= 50 * table.Count(player.GetHumans()) then break end
          for _, ply in pairs(player.GetHumans()) do
            local dist = v.pos:Distance(ply:GetPos())
            if dist <= distance_min then
              valid = false
              break
            elseif dist < distance_max then
              valid = true
            end
          end

          if not valid then continue end
          for _, npc in pairs(npcs) do
            local dist = v.pos:Distance(npc:GetPos())
            if dist <= 100 then
              valid = false
              break
            end
          end

          if valid then
            table.insert(valid_nodes, v.pos)
          end
        end

        -- Spawn NPCs if not enough
        for _, v in pairs(settings) do
          local c = table.Count(ents.FindByClass(v.class))
          if c < v.max then
            local loopmax = math.min(5, v.max - c)
            for i = 0, loopmax - 1 do
              if (v.chance / 100.0) <= math.Rand(0, 1) then continue end
              local pos = table.Random(valid_nodes)
              if pos ~= nil then
                table.RemoveByValue(valid_nodes, pos)
                create_npc(v, pos + Vector(0, 0, 30))
              end
            end
          end
        end
      end
    )

    if not status then
      print(err)
    end
  end
)
