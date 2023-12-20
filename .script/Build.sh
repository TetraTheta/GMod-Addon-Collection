#!/bin/bash
gmad="E:\Program Files\Steam\steamapps\common\GarrysMod\bin\gmad.exe"
mkdir -p "./.build"
#"$gmad" create -folder "../Decrease Sound" -out "./.build/decrease_sound.gma"
#"$gmad" create -folder "../GMod Admin Gun" -out "./.build/gmod_admin_gun.gma"
#"$gmad" create -folder "../NPC Invasion" -out "./.build/npc_invasion.gma"
#"$gmad" create -folder "../Sandbox Map Sort" -out "./.build/sandbox_map_sort.gma"
"$gmad" create -folder "../SC Tools" -out "./.build/sc_tools.gma"
read -r -s -n 1 -p "Press any key to continue..."
