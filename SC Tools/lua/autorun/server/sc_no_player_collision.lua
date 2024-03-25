--[[
  ConVars:
  * sc_no_player_collision <0|1> - Disable player-to-player collision.
--]]
hook.Add("PlayerTick", "NoPlayerCollision", function(ply, _)
  if GetConVar("sc_no_player_collision"):GetInt() == 1 then
    ply:SetCollisionGroup(COLLISION_GROUP_PASSABLE_DOOR)
  else
    ply:SetCollisionGroup(COLLISION_GROUP_NONE)
  end

  ply:SetAvoidPlayers(false)
end)
