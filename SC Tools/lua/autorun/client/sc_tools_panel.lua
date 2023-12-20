-- https://github.com/Facepunch/garrysmod/blob/master/garrysmod/gamemodes/sandbox/gamemode/spawnmenu/controlpanel.lua#L148-L431
function sc_clean_panel(c)
  c:Help("SC Clean Tool")
  c:Button("All", "sc_clean", "all")
  c:Button("Ammo", "sc_clean", "ammo")
  c:Button("Debris", "sc_clean", "debris")
  c:Button("Decals", "sc_clean", "decal")
  c:Button("Gibs", "sc_clean", "gibs")
  c:Button("Health & Battery", "sc_clean", "powerups")
  c:Button("Ragdolls", "sc_clean", "ragdoll")
  c:Button("Small Objects", "sc_clean", "small")
  c:Button("Weapons", "sc_clean", "weapons")
  return c
end

function sc_setspeed_global_panel(c)
  -- Global Speed
  c:Help("Set global player speed.\nThis will only affect currently connected player.")
  c:Button("All Fast", "sc_setspeed", "all", "all", "fast")
  c:Button("All Reset", "sc_setspeed", "all", "all", "reset")
  c:Button("Duck Fast", "sc_setspeed", "all", "duck", "fast")
  c:Button("Duck Reset", "sc_setspeed", "all", "duck", "reset")
  c:Button("Run Fast", "sc_setspeed", "all", "run", "fast")
  c:Button("Run Reset", "sc_setspeed", "all", "run", "reset")
  c:Button("Slow Fast", "sc_setspeed", "all", "slow", "fast")
  c:Button("Slow Reset", "sc_setspeed", "all", "slow", "reset")
  c:Button("Walk Fast", "sc_setspeed", "all", "walk", "fast")
  c:Button("Walk Reset", "sc_setspeed", "all", "walk", "reset")
  return c
end

function sc_setspeed_player_panel(c)
  c:Help("Set per-player speed.")
  local combo, _ = c:ComboBox("Select player", nil)
  combo:SetMinimumSize(nil, 25)
  for _, v in ipairs(player.GetHumans()) do
    combo:AddChoice(v:Name())
  end
  combo:SetValue(LocalPlayer():Name())
  local sel = combo:GetSelected()
  c:Button("All Fast", "sc_setspeed", sel, "all", "fast")
  c:Button("All Reset", "sc_setspeed", sel, "all", "reset")
  c:Button("Duck Fast", "sc_setspeed", sel, "duck", "fast")
  c:Button("Duck Reset", "sc_setspeed", sel, "duck", "reset")
  c:Button("Run Fast", "sc_setspeed", sel, "run", "fast")
  c:Button("Run Reset", "sc_setspeed", sel, "run", "reset")
  c:Button("Slow Fast", "sc_setspeed", sel, "slow", "fast")
  c:Button("Slow Reset", "sc_setspeed", sel, "slow", "reset")
  c:Button("Walk Fast", "sc_setspeed", sel, "walk", "fast")
  c:Button("Walk Reset", "sc_setspeed", sel, "walk", "reset")

  return c
end

function sc_setting_panel(c)
  c:Help("Adjust ConVar of SC Tools")
  c:CheckBox("Automatically enable flashlight to all players.", "sc_flashlight_auto")
  c:CheckBox("Disable player-to-player collision.", "sc_no_player_collision")
  c:CheckBox("Automatically make NPC\nin campaign maps invulnerable.", "sc_auto_god_npc")
  c:CheckBox("Automatically make users\nin 'superadmin' user group invulnerable.", "sc_auto_god_sadmin")
  c:CheckBox("Ignore 'important' flag of NPC", "sc_ignore_important")
  return c
end

hook.Add("PopulateToolMenu", "sc_tools", function()
  spawnmenu.AddToolMenuOption("Utilities", "SC Tools", "sc_tools_settings", "Settings", "", "", sc_setting_panel, {})
  spawnmenu.AddToolMenuOption("Utilities", "SC Tools", "sc_tools_clean", "Clean", "", "", sc_clean_panel, {})
  spawnmenu.AddToolMenuOption("Utilities", "SC Tools", "sc_tools_setspeed_global", "Set Speed", "", "", sc_setspeed_global_panel, {})
  spawnmenu.AddToolMenuOption("Utilities", "SC Tools", "sc_tools_setspeed_player", "Set Speed (Player)", "", "", sc_setspeed_player_panel, {})
end)
hook.Add("SpawnMenuOpened", "sc_tools", function()
  spawnmenu.AddToolMenuOption("Utilities", "SC Tools", "sc_tools_setspeed_player", "Set Speed (Player)", "", "", sc_setspeed_player_panel, {})
end)
