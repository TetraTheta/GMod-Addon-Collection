-- Addon can't touch Menu. This must be done in overwrite.
local MapPatterns = {}
local MapNames = {}
local AddonMaps = {}
local function UpdateMaps()
  MapPatterns = {}
  MapNames = {}
  --
  -- Custom map list START
  --
  -- Collection of abstract maps because I don't want them in the Others category
  MapNames["abstract_hallways"] = "Abstract Maps"
  MapNames["amnesialona"] = "Abstract Maps"
  MapNames["failing_boundaries"] = "Abstract Maps"
  MapNames["hylophobia_old"] = "Abstract Maps"
  MapNames["hylophobia_winter"] = "Abstract Maps"
  MapNames["hylophobia"] = "Abstract Maps"
  MapNames["hypnagogia"] = "Abstract Maps"
  MapNames["hypnophobia"] = "Abstract Maps"
  MapNames["insomnia"] = "Abstract Maps"
  MapNames["mnemophobia_ch1"] = "Abstract Maps"
  MapNames["mnemophobia_ch2"] = "Abstract Maps"
  MapNames["mnemophobia_lite"] = "Abstract Maps"
  MapNames["mnemophobia"] = "Abstract Maps"
  MapNames["paranoia"] = "Abstract Maps"
  MapNames["somnolence"] = "Abstract Maps"
  MapNames["sp_middle_final"] = "Abstract Maps"
  -- Aberration
  MapNames["ab_map1"] = "Aberration"
  MapNames["ab_map2"] = "Aberration"
  MapNames["ab_map3b"] = "Aberration"
  MapNames["ab_map4"] = "Aberration"
  -- Aerial Harassment
  MapNames["aerialharassment1"] = "Aerial Harassment"
  MapNames["aerialharassment2"] = "Aerial Harassment"
  -- Another Universe
  MapNames["another_universe_1"] = "Another Universe"
  MapNames["another_universe_2"] = "Another Universe"
  MapNames["another_universe_3"] = "Another Universe"
  MapNames["another_universe_4"] = "Another Universe"
  MapNames["another_universe_5"] = "Another Universe"
  MapNames["another_universe_6"] = "Another Universe"
  MapNames["another_universe_7"] = "Another Universe"
  MapNames["another_universe_8"] = "Another Universe"
  MapNames["another_universe_9"] = "Another Universe"
  MapNames["another_universe_10"] = "Another Universe"
  -- Antlions Everywhere
  MapNames["brighe"] = "Antlions Everywhere"
  MapNames["city-s"] = "Antlions Everywhere"
  MapNames["kleiner"] = "Antlions Everywhere"
  MapNames["mine_01_00"] = "Antlions Everywhere"
  MapNames["mine_01_04"] = "Antlions Everywhere"
  MapNames["mine_01_05_demo"] = "Antlions Everywhere"
  MapNames["mine_01_05"] = "Antlions Everywhere"
  MapNames["mine_01_07"] = "Antlions Everywhere"
  MapNames["mine01_01"] = "Antlions Everywhere"
  MapNames["mine01_02"] = "Antlions Everywhere"
  MapNames["mine01_03"] = "Antlions Everywhere"
  MapNames["mine01_06"] = "Antlions Everywhere"
  -- Avenue Odessa
  MapNames["avenueodessa"] = "Avenue Odessa"
  MapNames["avenueodessa2"] = "Avenue Odessa"
  -- Baryonic Predicament
  MapNames["silly_map1"] = "Baryonic Predicament"
  MapNames["silly_map2"] = "Baryonic Predicament"
  MapNames["silly_map3"] = "Baryonic Predicament"
  MapNames["silly_map4"] = "Baryonic Predicament"
  -- Blasted Lands
  MapNames["bl1"] = "Blasted Lands"
  MapNames["bl2"] = "Blasted Lands"
  MapNames["bl3"] = "Blasted Lands"
  MapNames["bl4"] = "Blasted Lands"
  MapNames["bl5"] = "Blasted Lands"
  MapNames["bl6"] = "Blasted Lands"
  -- Bunker 66
  MapNames["intro1"] = "Bunker 66"
  MapNames["level_2_01"] = "Bunker 66"
  MapNames["level_2_02"] = "Bunker 66"
  MapNames["level_2_03"] = "Bunker 66"
  MapNames["level_3"] = "Bunker 66"
  MapNames["level_3_01"] = "Bunker 66"
  MapNames["level_3_02"] = "Bunker 66"
  MapNames["level_4"] = "Bunker 66"
  MapNames["level_5_01"] = "Bunker 66"
  MapNames["level_5_02"] = "Bunker 66"
  MapNames["level_5_03"] = "Bunker 66"
  MapNames["level_6"] = "Bunker 66"
  MapNames["outro"] = "Bunker 66"
  -- Campaigns because I don't want them in the Others category
  MapNames["admin_raid_a"] = "Campaigns" -- Overheid
  MapNames["anti-citizen_ch1_18"] = "Campaigns"
  MapNames["cmpg_escape"] = "Campaigns"
  MapNames["combinecountry"] = "Campaigns"
  MapNames["courage"] = "Campaigns"
  MapNames["dead_end_road"] = "Campaigns"
  MapNames["dontstop"] = "Campaigns"
  MapNames["formoney"] = "Campaigns"
  MapNames["gee_milestone4"] = "Campaigns"
  MapNames["kallaim"] = "Campaigns"
  MapNames["kraken"] = "Campaigns"
  MapNames["lakeside_village"] = "Campaigns"
  MapNames["outpost16_01"] = "Campaigns"
  MapNames["outpost16_02"] = "Campaigns"
  MapNames["overrun"] = "Campaigns"
  MapNames["raid_on_nova_prison_gmod"] = "Campaigns"
  MapNames["saint_blackmountain_map3"] = "Campaigns"
  MapNames["shadowwalker_hvt"] = "Campaigns"
  MapNames["shadowwalker2_maplabs"] = "Campaigns"
  MapNames["streetstuck"] = "Campaigns"
  MapNames["third_party"] = "Campaigns"
  MapNames["train_station_zombies_campaign"] = "Campaigns"
  MapNames["tt17_xblah"] = "Campaigns" -- Weighing Nine Cinderblocks
  MapNames["whoopservatory"] = "Campaigns"
  -- City 25
  MapNames["city25_01"] = "City 25"
  MapNames["city25_02"] = "City 25"
  MapNames["city25_03"] = "City 25"
  -- COMBAT-ALPHA EP.1
  MapNames["c1_m1_gare"] = "COMBAT-ALPHA EP.1"
  MapNames["c1_m2_train"] = "COMBAT-ALPHA EP.1"
  MapNames["c1-c2_transition"] = "COMBAT-ALPHA EP.1"
  MapNames["c2_m1_lac"] = "COMBAT-ALPHA EP.1"
  MapNames["c2_m2_canal"] = "COMBAT-ALPHA EP.1"
  MapNames["c2_m2_canal_2"] = "COMBAT-ALPHA EP.1"
  MapNames["c2_m3_foret"] = "COMBAT-ALPHA EP.1"
  MapNames["c2_m4_underground"] = "COMBAT-ALPHA EP.1"
  MapNames["c2_m5_pont"] = "COMBAT-ALPHA EP.1"
  MapNames["c2_m6_barrage"] = "COMBAT-ALPHA EP.1"
  MapNames["c2_m7_tunnel"] = "COMBAT-ALPHA EP.1"
  MapNames["c3_m1_arrivee"] = "COMBAT-ALPHA EP.1"
  MapNames["c3_m2_surface"] = "COMBAT-ALPHA EP.1"
  MapNames["c3_m3_communication"] = "COMBAT-ALPHA EP.1"
  MapNames["c3_m4_antennes"] = "COMBAT-ALPHA EP.1"
  MapNames["c3_m5_transmission"] = "COMBAT-ALPHA EP.1"
  -- Combine Destiny
  MapNames["cd0"] = "Combine Destiny"
  MapNames["cd1"] = "Combine Destiny"
  MapNames["cd10"] = "Combine Destiny"
  MapNames["cd12"] = "Combine Destiny"
  MapNames["cd13"] = "Combine Destiny"
  MapNames["cd14"] = "Combine Destiny"
  MapNames["cd15"] = "Combine Destiny"
  MapNames["cd2_1"] = "Combine Destiny"
  MapNames["cd2_2"] = "Combine Destiny"
  MapNames["cd2"] = "Combine Destiny"
  MapNames["cd3_1"] = "Combine Destiny"
  MapNames["cd3_2"] = "Combine Destiny"
  MapNames["cd3_3"] = "Combine Destiny"
  MapNames["cd3_4"] = "Combine Destiny"
  MapNames["cd4"] = "Combine Destiny"
  MapNames["cd5"] = "Combine Destiny"
  MapNames["cd6"] = "Combine Destiny"
  MapNames["cd7"] = "Combine Destiny"
  MapNames["cd8"] = "Combine Destiny"
  MapNames["cd9"] = "Combine Destiny"
  -- Coop Adventure Map
  MapNames["adventure_map_01"] = "Coop Adventure Map"
  MapNames["adventure_map2_01"] = "Coop Adventure Map"
  -- CombinationVile
  MapNames["canal_flight_ppmc_cv"] = "CombinationVile"
  MapNames["cvbonus_ppmc_cv"] = "CombinationVile"
  MapNames["the_nest_ppmc_cv"] = "CombinationVile"
  MapNames["volatile_energy_ppmc_cv"] = "CombinationVile"
  -- Dangerous World
  MapNames["dw_bonus_first"] = "Dangerous World"
  MapNames["dw_bonus_killbox"] = "Dangerous World"
  MapNames["dw_ep1_00"] = "Dangerous World"
  MapNames["dw_ep1_01"] = "Dangerous World"
  MapNames["dw_ep1_02"] = "Dangerous World"
  MapNames["dw_ep1_02a"] = "Dangerous World"
  MapNames["dw_ep1_03"] = "Dangerous World"
  MapNames["dw_ep1_03a"] = "Dangerous World"
  MapNames["dw_ep1_04"] = "Dangerous World"
  MapNames["dw_ep1_05"] = "Dangerous World"
  MapNames["dw_ep1_06"] = "Dangerous World"
  MapNames["dw_ep1_07"] = "Dangerous World"
  MapNames["dw_ep1_08"] = "Dangerous World"
  --MapNames["creators"] = "Dangerous World"
  -- Day Light
  MapNames["ep2_aquaduct-1_5_test"] = "Day Light"
  MapNames["ep2_aquaduct-2_5"] = "Day Light"
  MapNames["ep2_aquaduct-3_5"] = "Day Light"
  MapNames["ep2_aquaduct-4_5"] = "Day Light"
  -- Deep Down
  MapNames["ep2_deepdown_1"] = "Deep Down"
  MapNames["ep2_deepdown_2"] = "Deep Down"
  MapNames["ep2_deepdown_3"] = "Deep Down"
  MapNames["ep2_deepdown_4"] = "Deep Down"
  MapNames["ep2_deepdown_5"] = "Deep Down"
  -- Drainage
  MapNames["drainage1"] = "Drainage"
  MapNames["drainage2"] = "Drainage"
  MapNames["drainage3"] = "Drainage"
  MapNames["drainage4"] = "Drainage"
  -- Dysnomitude
  MapNames["dysnomitude1"] = "Dysnomitude"
  MapNames["dysnomitude2"] = "Dysnomitude"
  -- Escape From VEIKKO
  MapNames["escapefromveikko"] = "Escape From VEIKKO"
  MapNames["escape_from_veikko_2"] = "Escape From VEIKKO"
  -- EXIT
  MapNames["e_01"] = "EXIT"
  MapNames["e_02"] = "EXIT"
  MapNames["e_03"] = "EXIT"
  MapNames["e_04"] = "EXIT"
  -- EXIT 2
  MapNames["e2_01"] = "EXIT 2"
  MapNames["e2_02"] = "EXIT 2"
  MapNames["e2_03"] = "EXIT 2"
  MapNames["e2_04"] = "EXIT 2"
  MapNames["e2_05"] = "EXIT 2"
  MapNames["e2_06"] = "EXIT 2"
  MapNames["e2_07"] = "EXIT 2"
  --MapNames["ex2_background"] = "EXIT 2"
  -- False Destination
  MapNames["d1_b1"] = "False Destination"
  MapNames["d1_b2"] = "False Destination"
  MapNames["d1_b3"] = "False Destination"
  MapNames["d1_b4"] = "False Destination"
  MapNames["d1_b5_new"] = "False Destination"
  MapNames["d1_b6"] = "False Destination"
  -- Fast Detect
  MapNames["p1l1"] = "Fast Detect"
  MapNames["p1l2"] = "Fast Detect"
  MapNames["p1l3"] = "Fast Detect"
  MapNames["p1l4"] = "Fast Detect"
  MapNames["p2l1"] = "Fast Detect"
  MapNames["p2l2"] = "Fast Detect"
  MapNames["p3l1"] = "Fast Detect"
  MapNames["p3l2"] = "Fast Detect"
  MapNames["p3l3"] = "Fast Detect"
  MapNames["p4l1"] = "Fast Detect"
  MapNames["p4l2"] = "Fast Detect"
  MapNames["p4l3"] = "Fast Detect"
  MapNames["p5l1"] = "Fast Detect"
  MapNames["p5l2"] = "Fast Detect"
  MapNames["p5l3"] = "Fast Detect"
  MapNames["p5l4"] = "Fast Detect"
  MapNames["p6l1"] = "Fast Detect"
  MapNames["p6l2"] = "Fast Detect"
  MapNames["p6l3"] = "Fast Detect"
  MapNames["p7l1"] = "Fast Detect"
  MapNames["p7l2"] = "Fast Detect"
  MapNames["p7l3"] = "Fast Detect"
  MapNames["p7l4"] = "Fast Detect"
  MapNames["p7l5"] = "Fast Detect"
  MapNames["p7l6"] = "Fast Detect"
  MapNames["p7l7"] = "Fast Detect"
  MapNames["p7l8"] = "Fast Detect"
  MapNames["p7l9"] = "Fast Detect"
  MapNames["p8l1"] = "Fast Detect"
  MapNames["p8l2"] = "Fast Detect"
  MapNames["p8l3"] = "Fast Detect"
  -- Final Project Diary
  MapNames["final_project_01"] = "Final Project Diary"
  MapNames["final_project_02"] = "Final Project Diary"
  MapNames["final_project_03"] = "Final Project Diary"
  MapNames["final_project_04"] = "Final Project Diary"
  MapNames["final_project_05"] = "Final Project Diary"
  MapNames["final_project_06"] = "Final Project Diary"
  MapNames["final_project_07"] = "Final Project Diary"
  MapNames["final_project_08"] = "Final Project Diary"
  MapNames["final_project_09"] = "Final Project Diary"
  MapNames["final_project_10"] = "Final Project Diary"
  MapNames["finalproject_00"] = "Final Project Diary"
  -- Fog (start: coop_fog_lab)
  MapNames["coop_fog_lab"] = "Fog"
  MapNames["coop_fog_city"] = "Fog"
  MapNames["fog_2_m1"] = "Fog"
  MapNames["fog_2_m2"] = "Fog"
  MapNames["fog_2_m3"] = "Fog"
  -- Half-Life 2: Calamity
  MapNames["sp_c14_1"] = "Half-Life 2: Calamity"
  MapNames["sp_c14_2"] = "Half-Life 2: Calamity"
  MapNames["sp_c14_3"] = "Half-Life 2: Calamity"
  MapNames["sp_c14_4"] = "Half-Life 2: Calamity"
  MapNames["sp_c14_5"] = "Half-Life 2: Calamity"
  -- Half-Life 2: Causality Effect
  MapNames["ce_01"] = "Half-Life 2: Causality Effect"
  MapNames["ce_02"] = "Half-Life 2: Causality Effect"
  MapNames["ce_03"] = "Half-Life 2: Causality Effect"
  MapNames["ce_04"] = "Half-Life 2: Causality Effect"
  MapNames["ce_05"] = "Half-Life 2: Causality Effect"
  MapNames["ce_06"] = "Half-Life 2: Causality Effect"
  MapNames["ce_07"] = "Half-Life 2: Causality Effect"
  -- Half-Life 2: Cosmonaut
  MapNames["cosmonaut00"] = "Half-Life 2: Cosmonaut"
  MapNames["cosmonaut01"] = "Half-Life 2: Cosmonaut"
  MapNames["cosmonaut02"] = "Half-Life 2: Cosmonaut"
  MapNames["cosmonaut03"] = "Half-Life 2: Cosmonaut"
  MapNames["cosmonaut04"] = "Half-Life 2: Cosmonaut"
  MapNames["cosmonaut05"] = "Half-Life 2: Cosmonaut"
  MapNames["cosmonaut06"] = "Half-Life 2: Cosmonaut"
  MapNames["cosmonaut07"] = "Half-Life 2: Cosmonaut"
  MapNames["cosmonaut08"] = "Half-Life 2: Cosmonaut"
  -- Half-Life 2: Death Whisper
  MapNames["deathwhisper_tlc18_c3"] = "Half-Life 2: Death Whisper"
  MapNames["deathwhisper_tlc18_c3_epilogue"] = "Half-Life 2: Death Whisper"
  -- Half-Life 2: Episode Three - The Closure
  MapNames["01_spymap_ep3"] = "Half-Life 2: Episode Three - The Closure"
  MapNames["02_spymap_ep3"] = "Half-Life 2: Episode Three - The Closure"
  MapNames["03_spymap_ep3"] = "Half-Life 2: Episode Three - The Closure"
  MapNames["04_spymap_ep3"] = "Half-Life 2: Episode Three - The Closure"
  MapNames["05_spymap_ep3"] = "Half-Life 2: Episode Three - The Closure"
  MapNames["06a_spymap_ep3"] = "Half-Life 2: Episode Three - The Closure"
  MapNames["06b_spymap_ep3"] = "Half-Life 2: Episode Three - The Closure"
  MapNames["07_spymap_ep3"] = "Half-Life 2: Episode Three - The Closure"
  MapNames["08_spymap_ep3"] = "Half-Life 2: Episode Three - The Closure"
  MapNames["09_spymap_ep3"] = "Half-Life 2: Episode Three - The Closure"
  MapNames["10_spymap_ep3"] = "Half-Life 2: Episode Three - The Closure"
  MapNames["11_spymap_ep3"] = "Half-Life 2: Episode Three - The Closure"
  MapNames["12_spymap_ep3"] = "Half-Life 2: Episode Three - The Closure"
  MapNames["13_spymap_ep3"] = "Half-Life 2: Episode Three - The Closure"
  MapNames["14_spymap_ep3"] = "Half-Life 2: Episode Three - The Closure"
  MapNames["15_spymap_ep3"] = "Half-Life 2: Episode Three - The Closure"
  MapNames["16_spymap_ep3"] = "Half-Life 2: Episode Three - The Closure"
  MapNames["17_spymap_ep3"] = "Half-Life 2: Episode Three - The Closure"
  MapNames["18_spymap_ep3"] = "Half-Life 2: Episode Three - The Closure"
  MapNames["19_spymap_ep3"] = "Half-Life 2: Episode Three - The Closure"
  MapNames["20_spymap_ep3"] = "Half-Life 2: Episode Three - The Closure"
  MapNames["21_spymap_ep3"] = "Half-Life 2: Episode Three - The Closure"
  MapNames["22_spymap_ep3"] = "Half-Life 2: Episode Three - The Closure"
  MapNames["23_spymap_ep3"] = "Half-Life 2: Episode Three - The Closure"
  MapNames["24_spymap_ep3"] = "Half-Life 2: Episode Three - The Closure"
  MapNames["25_spymap_ep3"] = "Half-Life 2: Episode Three - The Closure"
  MapNames["26_spymap_ep3"] = "Half-Life 2: Episode Three - The Closure"
  MapNames["27_spymap_ep3"] = "Half-Life 2: Episode Three - The Closure"
  MapNames["28_spymap_ep3"] = "Half-Life 2: Episode Three - The Closure"
  MapNames["29_spymap_ep3"] = "Half-Life 2: Episode Three - The Closure"
  MapNames["30_spymap_ep3"] = "Half-Life 2: Episode Three - The Closure"
  MapNames["31_spymap_ep3"] = "Half-Life 2: Episode Three - The Closure"
  MapNames["32_spymap_ep3"] = "Half-Life 2: Episode Three - The Closure"
  MapNames["33_spymap_ep3"] = "Half-Life 2: Episode Three - The Closure"
  MapNames["34_spymap_ep3"] = "Half-Life 2: Episode Three - The Closure"
  MapNames["35_spymap_ep3"] = "Half-Life 2: Episode Three - The Closure"
  -- Half-Life 2: Off-World Relocation
  MapNames["offworld01_tlc18_c4"] = "Half-Life 2: Off-World Relocation"
  MapNames["offworld02_tlc18_c4"] = "Half-Life 2: Off-World Relocation"
  -- Half-Life 2: Uncertainty Principle
  MapNames["up_evening_a"] = "Half-Life 2: Uncertainty Principle"
  MapNames["up_evening_b"] = "Half-Life 2: Uncertainty Principle"
  MapNames["up_interference"] = "Half-Life 2: Uncertainty Principle"
  MapNames["up_night"] = "Half-Life 2: Uncertainty Principle"
  MapNames["up_retreat_a"] = "Half-Life 2: Uncertainty Principle"
  MapNames["up_retreat_b"] = "Half-Life 2: Uncertainty Principle"
  -- Leon SP Mappack
  MapNames["leonhl2_1"] = "Leon SP Mappack"
  MapNames["leonhl2_1b"] = "Leon SP Mappack"
  MapNames["leonhl2_1c"] = "Leon SP Mappack"
  MapNames["leonhl2_1d"] = "Leon SP Mappack"
  -- Live To Fight Another Day
  MapNames["smc_city_01"] = "Live To Fight Another Day"
  MapNames["smc_city_02"] = "Live To Fight Another Day"
  MapNames["smc_city_03"] = "Live To Fight Another Day"
  MapNames["smc_city_04"] = "Live To Fight Another Day"
  -- Lost
  MapNames["lost_part_1"] = "Lost"
  MapNames["lost_part_2a"] = "Lost"
  MapNames["lost_part_3"] = "Lost"
  MapNames["lost_part_4"] = "Lost"
  MapNames["lost_part_5"] = "Lost"
  MapNames["lost_part_6"] = "Lost"
  MapNames["lost_part_7"] = "Lost"
  -- Map Labs 03: RTSLVille
  MapNames["ml03_backcut"] = "Map Labs 03: RTSLVille"
  MapNames["ml03_backcut2"] = "Map Labs 03: RTSLVille"
  MapNames["ml03_bbrawl"] = "Map Labs 03: RTSLVille"
  MapNames["ml03_bruhmomentum"] = "Map Labs 03: RTSLVille"
  MapNames["ml03_cityescape"] = "Map Labs 03: RTSLVille"
  MapNames["ml03_cityescape2"] = "Map Labs 03: RTSLVille"
  MapNames["ml03_contshift"] = "Map Labs 03: RTSLVille"
  MapNames["ml03_contshift_bg"] = "Map Labs 03: RTSLVille"
  MapNames["ml03_guarddown"] = "Map Labs 03: RTSLVille"
  MapNames["ml03_map_title_here"] = "Map Labs 03: RTSLVille"
  MapNames["ml03_mine_mansion"] = "Map Labs 03: RTSLVille"
  MapNames["ml03_prospektor"] = "Map Labs 03: RTSLVille"
  MapNames["ml03_railway_industrial"] = "Map Labs 03: RTSLVille"
  MapNames["ml03_searchandrescue"] = "Map Labs 03: RTSLVille"
  MapNames["ml03_sradius"] = "Map Labs 03: RTSLVille"
  MapNames["ml03_ultracold01"] = "Map Labs 03: RTSLVille"
  MapNames["ml03_ultracold02"] = "Map Labs 03: RTSLVille"
  MapNames["storm_drain"] = "Map Labs 03: RTSLVille"
  -- Map Labs 09: Back on Track
  MapNames["ml09_amateur"] = "Map Labs 09: Back on Track"
  MapNames["ml09_amateur_2"] = "Map Labs 09: Back on Track"
  MapNames["ml09_doublebarreledfactor"] = "Map Labs 09: Back on Track"
  MapNames["ml09_extra_untilted"] = "Map Labs 09: Back on Track"
  MapNames["ml09_factory"] = "Map Labs 09: Back on Track"
  MapNames["ml09_factory_2"] = "Map Labs 09: Back on Track"
  MapNames["ml09_gristleizer"] = "Map Labs 09: Back on Track"
  MapNames["ml09_hotlinemetrocop"] = "Map Labs 09: Back on Track"
  MapNames["ml09_hurricane"] = "Map Labs 09: Back on Track"
  MapNames["ml09_hurricane2"] = "Map Labs 09: Back on Track"
  MapNames["ml09_in_stabilitea"] = "Map Labs 09: Back on Track"
  MapNames["ml09_lockdown_final"] = "Map Labs 09: Back on Track"
  MapNames["ml09_prisonerx"] = "Map Labs 09: Back on Track"
  MapNames["ml09_rawsewage"] = "Map Labs 09: Back on Track"
  MapNames["ml09_retreatandadvance"] = "Map Labs 09: Back on Track"
  MapNames["ml09_sabotage"] = "Map Labs 09: Back on Track"
  MapNames["ml09_scavenger_01"] = "Map Labs 09: Back on Track"
  MapNames["ml09_scavenger_02"] = "Map Labs 09: Back on Track"
  MapNames["ml09_steele01"] = "Map Labs 09: Back on Track"
  --MapNames["ml09_steele01_background"] = "Map Labs 09: Back on Track"
  MapNames["ml09_traplessmansion"] = "Map Labs 09: Back on Track"
  --MapNames["ml09_traplessmansion_background"] = "Map Labs 09: Back on Track"
  MapNames["ml09_trespasser"] = "Map Labs 09: Back on Track"
  -- Mega City One
  MapNames["c0_1_intro_edited_1"] = "Mega City One"
  MapNames["c1_1_ancient_dust_v3"] = "Mega City One"
  MapNames["c1_2_darklife"] = "Mega City One"
  MapNames["c2_1_country_road"] = "Mega City One"
  MapNames["c2_2_tunnels"] = "Mega City One"
  MapNames["c3_1_ravenmansion"] = "Mega City One"
  MapNames["c4_1_compromised_v2"] = "Mega City One"
  MapNames["c4_2_apps"] = "Mega City One"
  MapNames["c5_1_megastructure_v3"] = "Mega City One"
  MapNames["c5_2_core"] = "Mega City One"
  -- MINERVA: Metastasis
  MapNames["metastasis_1"] = "MINERVA: Metastasis"
  --MapNames["metastasis_1_background"] = "MINERVA: Metastasis"
  MapNames["metastasis_2"] = "MINERVA: Metastasis"
  MapNames["metastasis_3"] = "MINERVA: Metastasis"
  MapNames["metastasis_4a"] = "MINERVA: Metastasis"
  MapNames["metastasis_4b"] = "MINERVA: Metastasis"
  -- Mission Improbable
  MapNames["mimp1"] = "Mission Improbable"
  MapNames["mimp2"] = "Mission Improbable"
  MapNames["mimp3"] = "Mission Improbable"
  MapNames["mimp_intermission"] = "Mission Improbable"
  -- Mistake of Pythagoras
  MapNames["ks_background1"] = "Mistake of Pythagoras"
  MapNames["ks_background2"] = "Mistake of Pythagoras"
  MapNames["ks_background3"] = "Mistake of Pythagoras"
  MapNames["ks_mop_ledoux1"] = "Mistake of Pythagoras"
  MapNames["ks_mop_ledoux2"] = "Mistake of Pythagoras"
  MapNames["ks_mop_pita1"] = "Mistake of Pythagoras"
  MapNames["ks_mop_pita2"] = "Mistake of Pythagoras"
  MapNames["ks_mop_pita3"] = "Mistake of Pythagoras"
  MapNames["ks_mop_pita4"] = "Mistake of Pythagoras"
  MapNames["ks_mop_pita5"] = "Mistake of Pythagoras"
  MapNames["ks_mop_vill1"] = "Mistake of Pythagoras"
  MapNames["ks_mop_vill2"] = "Mistake of Pythagoras"
  MapNames["ks_mop_vill3"] = "Mistake of Pythagoras"
  -- Nestlings
  MapNames["nestlings1"] = "Nestlings"
  -- No Escape
  MapNames["m01"] = "No Escape"
  MapNames["m02"] = "No Escape"
  MapNames["m03"] = "No Escape"
  MapNames["m04"] = "No Escape"
  MapNames["m05"] = "No Escape"
  -- Offshore
  MapNames["islandbuggy"] = "Offshore"
  MapNames["islandbuggy2"] = "Offshore"
  MapNames["islandbuggy3"] = "Offshore"
  MapNames["islandbuggy4"] = "Offshore"
  MapNames["islandcitytrain"] = "Offshore"
  MapNames["islandcove"] = "Offshore"
  MapNames["islandcove2"] = "Offshore"
  MapNames["islandcove3"] = "Offshore"
  MapNames["islandescape"] = "Offshore"
  MapNames["islandescape2"] = "Offshore"
  MapNames["islandescape3"] = "Offshore"
  MapNames["islandlockdown"] = "Offshore"
  MapNames["islandlockdown2"] = "Offshore"
  MapNames["islandlockdown3"] = "Offshore"
  MapNames["islandlockdown4"] = "Offshore"
  MapNames["islandoverwhelmed"] = "Offshore"
  MapNames["islandoverwhelmed2"] = "Offshore"
  MapNames["islandplant"] = "Offshore"
  MapNames["islandplant2"] = "Offshore"
  MapNames["islandplant3"] = "Offshore"
  MapNames["islandplant4"] = "Offshore"
  MapNames["islandplant5"] = "Offshore"
  MapNames["islandresort"] = "Offshore"
  MapNames["islandresort2"] = "Offshore"
  MapNames["islandunderground"] = "Offshore"
  MapNames["islandunderground2"] = "Offshore"
  MapNames["islandunderground3"] = "Offshore"
  MapNames["islandunderground4"] = "Offshore"
  MapNames["islandunderground5"] = "Offshore"
  -- Omega Prison
  MapNames["po_map1"] = "Omega Prison"
  MapNames["po_map2"] = "Omega Prison"
  MapNames["po_map3"] = "Omega Prison"
  MapNames["po_map4"] = "Omega Prison"
  MapNames["po_map5"] = "Omega Prison"
  -- Precursor
  MapNames["r_map0"] = "Precursor"
  MapNames["r_map1"] = "Precursor"
  MapNames["r_map2"] = "Precursor"
  MapNames["r_map3"] = "Precursor"
  MapNames["r_map4"] = "Precursor"
  MapNames["r_map5"] = "Precursor"
  MapNames["r_map6"] = "Precursor"
  MapNames["r_map7"] = "Precursor"
  -- Provenance
  MapNames["p_g01"] = "Provenance"
  MapNames["p_g02"] = "Provenance"
  MapNames["p_m01"] = "Provenance"
  -- Pursoup's Synergy Campaign
  MapNames["level01_synb2_entryway_of_doom"] = "Pursoup's Synergy Campaign"
  MapNames["level02_synb2_tricks_and_traps"] = "Pursoup's Synergy Campaign"
  MapNames["level03_synb2_underground"] = "Pursoup's Synergy Campaign"
  MapNames["level04_synb2_across_the_darkness"] = "Pursoup's Synergy Campaign"
  MapNames["level05_synb2_diehard"] = "Pursoup's Synergy Campaign"
  MapNames["level06_synb2_base"] = "Pursoup's Synergy Campaign"
  MapNames["level07_synb2_scary_dark_house"] = "Pursoup's Synergy Campaign"
  MapNames["level08_synb2_a_place_to_die"] = "Pursoup's Synergy Campaign"
  MapNames["level09_synb2_choose_your_destiny"] = "Pursoup's Synergy Campaign"
  MapNames["level10_synb2_end_of_evil_part1_b1"] = "Pursoup's Synergy Campaign"
  -- Raventown
  MapNames["hl2_raventown"] = "Raventown"
  MapNames["hl2_raventown2"] = "Raventown"
  MapNames["hl2_raventown3"] = "Raventown"
  MapNames["hl2_raventown4"] = "Raventown"
  MapNames["hl2_raventown5"] = "Raventown"
  -- Rebel Story
  MapNames["c1_prison_01"] = "Rebel Story"
  MapNames["c1_prison_02b"] = "Rebel Story"
  MapNames["c1_prison_03b"] = "Rebel Story"
  -- Rebel Surge
  MapNames["city16_01"] = "Rebel Surge"
  MapNames["city16_02"] = "Rebel Surge"
  -- return
  MapNames["clone_chamber"] = "return"
  MapNames["mine_2"] = "return"
  MapNames["office_001"] = "return"
  MapNames["return_ch_1"] = "return"
  MapNames["return_ch_2"] = "return"
  MapNames["sceene_test"] = "return"
  MapNames["test"] = "return"
  -- Rubble
  MapNames["hl2_rubble"] = "Rubble"
  MapNames["hl2_rubble2"] = "Rubble"
  MapNames["hl2_rubble3"] = "Rubble"
  MapNames["hl2_rubble4"] = "Rubble"
  MapNames["hl2_rubble5"] = "Rubble"
  -- Shootbang
  MapNames["shootbang_1"] = "Shootbang"
  MapNames["shootbang_2"] = "Shootbang"
  MapNames["shootbang_3"] = "Shootbang"
  MapNames["shootbang_4"] = "Shootbang"
  MapNames["shootbang_5"] = "Shootbang"
  MapNames["shootbang_credits"] = "Shootbang"
  -- Sile
  MapNames["sile1"] = "Sile"
  MapNames["sile2"] = "Sile"
  -- Silesia
  MapNames["01_uvalno_villa"] = "Silesia"
  MapNames["02_uvalno_undertower"] = "Silesia"
  MapNames["03_uvalno_night"] = "Silesia"
  MapNames["04_uvalno_kd"] = "Silesia"
  MapNames["05_uvalno_roadway"] = "Silesia"
  MapNames["06_ov_hrabova"] = "Silesia"
  MapNames["07_ov_firm"] = "Silesia"
  MapNames["08_ov_pension"] = "Silesia"
  MapNames["09_ov_firm_hq"] = "Silesia"
  MapNames["10_out_robinson"] = "Silesia"
  MapNames["11_out_combine_resort"] = "Silesia"
  MapNames["12_uvalno_kd"] = "Silesia"
  MapNames["13_uvalno_night"] = "Silesia"
  MapNames["14_uvalno_houseyard"] = "Silesia"
  MapNames["15_uvalno_villa"] = "Silesia"
  MapNames["16_uvalno_undertower"] = "Silesia"
  MapNames["17_uvalno_kopec"] = "Silesia"
  -- SIREN
  MapNames["map-1"] = "SIREN"
  MapNames["map-1b"] = "SIREN"
  MapNames["map-2"] = "SIREN"
  MapNames["map-arrival"] = "SIREN"
  -- Slums
  MapNames["slums_1"] = "Slums"
  MapNames["slums_2"] = "Slums"
  MapNames["slums_3"] = "Slums"
  MapNames["slums_4"] = "Slums"
  MapNames["slums_5"] = "Slums"
  MapNames["slums_6"] = "Slums"
  MapNames["slums_7"] = "Slums"
  MapNames["slums_8"] = "Slums"
  MapNames["slums_9"] = "Slums"
  -- Somatic
  MapNames["somatic"] = "Somatic"
  -- Spherical Nightmares
  MapNames["sn_intro"] = "Spherical Nightmares"
  MapNames["sn_level01a"] = "Spherical Nightmares"
  MapNames["sn_level01b"] = "Spherical Nightmares"
  MapNames["sn_level02a"] = "Spherical Nightmares"
  MapNames["sn_level02b"] = "Spherical Nightmares"
  MapNames["sn_level03a"] = "Spherical Nightmares"
  MapNames["sn_level03b"] = "Spherical Nightmares"
  MapNames["sn_level04a"] = "Spherical Nightmares"
  MapNames["sn_outro"] = "Spherical Nightmares"
  -- Street Hazard
  MapNames["street_hazard_1"] = "Street Hazard"
  MapNames["street_hazard_2"] = "Street Hazard"
  MapNames["street_hazard_3"] = "Street Hazard"
  -- Survivor
  MapNames["s3_izombie"] = "Survivor"
  MapNames["s3_suvenir"] = "Survivor"
  MapNames["survivor3"] = "Survivor"
  MapNames["coast_final5"] = "Survivor"
  MapNames["s2_station"] = "Survivor"
  MapNames["promzone_final"] = "Survivor"
  MapNames["rus_road"] = "Survivor"
  MapNames["survivor_start"] = "Survivor"
  -- The Antagonist's Story
  MapNames["gm_antagoniststory"] = "The Antagonist's Story"
  MapNames["antagonistnovaprospekt_01"] = "The Antagonist's Story"
  -- The Citizen Returns
  MapNames["sp_base"] = "The Citizen Returns"
  MapNames["sp_c14_1"] = "The Citizen Returns"
  MapNames["sp_c14_2"] = "The Citizen Returns"
  MapNames["sp_c14_3"] = "The Citizen Returns"
  MapNames["sp_c14_4"] = "The Citizen Returns"
  MapNames["sp_c14_5"] = "The Citizen Returns"
  MapNames["sp_canal1"] = "The Citizen Returns"
  MapNames["sp_canal2"] = "The Citizen Returns"
  MapNames["sp_canyon"] = "The Citizen Returns"
  MapNames["sp_casino"] = "The Citizen Returns"
  MapNames["sp_casino2"] = "The Citizen Returns"
  MapNames["sp_ending"] = "The Citizen Returns"
  MapNames["sp_intro"] = "The Citizen Returns"
  MapNames["sp_postsquare"] = "The Citizen Returns"
  MapNames["sp_precasino"] = "The Citizen Returns"
  MapNames["sp_presquare"] = "The Citizen Returns"
  MapNames["sp_square"] = "The Citizen Returns"
  MapNames["sp_streetwar"] = "The Citizen Returns"
  MapNames["sp_streetwar2"] = "The Citizen Returns"
  MapNames["sp_streetwar3"] = "The Citizen Returns"
  MapNames["sp_waterplant"] = "The Citizen Returns"
  MapNames["sp_waterplant2"] = "The Citizen Returns"
  -- The Event in Village
  MapNames["village_01"] = "The Event in Village"
  MapNames["village_02"] = "The Event in Village"
  -- The Forgotten Journey Mod
  MapNames["apart"] = "The Forgotten Journey Mod"
  MapNames["captured"] = "The Forgotten Journey Mod"
  MapNames["gutter"] = "The Forgotten Journey Mod"
  MapNames["hazardtrip"] = "The Forgotten Journey Mod"
  MapNames["interlopers_jimonions"] = "The Forgotten Journey Mod"
  MapNames["overflow"] = "The Forgotten Journey Mod"
  MapNames["stormbringer"] = "The Forgotten Journey Mod"
  MapNames["transmission"] = "The Forgotten Journey Mod"
  -- The Fugitive
  MapNames["fugitive_1"] = "The Fugitive"
  MapNames["fugitive_2"] = "The Fugitive"
  MapNames["fugitive_3"] = "The Fugitive"
  MapNames["fugitive_4"] = "The Fugitive"
  MapNames["fugitive_5"] = "The Fugitive"
  MapNames["fugitive_6"] = "The Fugitive"
  MapNames["fugitive_7"] = "The Fugitive"
  MapNames["fugitive_8"] = "The Fugitive"
  MapNames["fugitive_9"] = "The Fugitive"
  -- The Gnome Heist
  MapNames["at03_xblah_gnome"] = "The Gnome Heist"
  -- The Masked Prisoner
  MapNames["mpr_010_arrival"] = "The Masked Prisoner"
  MapNames["mpr_020_infiltrate"] = "The Masked Prisoner"
  MapNames["mpr_030_sabotage"] = "The Masked Prisoner"
  MapNames["mpr_040_regroup"] = "The Masked Prisoner"
  MapNames["mpr_050_finale"] = "The Masked Prisoner"
  -- The Sewer
  MapNames["sewer1"] = "The Sewer"
  MapNames["sewer2"] = "The Sewer"
  MapNames["sewer3"] = "The Sewer"
  MapNames["sewer4"] = "The Sewer"
  MapNames["sewer5"] = "The Sewer"
  MapNames["sewer6"] = "The Sewer"
  MapNames["sewer7"] = "The Sewer"
  MapNames["sewer8"] = "The Sewer"
  -- tr1p
  MapNames["map1"] = "tr1p"
  MapNames["map2"] = "tr1p"
  MapNames["map3"] = "tr1p"
  MapNames["map4"] = "tr1p"
  MapNames["map5"] = "tr1p"
  -- Unexpected Conclution
  MapNames["ue_level00"] = "Unexpected Conclution"
  MapNames["ue_level01"] = "Unexpected Conclution"
  MapNames["ue_level01a"] = "Unexpected Conclution"
  MapNames["ue_level02"] = "Unexpected Conclution"
  MapNames["ue_level03"] = "Unexpected Conclution"
  MapNames["ue_level03a"] = "Unexpected Conclution"
  MapNames["ue_level04"] = "Unexpected Conclution"
  MapNames["ue_level04a"] = "Unexpected Conclution"
  MapNames["ue_level05"] = "Unexpected Conclution"
  MapNames["ue_level06"] = "Unexpected Conclution"
  MapNames["ue_level07"] = "Unexpected Conclution"
  MapNames["ue_level08"] = "Unexpected Conclution"
  MapNames["ue_level09a"] = "Unexpected Conclution"
  MapNames["ue_level09b"] = "Unexpected Conclution"
  MapNames["ue_level10"] = "Unexpected Conclution"
  MapNames["ue_level11a"] = "Unexpected Conclution"
  MapNames["ue_level11b"] = "Unexpected Conclution"
  MapNames["ue_level12a"] = "Unexpected Conclution"
  MapNames["ue_level12b"] = "Unexpected Conclution"
  MapNames["ue2_level01"] = "Unexpected Conclution"
  -- Unknown
  MapNames["d3_ambush_01"] = "Unknown Maps"
  MapNames["d3_collapse_01"] = "Unknown Maps"
  -- Unknown World
  MapNames["uw_1"] = "Unknown World"
  MapNames["uw_2"] = "Unknown World"
  MapNames["uw_3"] = "Unknown World"
  MapNames["uw_4"] = "Unknown World"
  MapNames["uw_5"] = "Unknown World"
  MapNames["uw_6"] = "Unknown World"
  MapNames["uw_7"] = "Unknown World"
  -- Unusual Adventure
  MapNames["unusual_adventure"] = "Unusual Adventure"
  MapNames["unusual_adventure2ep1"] = "Unusual Adventure"
  -- Zombie Escape
  MapNames["ze_"] = "Zombie Escape"
  --
  -- Custom map list END
  --
  MapNames["aoc_"] = "Age of Chivalry"
  MapNames["infra_"] = "INFRA"
  MapPatterns["^asi-"] = "Alien Swarm"
  MapNames["lobby"] = "Alien Swarm"
  MapNames["cp_docks"] = "Blade Symphony"
  MapNames["cp_parkour"] = "Blade Symphony"
  MapNames["cp_sequence"] = "Blade Symphony"
  MapNames["cp_terrace"] = "Blade Symphony"
  MapNames["cp_test"] = "Blade Symphony"
  MapNames["duel_"] = "Blade Symphony"
  MapNames["ffa_community"] = "Blade Symphony"
  MapNames["free_"] = "Blade Symphony"
  MapNames["practice_box"] = "Blade Symphony"
  MapNames["tut_training"] = "Blade Symphony"
  MapNames["lightstyle_test"] = "Blade Symphony"
  MapNames["ar_"] = "Counter-Strike"
  MapNames["cs_"] = "Counter-Strike"
  MapNames["de_"] = "Counter-Strike"
  MapNames["es_"] = "Counter-Strike"
  MapNames["fy_"] = "Counter-Strike"
  MapNames["gd_"] = "Counter-Strike"
  MapNames["dz_"] = "Counter-Strike"
  MapNames["training1"] = "Counter-Strike"
  MapNames["lobby_mapveto"] = "Counter-Strike"
  -- Various custom cs maps
  MapNames["35hp_"] = "Counter-Strike (Custom)"
  MapNames["aim_"] = "Counter-Strike (Custom)"
  MapNames["awp_"] = "Counter-Strike (Custom)"
  MapNames["am_"] = "Counter-Strike (Custom)"
  MapNames["fy_"] = "Counter-Strike (Custom)"
  MapNames["1v1_"] = "Counter-Strike (Custom)"
  MapNames["dod_"] = "Day Of Defeat"
  MapNames["ddd_"] = "Dino D-Day"
  MapNames["de_dam"] = "DIPRIP"
  MapNames["dm_city"] = "DIPRIP"
  MapNames["dm_refinery"] = "DIPRIP"
  MapNames["dm_supermarket"] = "DIPRIP"
  MapNames["dm_village"] = "DIPRIP"
  MapNames["ur_city"] = "DIPRIP"
  MapNames["ur_refinery"] = "DIPRIP"
  MapNames["ur_supermarket"] = "DIPRIP"
  MapNames["ur_village"] = "DIPRIP"
  MapNames["dys_"] = "Dystopia"
  MapNames["pb_dojo"] = "Dystopia"
  MapNames["pb_rooftop"] = "Dystopia"
  MapNames["pb_round"] = "Dystopia"
  MapNames["pb_urbandome"] = "Dystopia"
  MapNames["sav_dojo6"] = "Dystopia"
  MapNames["varena"] = "Dystopia"
  MapNames["d1_"] = "Half-Life 2"
  MapNames["d2_"] = "Half-Life 2"
  MapNames["d3_"] = "Half-Life 2"
  MapNames["dm_"] = "Half-Life 2: Deathmatch"
  MapNames["halls3"] = "Half-Life 2: Deathmatch"
  MapNames["ep1_"] = "Half-Life 2: Episode 1"
  MapNames["ep2_"] = "Half-Life 2: Episode 2"
  MapNames["ep3_"] = "Half-Life 2: Episode 3"
  MapNames["d2_lostcoast"] = "Half-Life 2: Lost Coast"
  MapPatterns["^c[%d]a"] = "Half-Life"
  MapPatterns["^t0a"] = "Half-Life"
  MapNames["boot_camp"] = "Half-Life Deathmatch"
  MapNames["bounce"] = "Half-Life Deathmatch"
  MapNames["crossfire"] = "Half-Life Deathmatch"
  MapNames["datacore"] = "Half-Life Deathmatch"
  MapNames["frenzy"] = "Half-Life Deathmatch"
  MapNames["lambda_bunker"] = "Half-Life Deathmatch"
  MapNames["rapidcore"] = "Half-Life Deathmatch"
  MapNames["snarkpit"] = "Half-Life Deathmatch"
  MapNames["stalkyard"] = "Half-Life Deathmatch"
  MapNames["subtransit"] = "Half-Life Deathmatch"
  MapNames["undertow"] = "Half-Life Deathmatch"
  MapNames["ins_"] = "Insurgency"
  MapNames["l4d_"] = "Left 4 Dead"
  MapPatterns["^c[%d]m"] = "Left 4 Dead 2"
  MapPatterns["^c1[%d]m"] = "Left 4 Dead 2"
  MapNames["curling_stadium"] = "Left 4 Dead 2"
  MapNames["tutorial_standards"] = "Left 4 Dead 2"
  MapNames["tutorial_standards_vs"] = "Left 4 Dead 2"
  MapNames["clocktower"] = "Nuclear Dawn"
  MapNames["coast"] = "Nuclear Dawn"
  MapNames["downtown"] = "Nuclear Dawn"
  MapNames["gate"] = "Nuclear Dawn"
  MapNames["hydro"] = "Nuclear Dawn"
  MapNames["metro"] = "Nuclear Dawn"
  MapNames["metro_training"] = "Nuclear Dawn"
  MapNames["oasis"] = "Nuclear Dawn"
  MapNames["oilfield"] = "Nuclear Dawn"
  MapNames["silo"] = "Nuclear Dawn"
  MapNames["sk_metro"] = "Nuclear Dawn"
  MapNames["training"] = "Nuclear Dawn"
  MapNames["bt_"] = "Pirates, Vikings, & Knights II"
  MapNames["lts_"] = "Pirates, Vikings, & Knights II"
  MapNames["te_"] = "Pirates, Vikings, & Knights II"
  MapNames["tw_"] = "Pirates, Vikings, & Knights II"
  MapNames["escape_"] = "Portal"
  MapNames["testchmb_"] = "Portal"
  MapNames["e1912"] = "Portal 2"
  MapPatterns["^mp_coop_"] = "Portal 2"
  MapPatterns["^sp_a"] = "Portal 2"
  MapNames["achievement_"] = "Team Fortress 2"
  MapNames["arena_"] = "Team Fortress 2"
  MapNames["cp_"] = "Team Fortress 2"
  MapNames["ctf_"] = "Team Fortress 2"
  MapNames["itemtest"] = "Team Fortress 2"
  MapNames["koth_"] = "Team Fortress 2"
  MapNames["mvm_"] = "Team Fortress 2"
  MapNames["pl_"] = "Team Fortress 2"
  MapNames["plr_"] = "Team Fortress 2"
  MapNames["rd_"] = "Team Fortress 2"
  MapNames["pd_"] = "Team Fortress 2"
  MapNames["sd_"] = "Team Fortress 2"
  MapNames["tc_"] = "Team Fortress 2"
  MapNames["tr_"] = "Team Fortress 2"
  MapNames["trade_"] = "Team Fortress 2"
  MapNames["pass_"] = "Team Fortress 2"
  MapNames["zpa_"] = "Zombie Panic! Source"
  MapNames["zpl_"] = "Zombie Panic! Source"
  MapNames["zpo_"] = "Zombie Panic! Source"
  MapNames["zps_"] = "Zombie Panic! Source"
  MapNames["zph_"] = "Zombie Panic! Source"
  MapNames["fof_"] = "Fistful of Frags"
  MapNames["cm_"] = "Fistful of Frags"
  MapNames["gt_"] = "Fistful of Frags"
  MapNames["tp_"] = "Fistful of Frags"
  MapNames["vs_"] = "Fistful of Frags"
  MapNames["bhop_"] = "Bunny Hop"
  MapNames["cinema_"] = "Cinema"
  MapNames["theater_"] = "Cinema"
  MapNames["xc_"] = "Climb"
  MapNames["deathrun_"] = "Deathrun"
  MapNames["dr_"] = "Deathrun"
  MapNames["fm_"] = "Flood"
  MapNames["gmt_"] = "GMod Tower"
  MapNames["gg_"] = "Gun Game"
  MapNames["scoutzknivez"] = "Gun Game"
  MapNames["ba_"] = "Jailbreak"
  MapNames["jail_"] = "Jailbreak"
  MapNames["jb_"] = "Jailbreak"
  MapNames["mg_"] = "Minigames"
  MapNames["pw_"] = "Pirate Ship Wars"
  MapNames["ph_"] = "Prop Hunt"
  MapNames["rp_"] = "Roleplay"
  MapNames["slb_"] = "Sled Build"
  MapNames["sb_"] = "Spacebuild"
  MapNames["slender_"] = "Stop it Slender"
  MapNames["gms_"] = "Stranded"
  MapNames["surf_"] = "Surf"
  MapNames["ts_"] = "The Stalker"
  MapNames["zm_"] = "Zombie Survival"
  MapNames["zombiesurvival_"] = "Zombie Survival"
  MapNames["zs_"] = "Zombie Survival"
  MapNames["coop_"] = "Cooperative"
  local GamemodeList = engine.GetGamemodes()
  for k, gm in ipairs(GamemodeList) do
    local Name = gm.title or "Unnammed Gamemode"
    local Maps = string.Split(gm.maps, "|")
    if Maps and gm.maps ~= "" then
      for k, pattern in ipairs(Maps) do
        -- When in doubt, just try to match it with string.find
        MapPatterns[string.lower(pattern)] = Name
      end
    end
  end

  AddonMaps = {}
  for k, addon in ipairs(engine.GetAddons()) do
    local name = addon.title or "Unnammed Addon"
    local files, folders = file.Find("maps/*.bsp", name)
    if #files > 0 then
      AddonMaps[name] = files
    end
  end
end

local favmaps
local function LoadFavourites()
  local cookiestr = cookie.GetString("favmaps")
  favmaps = favmaps or (cookiestr and string.Explode(";", cookiestr) or {})
end

function UpdateAddonMapList()
  local json = util.TableToJSON(AddonMaps)
  if not json then return end
  pnlMainMenu:Call("UpdateAddonMaps(" .. json .. ")")
end

-- Called from JS when starting a new game
function UpdateMapList()
  UpdateAddonMapList()
  local mapList = GetMapList()
  if not mapList then return end
  local json = util.TableToJSON(mapList)
  if not json then return end
  pnlMainMenu:Call("UpdateMaps(" .. json .. ")")
end

local IgnorePatterns = {"^background", "^devtest", "^ep1_background", "^ep2_background", "^styleguide",}
local IgnoreMaps = {
  -- Prefixes
  ["sdk_"] = true,
  ["test_"] = true,
  ["vst_"] = true,
  -- Maps
  ["c4a1y"] = true,
  ["credits"] = true,
  ["d2_coast_02"] = true,
  ["d3_c17_02_camera"] = true,
  ["ep1_citadel_00_demo"] = true,
  ["c5m1_waterfront_sndscape"] = true,
  ["intro"] = true,
  ["test"] = true,
  -- Other maps should be ignored
  ["creators"] = true,
  ["ex2_background"] = true,
  ["ml09_steele01_background"] = true,
  ["ml09_traplessmansion_background"] = true,
  ["metastasis_1_background"] = true,
}

local MapList = {}
local function RefreshMaps(skip)
  if not skip then
    UpdateMaps()
  end

  MapList = {}
  local maps = file.Find("maps/*.bsp", "GAME")
  LoadFavourites()
  for k, v in ipairs(maps) do
    local name = string.lower(string.gsub(v, "%.bsp$", ""))
    local prefix = string.match(name, "^(.-_)")
    local Ignore = IgnoreMaps[name] or IgnoreMaps[prefix]
    -- Don't loop if it's already ignored
    if Ignore then continue end
    for _, ignore in ipairs(IgnorePatterns) do
      if string.find(name, ignore) then
        Ignore = true
        break
      end
    end

    -- Don't add useless maps
    if Ignore then continue end
    -- Check if the map has a simple name or prefix
    local Category = MapNames[name] or MapNames[prefix]
    -- Check if the map has an embedded prefix, or is TTT/Sandbox
    if not Category then
      for pattern, category in pairs(MapPatterns) do
        if string.find(name, pattern) then
          Category = category
        end
      end
    end

    -- Throw all uncategorised maps into Other
    Category = Category or "Other"
    local fav
    if table.HasValue(favmaps, name) then
      fav = true
    end

    local csgo = false
    if Category == "Counter-Strike" then
      if file.Exists("maps/" .. name .. ".bsp", "csgo") then
        -- Map also exists in CS:GO
        if file.Exists("maps/" .. name .. ".bsp", "cstrike") then
          csgo = true
        else
          Category = "Counter-Strike: GO"
        end
      end
    end

    if not MapList[Category] then
      MapList[Category] = {}
    end

    table.insert(MapList[Category], name)
    if fav then
      if not MapList["Favourites"] then
        MapList["Favourites"] = {}
      end

      table.insert(MapList["Favourites"], name)
    end

    if csgo then
      if not MapList["Counter-Strike: GO"] then
        MapList["Counter-Strike: GO"] = {}
      end

      -- HACK: We have to make the CS:GO name different from the CS:S name to prevent Favourites conflicts
      table.insert(MapList["Counter-Strike: GO"], name .. " ")
    end
  end

  -- Send the new list to the HTML menu
  UpdateMapList()
end

-- Update only after a short while for when these hooks are called very rapidly back to back
local function DelayedRefreshMaps()
  timer.Create("menu_refreshmaps", 0.1, 1, RefreshMaps)
end

hook.Add("MenuStart", "FindMaps", DelayedRefreshMaps)
hook.Add("GameContentChanged", "RefreshMaps", DelayedRefreshMaps)
-- Nice maplist accessor instead of a global table
function GetMapList()
  return MapList
end

function ToggleFavourite(map)
  LoadFavourites()
  -- is favourite, remove it
  if table.HasValue(favmaps, map) then
    table.remove(favmaps, table.KeysFromValue(favmaps, map)[1])
  else -- not favourite, add it
    table.insert(favmaps, map)
  end

  cookie.Set("favmaps", table.concat(favmaps, ";"))
  RefreshMaps(true)
  UpdateMapList()
end

function SaveLastMap(map, cat)
  local t = string.Explode(";", cookie.GetString("lastmap", ""))
  if not map then
    map = t[1] or "gm_flatgrass"
  end

  if not cat then
    cat = t[2] or "Sandbox"
  end

  cookie.Set("lastmap", map .. ";" .. cat)
end

function LoadLastMap()
  local t = string.Explode(";", cookie.GetString("lastmap", ""))
  local map = t[1] or "gm_flatgrass"
  local cat = t[2] or "Sandbox"
  cat = string.gsub(cat, "'", "\\'")
  if not file.Exists("maps/" .. map .. ".bsp", "GAME") then return end
  pnlMainMenu:Call("SetLastMap('" .. map:JavascriptSafe() .. "','" .. cat:JavascriptSafe() .. "')")
end
