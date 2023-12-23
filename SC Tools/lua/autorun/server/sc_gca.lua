--[[
  Commands:
  * sc_gca [player] - Refill the ammo of the weapon that the given player is holding.
--]]
util.AddNetworkString("SCGCA")
local function GiveCurrentAmmoAutocomplete(cmd, args)
  -- Check cmd first
  if string.lower(cmd) ~= "sc_gca" then return {} end
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

local function GiveCurrentAmmo(ply, cmd, args, str)
  if not CheckSAdmin(ply) then return end
  local p
  if args[0] ~= nil then
    if args[1] ~= nil then
      SendMessage(ply, HUD_PRINTCONSOLE, "[SC GCA] Only first player will be processed.")
    end

    p = GetPlayerByName(args[0])
  else
    p = ply
  end
  if IsValid(p) and p:IsPlayer() then
    local wep = p:GetActiveWeapon()
    local maxcvar = GetConVar("gmod_maxammo"):GetInt()
    local max = isnumber(maxcvar) and maxcvar or 9999
    p:SetAmmo(max, wep:GetPrimaryAmmoType())
    p:SetAmmo(max, web:GetSecondaryAmmoType())
    SendMessage(ply, HUD_PRINTCONSOLE, "[SC GCA] Ammo of " .. p:GetName() .. "'s weapon is refilled.")
    SendMessage(p, HUD_PRINTTALK, "[SC GCA] Your ammo has been refilled.")
  end
end

concommand.Add("sc_gca", GiveCurrentAmmo, GiveCurrentAmmoAutocomplete, "Refill the ammo of the weapon that the given player is holding.", FCVAR_NONE)
