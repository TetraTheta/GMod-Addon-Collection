hook.Add("PlayerSpawn", "FixMap_ML02_ep1_eeh", function(ply, _)
  if SERVER and (game.GetMap() == "ep1_eeh") then
    ply:Give("item_suit", false)
    ply:Give("weapon_pistol", false)
    ply:Give("weapon_smg1", false)
    ply:Give("weapon_stunstick", false)
    ply:Give("weapon_physcannon", false)
  end
end)
