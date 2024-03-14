local flags = {FCVAR_ARCHIVE, FCVAR_SERVER_CAN_EXECUTE, FCVAR_REPLICATED, FCVAR_NOTIFY}
--
-- sc_auto_god_npc <0|1> - Automatically make NPC in campaign maps invulnerable.
--
local scAutoGodNPC = "sc_auto_god_npc"
if not ConVarExists(scAutoGodNPC) then CreateConVar(scAutoGodNPC, "0", flags, "Automatically make NPC in campaign maps invulnerable.", 0, 1) end
--
-- sc_auto_god_sadmin <0|1> - Automatically make users in 'superadmin' user group invulnerable.
--
local scAutoGodSAdmin = "sc_auto_god_sadmin"
if not ConVarExists(scAutoGodSAdmin) then CreateConVar(scAutoGodSAdmin, "0", flags, "Automatically make users in 'superadmin' user group invulnerable.", 0, 1) end
--
-- sc_connection_message <0|1> - Show connection message to chat.
--
local scConnectionMessage = "sc_connection_message"
if not ConVarExists(scConnectionMessage) then CreateConVar(scConnectionMessage, "0", flags, "Show connection message to chat.", 0, 1) end
--
-- sc_flashlight_auto <0|1|2> - Automatically enable flashlight to players. 0 = Disable, 1 = Super Admin Only, 2 = All Players.
--
local scFlashlightAuto = "sc_flashlight_auto"
if not ConVarExists(scFlashlightAuto) then CreateConVar(scFlashlightAuto, "0", flags, "Automatically enable flashlight to players. 0 = Disable, 1 = Super Admin Only, 2 = All Players.", 0, 2) end
--
-- sc_ignore_important <0|1> - Ignore 'important' flag of NPC
--
local scIgnoreImportant = "sc_ignore_important"
if not ConVarExists(scIgnoreImportant) then CreateConVar(scIgnoreImportant, "0", flags, "Ignore 'important' flag of NPC", 0, 1) end
--
-- sc_no_player_collision <0|1> - Disable player-to-player collision.
--
local scNoPlayerCollision = "sc_no_player_collision"
if not ConVarExists(scNoPlayerCollision) then CreateConVar(scNoPlayerCollision, "0", flags, "Disable player-to-player collision.", 0, 1) end
--
-- sc_remove_effect <0|1> - Entity remove effect type. 0 = Remove, 1 = Dissolve.
--
local scRemoveEffect = "sc_remove_effect"
if not ConVarExists(scRemoveEffect) then CreateConVar(scRemoveEffect, "0", flags, "Entity remove effect type. 0 = Remove, 1 = Dissolve.", 0, 1) end
--
-- ConVar Change
--
if SERVER then
  net.Receive("sc_convar_change", sc_convar_change)
  function sc_convar_change(len, ply)
    if not (IsValid(ply) and ply:IsPlayer() and ply:IsSuperAdmin()) then return end
    local cmd = net.ReadString()
    if cmd == scAutoGodNPC then
      RunConsoleCommand(scAutoGodNPC, net.ReadInt())
    elseif cmd == scAutoGodSAdmin then
      RunConsoleCommand(scAutoGodSAdmin, net.ReadInt())
    elseif cmd == scConnectionMessage then
      RunConsoleCommand(scConnectionMessage, net.ReadInt())
    elseif cmd == scFlashlightAuto then
      RunConsoleCommand(scFlashlightAuto, net.ReadInt())
    elseif cmd == scIgnoreImportant then
      RunConsoleCommand(scIgnoreImportant, net.ReadInt())
    elseif cmd == scNoPlayerCollision then
      RunConsoleCommand(scNoPlayerCollision, net.ReadInt())
    elseif cmd == scRemoveEffect then
      RunConsoleCommand(scRemoveEffect, net.ReadInt())
    end
  end
end

if CLIENT then
  --TODO: craete concommand which has same name with convar which sends net msg.
  print(".")
end
