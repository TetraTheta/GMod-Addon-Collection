#!/bin/bash
dest="E:/Program Files/Steam/steamapps/common/GarrysMod/garrysmod/addons/test"
mkdir -p "$dest"
mv -fv "./.build/decrease_sound.gma" "$dest" 2>/dev/null
mv -fv "./.build/gmod_admin_gun.gma" "$dest" 2>/dev/null
mv -fv "./.build/npc_invasion.gma" "$dest" 2>/dev/null
mv -fv "./.build/sandbox_map_sort.gma" "$dest" 2>/dev/null
mv -fv "./.build/sc_tools.gma" "$dest" 2>/dev/null
read -r -s -n 1 -p "Press any key to continue..."
