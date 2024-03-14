--[[
  Commands:
  * sc_gca [player] - Refill the ammo of the weapon that the given player is holding.
--]]
util.AddNetworkString("SCGCA")
local function GiveCurrentAmmo(ply, cmd, args, str)
  if not CheckSAdmin(ply) then return end
  local p
  if args[1] ~= nil then
    if args[2] ~= nil then SendMessage(ply, HUD_PRINTCONSOLE, "[SC GCA] Only first player will be processed.") end
    p = GetPlayerByName(args[1])
  else
    p = ply
  end

  if IsValid(p) and p:IsPlayer() then
    local wep = p:GetActiveWeapon()
    local maxcvar = GetConVar("gmod_maxammo"):GetInt()
    local max = isnumber(maxcvar) and maxcvar or 9999
    p:SetAmmo(max, wep:GetPrimaryAmmoType())
    p:SetAmmo(max, wep:GetSecondaryAmmoType())
    SendMessage(ply, HUD_PRINTCONSOLE, "[SC GCA] Ammo of " .. p:GetName() .. "'s weapon is refilled.")
    SendMessage(p, HUD_PRINTTALK, "[SC GCA] Your ammo has been refilled.")
  end
end

local function GiveCurrentAmmoAutocomplete(cmd, args)
  return SuggestPlayer("sc_gca", cmd, args)
end

concommand.Add("sc_gca", GiveCurrentAmmo, GiveCurrentAmmoAutocomplete, "Refill the ammo of the weapon that the given player is holding.", FCVAR_NONE)
