-- Send required files to client
AddCSLuaFile()
--
SWEP.Base = "scaw_base"
SWEP.Category = "SC Admin Weapon"
SWEP.IconOverride = "materials/entities/scaw_mp5sd.png"
SWEP.Instructions = "Click to shoot, Reload to change secondary fire mode."
SWEP.PrintName = "Admin MP5SD"
SWEP.Purpose = "Yet Another Admin MP5SD"
SWEP.Slot = 2
SWEP.SlotPos = 2
SWEP.Spawnable = true
SWEP.ViewModel = "models/weapons/c_scw_mp5sd.mdl"
SWEP.WepSelectIcon = CLIENT and surface.GetTextureID("weapons/scw_mp5sd") or ""
SWEP.WorldModel = "models/weapons/w_scw_mp5sd.mdl"
SWEP.CFG_HoldType = "ar2"
SWEP.Primary.CFG_Sound = "SCW.MP5SD.Primary"
SWEP.Secondary.MOD_Current = ConVarExists("scaw_mp5sd_default") and GetConVar("scaw_mp5sd_default"):GetInt() or 1
--
util.PrecacheModel(SWEP.ViewModel)
util.PrecacheModel(SWEP.WorldModel)
--
