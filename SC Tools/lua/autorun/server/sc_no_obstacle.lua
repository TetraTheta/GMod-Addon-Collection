--[[
  ConVars:
  * sc_no_obstacle <0|1> - Disable collision check for obstacle objects
--]]
include("autorun/sc_tools_shared.lua")
local function SetCG(e)
  e:SetCollisionGroup(COLLISION_GROUP_WORLD)
end

timer.Create("SCNoObstacle", 0.1, 0, function()
  local cv = GetConVar("sc_no_obstacle"):GetBool()
  if cv then
    for _, e in ipairs(ents.GetAll()) do
      if e:GetClass() == "prop_physics" then
        if bit.band(e:GetSpawnFlags(), SF_PHYSPROP_IS_GIB) > 0 or SC_SMALL_MODELS[e:GetModel()] then
          SetCG(e)
        else
          for d, _ in pairs(SC_SMALL_MODELS_DIRS) do
            if string.StartsWith(e:GetModel(), d) then SetCG(e) end
          end
        end
      elseif e:GetClass() == "gibs" then
        SetCG(e)
      elseif e:GetClass() == "prop_ragdoll" then
        SetCG(e)
      end
    end
  end
end)
