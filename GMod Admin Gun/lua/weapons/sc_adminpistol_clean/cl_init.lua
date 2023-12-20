include("shared.lua")
SWEP.DrawAmmo = false
SWEP.DrawCrosshair = true
--SWEP.WepSelectIcon
SWEP.IconOverride = "materials/entities/weapon_pistol.png"
SWEP.Slot = 1
SWEP.SlotPos = 0
SWEP.CSMuzzleFlashes = false
SWEP.UseHands = true
killicon.AddFont(SCAPCclassName, "HL2MPTypeDeath", "-", Color(255, 80, 0, 255), 0.52)
-- env_explosion is not well match
killicon.AddFont("env_explosion", "HL2MPTypeDeath", "7", Color(255, 80, 0, 255), 0.35)
killicon.AddFont("npc_grenade_frag", "HL2MPTypeDeath", "4", Color(255, 80, 0, 255), 0.56)
-- Reload
local WeaponModes = {
  [0] = "Explosion Mode",
  [1] = "Airboat Gun Mode",
  [2] = "Combine Ball Mode",
  [3] = "Grenade Mode"
}

net.Receive(
  "SCAPC_ChangeMode",
  function()
    local newMode = net.ReadUInt(3)
    if newMode > 3 then return end
    notification.AddLegacy(WeaponModes[newMode], NOTIFY_UNDO, 2)
    surface.PlaySound("buttons/button15.wav")
  end
)
