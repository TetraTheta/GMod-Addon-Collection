-- For both Server and Client
-- ConVar
if not ConVarExists("sc_zinv") then
  local flags = {FCVAR_ARCHIVE, FCVAR_SERVER_CAN_EXECUTE, FCVAR_REPLICATED, FCVAR_NOTIFY}
  CreateConVar("sc_zinv", "0", flags, "Toggle NPC Invasion (0 = disable, 1 = enable)")
end

if not SERVER then return end
-- Server only
net.Receive(
  "npc_invasion_changecvar",
  function(len, ply)
    if not (ply:IsValid() and ply:IsPlayer() and ply:IsSuperAdmin()) then return end
    command = net.ReadString()
    if command == "sc_zinv" then
      RunConsoleCommand("sc_zinv", net.ReadFloat())
    end
  end
)
