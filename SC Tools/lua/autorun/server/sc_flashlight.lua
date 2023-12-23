--[[
  Commands:
  * sc_flashlight <player> - Enable flashlight for the given player.

  ConVars:
  * sc_flashlight_auto <0|1|2> - Automatically enable flashlight to players. 0 = Disable, 1 = Super Admin Only, 2 = All Players.
--]]
local function AllowFlashlightAutomatic(ply)
  local cv = GetConVar("sc_flashlight_auto"):GetInt()
  if not isnumber(cv) then return end
  if cv == 1 then
    for _, p in ipairs(player.GetHumans()) do
      if p:IsUserGroup("superadmin") and not p:CanUseFlashlight() then
        p:AllowFlashlight(true)
        SendMessage(p, HUD_PRINTTALK, "[SC Flashlight] Flashlight is enabled.")
      end
    end
  elseif cv == 2 then
    for _, p in ipairs(player.GetHumans()) do
      if not p:CanUseFlashlight() then
        p:AllowFlashlight(true)
        SendMessage(p, HUD_PRINTTALK, "[SC Flashlight] Flashlight is enabled.")
      end
    end
  end
end

local function AllowFlashlightAutocomplete(cmd, args)
  -- Check cmd first
  if string.lower(cmd) ~= "sc_flashlight" then return {} end
  args = string.lower(args)
  local suggestions = {}
  -- Check for players whose name starts with the given input
  for _, hPlayer in ipairs(player.GetHumans()) do
    local lowerName = string.lower(hPlayer:GetName())
    if string.StartsWith(lowerName, args) then
      table.insert(suggestions, cmd .. " " .. hPlayer:GetName())
    end
  end

  -- Check for players whose name contains the given input
  for _, hPlayer in ipairs(player.GetHumans()) do
    local lowerName = string.lower(hPlayer:GetName())
    if string.find(lowerName, args, 1, true) and not table.HasValue(suggestions, cmd .. " " .. hPlayer:GetName()) then
      table.insert(suggestions, cmd .. " " .. hPlayer:GetName())
    end
  end

  return suggestions
end

local function AllowFlashlight(ply, cmd, args, str)
  if not CheckSAdminConsole(ply) then return end
  if args[0] ~= nil then
    if args[1] ~= nil then
      SendMessage(ply, HUD_PRINTCONSOLE, "[SC Flashlight] Only first player will be processed.")
    end

    local p = GetPlayerByName(args[0])
    if IsValid(p) and p:IsPlayer() then
      p:AllowFlashlight(true)
      SendMessage(ply, HUD_PRINTTALK, "[SC Flashlight] Flashlight is enabled to " .. p:GetName() .. ".")
    end
  else
    SendMessage(ply, HUD_PRINTCONSOLE, "[SC Flashlight] You must provide one player.")
  end
end

concommand.Add("sc_flashlight", AllowFlashlight, AllowFlashlightAutocomplete, "Enable flashlight for the given player.", FCVAR_NONE)
hook.Add("PlayerSpawn", "SCAllowFlashlightAuto", AllowFlashlightAutomatic)
