-- Custom implementation of 'trigger_changelevel' that doesn't require 'info_landmark'
--
DEFINE_BASECLASS("sc_point")
ENT.Base = "sc_point"
ENT.Type = "point"
--
function ENT:InputChangeLevel(_, _, _)
  local nmap = self.Map
  if nmap then
    print("[sc_changelevel] Changing level to " .. nmap .. "...")
    game.ConsoleCommand("map " .. nmap .. "\n")
  else
    print("[sc_changelevel] 'map' of 'sc_changelevel' is empty!")
  end
end

function ENT:KeyValue(key, value)
  if key:lower() == "map" then
    self.Map = value
  else
    self[key] = value
  end
end

function ENT:PreInitialize()
  self.Map = ""
end