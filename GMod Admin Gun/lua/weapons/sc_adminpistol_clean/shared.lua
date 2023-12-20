-- Declaring class name here because I can't use 'self.ClassName' or 'SWEP.ClassName'.
SCAPCclassName = "sc_adminpistol_clean"
-- SWEP Information
SWEP.Category = "SC Admin Weapons"
SWEP.Spawnable = true
SWEP.AdminOnly = true
SWEP.PrintName = "Admin Pistol (Clean)"
SWEP.Author = "TetraTheta"
SWEP.Purpose = "Yet Another Admin Pistol"
SWEP.Instructions = "Click to shoot, Reload to change secondary fire mode. Doesn't create bullet hole decal."
SWEP.ViewModel = "models/weapons/c_sc_adminpistol.mdl"
SWEP.WorldModel = "models/weapons/w_sc_adminpistol.mdl"
SWEP.AutoSwitchFrom = false
SWEP.AutoSwitchTo = true
SWEP.Weight = 999
-- SWEP Primary Fire
SWEP.Primary.Ammo = "none"
SWEP.Primary.Automatic = true
SWEP.Primary.ClipSize = 1
SWEP.Primary.Damage = 99999999999
SWEP.Primary.DefaultClip = 1
SWEP.Primary.Delay = 0.05
SWEP.Primary.Force = 1000000
SWEP.Primary.Recoil = 0.1
SWEP.Primary.ShotCount = 75
SWEP.Primary.Sound = "Weapon_M4A1.Silenced"
SWEP.Primary.Spread = 0.15
SWEP.Primary.Volume = 0.75
-- SWEP Secondary Fire (Shared)
SWEP.Secondary.Ammo = "none"
SWEP.Secondary.Automatic = true
SWEP.Secondary.ClipSize = 1
SWEP.Secondary.DefaultClip = 1
SWEP.Secondary.Recoil = 0.1
SWEP.Secondary.Volume = 0.55
-- SWEP Secondary Fire Mode
SWEP.Secondary.Mode = GetConVar("sc_adminpistol_default"):GetInt()
-- SWEP Secondary Fire Mode 0: Explosion
SWEP.Secondary.Explosion = {}
SWEP.Secondary.Explosion.Damage = 9999999 -- Damage for explosion
SWEP.Secondary.Explosion.Delay = 0.05 -- Delay for explosion
SWEP.Secondary.Explosion.Magnitude = 175 -- Explosion Magnitude of explosion
SWEP.Secondary.Explosion.Force = 1000000 -- Force of explosion
SWEP.Secondary.Explosion.ShotCount = 1 -- ShotCount for explosion. No need to set it.
SWEP.Secondary.Explosion.Sound = "Weapon_AWP.Single" -- Sound for explosion
SWEP.Secondary.Explosion.Spread = 0.1 -- Spread of explosion
-- SWEP Secondary Fire Mode 1 (Airboat Gun)
SWEP.Secondary.Airboat = {}
SWEP.Secondary.Airboat.Damage = 35 -- Damage for airboat gun
SWEP.Secondary.Airboat.Delay = 0.05 -- Delay for airboat gun
SWEP.Secondary.Airboat.Force = 1000000 -- Force of airboat gun
SWEP.Secondary.Airboat.ShotCount = 7 -- ShotCount for airboat gun
SWEP.Secondary.Airboat.Sound = "Airboat.FireGunRevDown" -- Sound for airboat gun
SWEP.Secondary.Airboat.Spread = 0.2 -- Spread of airboat gun
-- SWEP Secondary Fire Mode 2 (Combine Ball)
SWEP.Secondary.CombineBall = {}
SWEP.Secondary.CombineBall.Sound1 = "Weapon_AR2.Double"
SWEP.Secondary.CombineBall.Sound2 = "weapons/physcannon/energy_bounce1.wav" -- This doesn't have corresponding soundscript!
SWEP.Secondary.CombineBall.Speed = 5000
SWEP.Secondary.CombineBall.Delay = 0.5
SWEP.Secondary.CombineBall.Time = 5
-- SWEP Secondary Fire Mode 3 (Armed Grenade)
SWEP.Secondary.Grenade = {}
SWEP.Secondary.Grenade.Delay = 0.25
SWEP.Secondary.Grenade.Force = 1000 -- This is default value of 'player_throwforce'
SWEP.Secondary.Grenade.Sound = "weapons/grenade/tick1.wav"
SWEP.Secondary.Grenade.Time = 3
-- Precache models in case HL2 Pistol is not cached
util.PrecacheModel(SWEP.ViewModel)
util.PrecacheModel(SWEP.WorldModel)
--
--
function SWEP:Initialize()
  self:SetHoldType("Pistol")
end

-- function SWEP:SetupDataTables()
--   self:NetworkVar("Int", self:GetMode(), "SecondaryMode")
--   --self:NetworkVarNotify("SecondaryMode", self.OnSecondaryModeChange)
-- end
-- Allow NPC to pick up this SWEP
function SWEP:CanBePickedUpByNPCs()
  return true
end

-- Disable Brass Shell Ejection
function SWEP:FireAnimationEvent(pos, ang, event, options)
  if event == 6001 then return true end
end

-- Prevent weapon drop when user dies
function SWEP:ShouldDropOnDie()
  return false
end

-- Prevent weapon impact decal
function SWEP:DoImpactEffect(tr, damageType)
  return true
end

function SWEP:Precache()
  util.PrecacheSound(self.Primary.Sound)
  util.PrecacheSound(self.Secondary.Explosion.Sound)
  util.PrecacheSound(self.Secondary.Airboat.Sound)
  util.PrecacheSound(self.Secondary.CombineBall.Sound1)
  util.PrecacheSound(self.Secondary.CombineBall.Sound2)
  util.PrecacheSound(self.Secondary.Grenade.Sound)
end

--
-- Primary Fire
--
function SWEP:PrimaryAttack()
  if not self:CanPrimaryAttack() then return end
  -- Fire bullet
  local bullet = {
    Damage = self.Primary.Damage,
    Force = self.Primary.Force,
    Num = self.Primary.ShotCount,
    Tracer = 1,
    AmmoType = self.Primary.Ammo,
    TracerName = "Tracer",
    Dir = self:GetOwner():GetAimVector(),
    Spread = Vector(self.Primary.Spread * 0.1, self.Primary.Spread * 0.1, 0),
    Src = self:GetOwner():GetShootPos(),
  }

  self:GetOwner():FireBullets(bullet)
  self:ShootEffects()
  EmitSound(Sound(self.Primary.Sound), self:GetOwner():GetPos(), self:EntIndex(), CHAN_WEAPON, self.Primary.Volume)
  -- Remove RPG missiles
  self:RemoveMissile()
  -- Recoil (Player)
  --if not self:GetOwner():IsNPC() and not self:GetOwner():IsNextBot() then
  if self:GetOwner():IsPlayer() then
    local r1 = self.Primary.Recoil * -1
    local r2 = self.Primary.Recoil * math.random(-1, 1)
    --self:GetOwner():SendLua("LocalPlayer():ViewPunch(Angle(" .. r1 .. ", " .. r2 .. ", " .. r1 .. "))")
    self:GetOwner():ViewPunch(Angle(r1, r2, r1))
  end

  -- Set delay
  self:SetNextPrimaryFire(CurTime() + self.Primary.Delay)
  self:SetNextSecondaryFire(CurTime() + self.Primary.Delay)
end

--
-- Secondary Fire
--
function SWEP:SecondaryAttack()
  if not self:CanSecondaryAttack() then return end
  local mode = self.Secondary.Mode
  if mode == 0 then
    self:SecondaryAttackExplosion()
  elseif mode == 1 then
    self:SecondaryAttackAirbotGun()
  elseif mode == 2 then
    self:SecondaryAttackCombineBall()
  elseif mode == 3 then
    self:SecondaryAttackGrenade()
  end
end

-- Explosion
function SWEP:SecondaryAttackExplosion()
  if SERVER then
    local trace = self:GetOwner():GetEyeTrace()
    local exp = ents.Create("env_explosion")
    exp:SetPos(trace.HitPos)
    exp:SetKeyValue("spawnflags", "892")
    exp:SetOwner(self:GetOwner())
    exp:Spawn()
    exp:SetKeyValue("iMagnitude", self.Secondary.Explosion.Magnitude)
    exp:Fire("Explode", 0, 0)
    EmitSound(Sound(self.Secondary.Explosion.Sound), self:GetOwner():GetPos(), self:EntIndex(), CHAN_WEAPON, 0.25)
    exp:Fire("Kill", 0, 0)
  end

  self:ShootEffects()
  -- Recoil (Player)
  --if not self:GetOwner():IsNPC() and not self:GetOwner():IsNextBot() then
  if self:GetOwner():IsPlayer() then
    local r1 = self.Secondary.Recoil * -1
    local r2 = self.Secondary.Recoil * math.random(-1, 1)
    self:GetOwner():ViewPunch(Angle(r1, r2, r1))
  end

  -- Set delay
  self:SetNextPrimaryFire(CurTime() + self.Secondary.Explosion.Delay)
  self:SetNextSecondaryFire(CurTime() + self.Secondary.Explosion.Delay)
end

-- Airboat Gun
function SWEP:SecondaryAttackAirbotGun()
  -- Fire bullet
  local bullet = {
    Callback = function(attacker, trace, dmginfo)
      local g = math.random(1, 2)
      if g == 1 then
        dmginfo:SetDamageType(DMG_AIRBOAT)
      elseif g == 2 then
        dmginfo:SetDamageType(DMG_BLAST)
      end
    end,
    Damage = self.Secondary.Airboat.Damage,
    Force = self.Secondary.Airboat.Force,
    Num = self.Secondary.Airboat.ShotCount,
    Tracer = 1,
    AmmoType = self.Secondary.Ammo,
    TracerName = "AirboatGunTracer",
    Dir = self:GetOwner():GetAimVector(),
    Spread = Vector(self.Secondary.Airboat.Spread * 0.1, self.Secondary.Airboat.Spread * 0.1, 0),
    Src = self:GetOwner():GetShootPos(),
  }

  self:GetOwner():FireBullets(bullet)
  self:ShootEffects()
  EmitSound(Sound(self.Secondary.Airboat.Sound), self:GetOwner():GetPos(), self:EntIndex(), CHAN_WEAPON, self.Secondary.Volume)
  -- Remove RPG Missiles
  self:RemoveMissile()
  -- Recoil (Player)
  --if not self:GetOwner():IsNPC() and not self:GetOwner():IsNextBot() then
  if self:GetOwner():IsPlayer() then
    local r1 = self.Secondary.Recoil * -1
    local r2 = self.Secondary.Recoil * math.random(-1, 1)
    self:GetOwner():ViewPunch(Angle(r1, r2, r1))
  end

  -- Set delay
  self:SetNextPrimaryFire(CurTime() + (self.Secondary.Airboat.Delay / 2))
  self:SetNextSecondaryFire(CurTime() + self.Secondary.Airboat.Delay)
end

-- Combine Ball
function SWEP:SecondaryAttackCombineBall()
  -- Fire bullet
  if SERVER then
    local cblauncher = ents.Create("point_combine_ball_launcher")
    cblauncher:SetAngles(self:GetOwner():GetAngles())
    cblauncher:SetPos(self:GetOwner():GetShootPos() + self:GetOwner():GetAimVector() * 10)
    cblauncher:SetKeyValue("minspeed", self.Secondary.CombineBall.Speed)
    cblauncher:SetKeyValue("maxspeed", self.Secondary.CombineBall.Speed)
    cblauncher:SetKeyValue("ballradius", 15)
    cblauncher:SetKeyValue("ballcount", 1)
    cblauncher:SetKeyValue("maxballbounces", 7)
    cblauncher:SetKeyValue("launchconenoise", 0)
    cblauncher:SetNotSolid(true)
    cblauncher:SetMoveType(MOVETYPE_NONE)
    cblauncher:Spawn()
    cblauncher:Activate()
    cblauncher:Fire("LaunchBall")
    cblauncher:Fire("Kill", 0, 0)
    timer.Simple(
      0.01,
      function()
        if IsValid(self) and IsValid(self:GetOwner()) then
          for k, v in pairs(ents.FindInSphere(self:GetOwner():GetShootPos(), 85)) do
            if IsValid(v) and v:GetClass() == "prop_combine_ball" and not IsValid(v:SetOwner()) then
              v:SetOwner(self:GetOwner())
              v:GetPhysicsObject():AddGameFlag(FVPHYSICS_WAS_THROWN)
              v:Fire("Explode", 0, self.Secondary.CombineBall.Time)
            end
          end
        end
      end
    )
  end

  self:ShootEffects()
  EmitSound(Sound(self.Secondary.CombineBall.Sound1), self:GetOwner():GetPos(), self:EntIndex(), CHAN_WEAPON, self.Secondary.Volume)
  EmitSound(Sound(self.Secondary.CombineBall.Sound2), self:GetOwner():GetPos(), self:EntIndex(), CHAN_WEAPON, self.Secondary.Volume)
  -- Recoil (Player)
  --if not self:GetOwner():IsNPC() and not self:GetOwner():IsNextBot() then
  if self:GetOwner():IsPlayer() then
    local r1 = self.Secondary.Recoil * -1
    local r2 = self.Secondary.Recoil * math.random(-1, 1)
    self:GetOwner():ViewPunch(Angle(r1, r2, r1))
  end

  self:SetNextPrimaryFire(CurTime() + (self.Secondary.CombineBall.Delay / 2))
  self:SetNextSecondaryFire(CurTime() + self.Secondary.CombineBall.Delay)
end

-- Grenade
function SWEP:SecondaryAttackGrenade()
  if SERVER then
    local forward = self:GetOwner():EyeAngles():Forward()
    local grenade = ents.Create("npc_grenade_frag")
    if IsValid(grenade) then
      grenade:SetPos(self:GetOwner():GetShootPos() + forward * 32)
      grenade:SetAngles(self:GetOwner():EyeAngles())
      grenade:SetOwner(self:GetOwner())
      grenade:SetPhysicsAttacker(self:GetOwner())
      grenade:Spawn()
      grenade:Fire("SetTimer", self.Secondary.Grenade.Time)
      grenade:SetName("scapcg_" .. CreateRandomString())
      grenade:SetSaveValue("m_hThrower", self:GetOwner())
      local phys = grenade:GetPhysicsObject()
      if IsValid(phys) then
        phys:SetVelocity(self:GetOwner():GetAimVector() * self.Secondary.Grenade.Force)
      end
    end
  end

  self:ShootEffects()
  EmitSound(Sound(self.Secondary.Grenade.Sound), self:GetOwner():GetPos(), self:EntIndex(), CHAN_WEAPON, self.Secondary.Volume)
  -- Recoil (Player)
  --if not self:GetOwner():IsNPC() and not self:GetOwner():IsNextBot() then
  if self:GetOwner():IsPlayer() then
    local r1 = self.Secondary.Recoil * -1
    local r2 = self.Secondary.Recoil * math.random(-1, 1)
    self:GetOwner():ViewPunch(Angle(r1, r2, r1))
  end

  self:SetNextPrimaryFire(CurTime() + (self.Secondary.Grenade.Delay / 2))
  self:SetNextSecondaryFire(CurTime() + self.Secondary.Grenade.Delay)
end

--
-- Reload
--
function SWEP:Reload()
  if not IsFirstTimePredicted() or not self:GetOwner():KeyPressed(IN_RELOAD) or self:GetNextPrimaryFire() > CurTime() then return end
  local val = self.Secondary.Mode + 1
  if val > 3 or val < 0 then
    val = 0
  end

  self.Secondary.Mode = val
  if SERVER then
    net.Start("SCAPC_ChangeMode")
    net.WriteUInt(val, 3)
    net.Send(self:GetOwner())
  end
end

--
-- Helper function
--
function CreateRandomString()
  local length = 6
  local result = {}
  for i = 0, length do
    result[i] = string.char(math.random(65, 90))
  end

  return table.concat(result)
end

function SWEP:RemoveMissile()
  local owner = self:GetOwner()
  local missiles = ents.FindInCone(owner:GetPos(), owner:GetAimVector(), 8000, math.cos(math.rad(2.2)))
  local d = DamageInfo()
  d:SetDamage(9999)
  d:SetDamageType(DMG_MISSILEDEFENSE)
  d:SetAttacker(owner)
  d:SetInflictor(self)
  for k, v in pairs(missiles) do
    if v:GetClass():match("_missile") then
      v:TakeDamageInfo(d)
    end
  end
end
