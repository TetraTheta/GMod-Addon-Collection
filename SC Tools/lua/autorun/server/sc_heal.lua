--[[
  Commands:
  * sc_heal [player] - Heal player
  * sc_overheal [player] - Heal player and charge the player's suit too
]]
--
include("autorun/sc_tools_shared.lua")
local function Heal(ply, cmd, args, str)
  if not CheckSAdmin(ply) then return end
  local p
  if args[1] ~= nil then
    if args[2] ~= nil then SendMessage(ply, HUD_PRINTCONSOLE, "[SC Heal] Only first player will be processed.") end
    p = GetPlayerByName(args[1])
  else
    p = ply
  end

  if IsValid(p) and p:IsPlayer() then
    p:SetHealth(p:GetMaxHealth())
    SendMessage(ply, HUD_PRINTTALK, "[SC Heal] " .. p:GetName() .. " is healed.")
  end
end

local function HealAutoComplete(cmd, args)
  return SuggestPlayer("sc_heal", cmd, args)
end

local function OverHeal(ply, cmd, args, str)
  if not CheckSAdmin(ply) then return end
  local p
  if args[1] ~= nil then
    if args[2] ~= nil then SendMessage(ply, HUD_PRINTCONSOLE, "[SC Heal] Only first player will be processed.") end
    p = GetPlayerByName(args[1])
  else
    p = ply
  end

  if IsValid(p) and p:IsPlayer() then
    p:SetHealth(p:GetMaxHealth())
    p:SetArmor(p:GetMaxArmor())
    SendMessage(ply, HUD_PRINTTALK, "[SC Heal] " .. p:GetName() .. " is healed.")
  end
end

local function OverHealAutoComplete(cmd, args)
  return SuggestPlayer("sc_overheal", cmd, args)
end

concommand.Add("sc_heal", Heal, HealAutoComplete, "Heal player.", FCVAR_NONE)
concommand.Add("sc_overheal", OverHeal, OverHealAutoComplete, "Heal player.", FCVAR_NONE)
