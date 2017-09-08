--
-- Addon       _mimi-name_obtained.lua
-- Author      marcob@marcob.org
-- StartDate   08/09/2017
--
local addon, mimi = ...

mimi.db  =  {}
mimi.db.name_obtained =  {}
mimi.db.name_obtained["Acalan"] = { obtained='Mob Drop', details='From killing a skeleton or construct in Scarlet Gorge.' }
mimi.db.name_obtained["Aftershock"] = { obtained='RIFT Store', details='Requires Saint Taranis: Revered' }
mimi.db.name_obtained["Agnion Euzonos"] = { obtained='PvP', details='From Marauders Supply Cache (gained by winning Lvl 60+ PvP Warfronts).' }
mimi.db.name_obtained["Ahgnox"] = { obtained='Puzzle', details='Gained from Nightmare Tide Puzzle chest after 1st time.' }
mimi.db.name_obtained["Airoldus"] = { obtained='Zone Event Drop', details='Cracking Xarth\'s Skull' }
mimi.db.name_obtained["Al"] = { obtained='RIFT Store', details='Requires Pelagic Order: Friendly' }
mimi.db.name_obtained["Alcander (A)"] = { obtained='RIFT Store', details='Gained for Credits under RIFT Store -> Pets -> Minions.' }
mimi.db.name_obtained["Anuxy"] = { obtained='RIFT Store', details='Requires Atragarians: Revered' }
mimi.db.name_obtained["Arcane Cannon"] = { obtained='Zone Event Drop', details='Cracking Xarth\'s Skull' }
mimi.db.name_obtained["Archaeologist Herim (A)"] = { obtained='Promo', details='"Complete ""Arclight Mastery"" Achievement during Arclight Infiltration Promo Week. Attracts Artifact Adventures."' }
mimi.db.name_obtained["Athelan the Fallen"] = { obtained='World Event', details='Gained from the Autumn Harvest Minion Adventure Chain that starts with Minion Card: Taskmaster Atrophinius.' }
mimi.db.name_obtained["Atrophinius"] = { obtained='World Event', details='"Fae Yule World Event 2014. Fae Yule 8hr Minion Adventure unlocked with ""2014 Fae Yule Minion Adventure Pack"" from RIFT Store -> World Event."' }
mimi.db.name_obtained["Atrophinius the Festive (H)"] = { obtained='Hidden Minion', details='"Please refer to the ""Hidden Minion Cards"" tab for full information."' }
mimi.db.name_obtained["Augustor"] = { obtained='Quest', details='One and Many Quest in Ghar Station Tau (Tarken Glacier).' }
mimi.db.name_obtained["Aurora"] = { obtained='Quest', details='Behold the Ascended at Ghar Station Mem in Goboro Reef' }
mimi.db.name_obtained["Azach"] = { obtained='RIFT Store', details='Gained from RIFT Store -> Pets -> Minions' }
mimi.db.name_obtained["Azumel"] = { obtained='World Event', details='From Autumn Harvest World Event 2014. Temporary found RIFT Store -> World Event' }
mimi.db.name_obtained["Baelnezum"] = { obtained='World Event', details='Gained from the Autumn Harvest Minion Adventure Chain that starts with Minion Card: Valzor.' }
mimi.db.name_obtained["Bea"] = { obtained='RIFT Store', details='Gained from RIFT Store -> Pets -> Minions' }
mimi.db.name_obtained["Billows (A)"] = { obtained='Crafted', details='RIFT Store -> Crafting -> Artificer. Use \'Minions\' filter.' }
mimi.db.name_obtained["Birch"] = { obtained='Achievement', details='Making Sense?' }
mimi.db.name_obtained["Bitey"] = { obtained='Rift Drop', details='Dropped from \'Invasive Species\' Hellbug lure during zone event in Silverwood for some1232.' }
mimi.db.name_obtained["Bloodroot the Feaster"] = { obtained='Zone Event Drop', details='Cracking Xarth\'s Skull' }
mimi.db.name_obtained["Bloop"] = { obtained='Promo', details='Comes with Infusion and Ultimate Nightmare Digitial Edition Packs' }
mimi.db.name_obtained["Bludfeng"] = { obtained='RIFT Store', details='Requires Pelagic Order: Decorated.' }
mimi.db.name_obtained["Breezy"] = { obtained='RIFT Store', details='Requires The Onir: Honored' }
mimi.db.name_obtained["C1-0N3"] = { obtained='Crafted', details='RIFT Store -> Crafting -> Apothecary. Use \'Minions\' filter.' }
mimi.db.name_obtained["Caeweth"] = { obtained='',
details='' }
mimi.db.name_obtained["Captain Dagon"] = { obtained='',
details='Summerfest' }
mimi.db.name_obtained["Carmine"] = { obtained='RIFT Store', details='Gained from RIFT Store -> Pets -> Minions' }
mimi.db.name_obtained["Cerulean Steel"] = { obtained='Crafted', details='RIFT Store -> Crafting -> Weaponsmith. Use \'Minions\' filter.' }
mimi.db.name_obtained["Comet"] = { obtained='Artifact Set', details='Rhen Coronation Memorabilia (65)' }
mimi.db.name_obtained["Connor"] = { obtained='Quest', details='Walkabout Father Quest in Draumheim' }
mimi.db.name_obtained["Courage"] = { obtained='Fishing', details='Fished up using Uncle Stan\'s Secret Lure or Lure of Planar Distortion.' }
mimi.db.name_obtained["Cresaphin"] = { obtained='Rift/IA Drop', details='Goboro Reef Instant Adventure. Rift Loot Bag. Also can be received from Nightmare Rift.' }
mimi.db.name_obtained["Crumpus"] = { obtained='Artifact Set', details='Snow Names (65)' }
mimi.db.name_obtained["Cynthae"] = { obtained='Rift Drop', details='Nightmare Rift drop. Received from Rift Loot Bag.' }
mimi.db.name_obtained["Dalkiros"] = { obtained='Rift Drop', details='Rift drop. No specific Rift. Received from Rift Loot Bag.' }
mimi.db.name_obtained["Dargal"] = { obtained='RIFT Store', details='Requires The Ghar: Honored' }
mimi.db.name_obtained["Dariah"] = { obtained='PvP', details='From Marauders Supply Cache (gained by winning Lvl 60+ PvP Warfronts)' }
mimi.db.name_obtained["Dead Simon"] = { obtained='Achievement', details='Pilfered Purses Achievement.' }
mimi.db.name_obtained["Deeps"] = { obtained='Achievement', details='Last Of The Litter' }
mimi.db.name_obtained["Desecrated Lanaria"] = { obtained='Rift Store', details='Requires Feilbokan: Revered' }
mimi.db.name_obtained["Dorald"] = { obtained='Achievement', details='Reef Ramble' }
mimi.db.name_obtained["Doreen (A)"] = { obtained='RIFT Store', details='Gained from RIFT Store -> Pets -> Minions' }
mimi.db.name_obtained["Drekanoth of Fate (H)"] = { obtained='Hidden Minion', details='"Please refer to the ""Hidden Minion Cards"" tab for full information."' }
mimi.db.name_obtained["Duke Arcarax"] = { obtained='Achievement', details='The devil you know' }
mimi.db.name_obtained["Eailziana"] = { obtained='Zone Event Drop', details='Cracking Xarth\'s Skull' }
mimi.db.name_obtained["Eelo"] = { obtained='PvP', details='From Marauders Supply Cache (gained by winning Lvl 60+ PvP Warfronts)' }
mimi.db.name_obtained["Eliam"] = { obtained='Lockbox', details='Chance drop from Lockboxes/Supply Crates' }
mimi.db.name_obtained["Ereetu"] = { obtained='Rift/Mob Drop', details='Normal mob on Ember Isle. Can also drop from Major Rift in Shimmersand.' }
mimi.db.name_obtained["Ewethanasia"] = { obtained='RIFT Store', details='Requires The Ghar: Friendly' }
mimi.db.name_obtained["Face Pull (A)"] = { obtained='RIFT Store', details='Gained from RIFT Store -> Pets -> Minions' }
mimi.db.name_obtained["Fang"] = { obtained='RIFT Store', details='Gained from RIFT Store -> Pets -> Minions' }
mimi.db.name_obtained["Floop"] = { obtained='Artifact Set', details='Clubs of Bottomtown (63)' }
mimi.db.name_obtained["Fluffy (H)"] = { obtained='Hidden Minion', details='"Please refer to the ""Hidden Minion Cards"" tab for full information."' }
mimi.db.name_obtained["Frederic Kain"] = { obtained='Lockbox', details='Chance drop from Lockboxes/Supply Crates' }
mimi.db.name_obtained["Gakakhis"] = { obtained='IA Drop', details='During Autumn Harvest from the event IAs' }
mimi.db.name_obtained["Gambahl (A)"] = { obtained='World Event', details='Gained from the Autumn Harvest Minion Adventure Chain that starts with Minion Card: Valzor.' }
mimi.db.name_obtained["Garn"] = { obtained='Achievement', details='All kobolds go to heaven' }
mimi.db.name_obtained["General Batua"] = { obtained='Puzzle', details='Tarken Glacier Puzzle drop.' }
mimi.db.name_obtained["Gil"] = { obtained='RIFT Store/Fishing', details='"From ""Minion Starter Pack"". Fished up using Uncle Stan\'s Secret Lure or Lure of Planar Distortion."' }
mimi.db.name_obtained["Goldgrille"] = { obtained='RIFT Store', details='Requires Cerulean Rhenke: Revered' }
mimi.db.name_obtained["Grace"] = { obtained='Fishing', details='Fished up using Uncle Stan\'s Secret Lure or Lure of Planar Distortion.' }
mimi.db.name_obtained["Greatfather Frost (H)"] = { obtained='Hidden Minion', details='"Please refer to the ""Hidden Minion Cards"" tab for full information."' }
mimi.db.name_obtained["Grendelkhan (H)"] = { obtained='Hidden Minion', details='"please refer to the ""Hidden Minion Cards"" tab for full information."' }
mimi.db.name_obtained["Grish (H)"] = { obtained='Hidden Minion', details='"Please refer to the ""Hidden Minion Cards"" tab for full information."' }
mimi.db.name_obtained["Gristlespitt"] = { obtained='Rift Store', details='Requires Mages of Alittu: Decorated' }
mimi.db.name_obtained["Gruell"] = { obtained='PvP', details='From Marauders Supply Cache (gained by winning Lvl 60+ PvP Warfronts)' }
mimi.db.name_obtained["Gurock"] = { obtained='IA Drop', details='Dropped from Freemarch Instant Adventure' }
mimi.db.name_obtained["Gust Front"] = { obtained='Rift Store', details='Requires Mages of Alittu: Revered' }
mimi.db.name_obtained["Haligan the Pyretouched"] = { obtained='World Event', details='Gained from the Autumn Harvest Minion Adventure Chain that starts with Minion Card: Taskmaster Atrophinius.' }
mimi.db.name_obtained["Herald Roklom"] = { obtained='PvP', details='From Marauders Supply Cache (gained by winning Lvl 60+ PvP Warfronts)' }
mimi.db.name_obtained["Hexathel"] = { obtained='Zone Event Drop', details='Cracking Xarth\'s Skull' }
mimi.db.name_obtained["Hogrol"] = { obtained='Mob Drop', details='Killing mobs in Stillmoor at Crown Hill.' }
mimi.db.name_obtained["Hollowood"] = { obtained='Rift Store', details='Requires Failbokan: Decorated' }
mimi.db.name_obtained["Hylas"] = { obtained='RIFT Store', details='Requires Manugo League: Decorated' }
mimi.db.name_obtained["Ich'kir"] = { obtained='RIFT Store', details='Requires Cerulean Rhenke: Honored' }
mimi.db.name_obtained["Ikaras"] = { obtained='Rift/IA Drop', details='Nightmare Rift drop. Received from Rift Loot Bag. Also found in Goboro Reef IA in Rift Loot Bag' }
mimi.db.name_obtained["Ilchorin"] = { obtained='PvP', details='From Marauders Supply Cache (gained by winning Lvl 60+ PvP Warfronts)' }
mimi.db.name_obtained["Infernowl"] = { obtained='RIFT Store', details='"From ""Minion Starter Pack"""' }
mimi.db.name_obtained["Inquisitor Garau"] = { obtained='RIFT Store', details='Requires Manugo League: Revered' }
mimi.db.name_obtained["Ionraic"] = { obtained='IA Drop', details='Dropped from Instant Adventure Caches.' }
mimi.db.name_obtained["Ithmyr"] = { obtained='Rift Drop', details='Nightmare Rift drop. Received from Nightmare Rift I Cache drop.' }
mimi.db.name_obtained["Ivory"] = { obtained='World Event', details='"Fae Yule World Event 2014. Fae Yule 8hr Minion Adventure unlocked with ""2014 Fae Yule Minion Adventure Pack"" from RIFT Store -> World Event."' }
mimi.db.name_obtained["Ivy"] = { obtained='RIFT Store', details='Gained from RIFT Store -> Pets -> Minions' }
mimi.db.name_obtained["IX-1 Defender"] = { obtained='Achievement', details='Unchained' }
mimi.db.name_obtained["Jacenda Cassana"] = { obtained='Rift/IA Drop', details='Nightmare Rift drop. Received from Rift Loot Bag. Also from Instant Adventures (Shimmersand/etc)' }
mimi.db.name_obtained["Jakub"] = { obtained='Lockbox', details='Chance drop from Lockboxes/Supply Crates' }
mimi.db.name_obtained["Jari"] = { obtained='Mob Drop', details='From Bogling in Moonshade Highlands. Can also drop from Lesser Golems in the same zone.' }
mimi.db.name_obtained["Jasper"] = { obtained='RIFT Store', details='Gained from RIFT Store -> Pets -> Minions' }
mimi.db.name_obtained["Jilleen"] = { obtained='PvP', details='From Marauders Supply Cache (gained by winning Lvl 60+ PvP Warfronts).' }
mimi.db.name_obtained["Jineth (A)"] = { obtained='Promo', details='"Complete ""Attractive Proposition"" Quest during Arclight Infiltration Promo Week. Attracts Artifact Adventures specific to the Promo Week"' }
mimi.db.name_obtained["Jolly Hellbug (A)"] = { obtained='World Event', details='Fae Yule World Event 2016' }
mimi.db.name_obtained["Joloral Ragetide"] = { obtained='PvP', details='From Marauders Supply Cache (gained by winning Lvl 60+ PvP Warfronts)' }
mimi.db.name_obtained["Kaerth"] = { obtained='Zone Event Drop', details='' }
mimi.db.name_obtained["Kallos"] = { obtained='Mob Drop', details='From Ridgeline Stoneface in Crescent Ridge - Shimmersand (so probs random mob drop)' }
mimi.db.name_obtained["Keavy (H)"] = { obtained='World Event', details='"Please refer to the ""Hidden Minion Cards"" tab for full information."' }
mimi.db.name_obtained["Kepple"] = { obtained='Fishing', details='Can be fished up using Stan\'s Super Secret Lure.' }
mimi.db.name_obtained["Kiljurn"] = { obtained='Achievement', details='Red Tide' }
mimi.db.name_obtained["Killthraxus"] = { obtained='Rift Store', details='Requires Bailghol: Decorated' }
mimi.db.name_obtained["King Derribec"] = { obtained='Lockbox', details='Chance drop from Lockboxes/Supply Crates' }
mimi.db.name_obtained["King Humbart"] = { obtained='Lockbox', details='Chance drop from Lockboxes/Supply Crates' }
mimi.db.name_obtained["Kithlik"] = { obtained='Achievement', details='Trudging Through The Tundra' }
mimi.db.name_obtained["Knifebeak"] = { obtained='Mob Drop', details='Dropped from rare mob Koglok in Droughtlands' }
mimi.db.name_obtained["Kolmasveli"] = { obtained='RIFT Store', details='Requires The Onir: Revered' }
mimi.db.name_obtained["Krass"] = { obtained='Rift/IA Drop', details='From Instant Adventure in Silverwood (probably other IAs as well) and from Nightmare Rifts.' }
mimi.db.name_obtained["Kre'll"] = { obtained='RIFT Store', details='Requires Pelagic Order: Honored' }
mimi.db.name_obtained["Lamonrian"] = { obtained='RIFT Store', details='Requires Atragarians: Honored' }
mimi.db.name_obtained["Lecu the Claw"] = { obtained='PvP', details='From Marauders Supply Cache (gained by winning Lvl 60+ PvP Warfronts)' }
mimi.db.name_obtained["Lil Reggie"] = { obtained='Rift Drop', details='Nightmare Rift drop. Received from Nightmare Rift Cache drop.' }
mimi.db.name_obtained["Living Vine Wall"] = { obtained='Zone Event Drop', details='Cracking Xarth\'s Skull' }
mimi.db.name_obtained["Lord Vyre"] = { obtained='Rift Drop', details='Nightmare Rift drop. Received from Nightmare Rift Cache drop.' }
mimi.db.name_obtained["Lucile (A)"] = { obtained='RIFT Store', details='Gained from RIFT Store -> Pets -> Minion' }
mimi.db.name_obtained["Lugglaga"] = { obtained='Rift Drop', details='Nightmare Rift drop. Received from Rift Loot Bag.' }
mimi.db.name_obtained["Lyle (A)"] = { obtained='Crafted', details='RIFT Store -> Crafting -> Armorsmith. Use \'Minions\' filter.' }
mimi.db.name_obtained["Mael Salach"] = { obtained='Achievement', details='The once and the future dragon' }
mimi.db.name_obtained["Magmus"] = { obtained='RIFT Store', details='Requires Cerulean Rhenke: Friendly' }
mimi.db.name_obtained["Makirn"] = { obtained='PvP', details='From Rift Loot Bag whilst PvPing.' }
mimi.db.name_obtained["Marile"] = { obtained='Rift/IA Drop', details='Nightmare Rift drop. Received from Nightmare Rift Cache drop. Also drops from IAs (Freemarch/etc)' }
mimi.db.name_obtained["Mark"] = { obtained='Puzzle/Artifact', details='"Gained from Nightmare Tide Puzzle chest after 1st time. Also from ""Wedding Gifts of Shadow Scion"" Artifact Set."' }
mimi.db.name_obtained["Martin (A)"] = { obtained='RIFT Store', details='Gained from RIFT Store -> Pets -> Minion' }
mimi.db.name_obtained["Martrodraum"] = { obtained='RIFT Store', details='Requires Manugo League: Friendly' }
mimi.db.name_obtained["Mech Anik"] = { obtained='Achievement', details='"From ""Capacitor Competency"" achievement gained during Arclight Ascendency Promo Weeks."' }
mimi.db.name_obtained["Michael Bringhurst"] = { obtained='Rift Store', details='Requires Planar Defense Force: Revered' }
mimi.db.name_obtained["Milkweed (A)"] = { obtained='Crafted', details='RIFT Store -> Crafting -> Outfitter. Use \'Minions\' filter.' }
mimi.db.name_obtained["Misty"] = { obtained='RIFT Store', details='Requires Atragarians: Friendly' }
mimi.db.name_obtained["Mitch (A)"] = { obtained='World Event', details='From Summerfest World Event 2016. Temporary found RIFT Store -> World Event for Credits' }
mimi.db.name_obtained["Moltarr"] = { obtained='RIFT Store', details='Requires Pelagic Order: Decorated' }
mimi.db.name_obtained["Mongrok"] = { obtained='Artifact Set', details='Bloodfire Soldier Kit (61)' }
mimi.db.name_obtained["Morid Finric"] = { obtained='Achievement', details='Conqeuror: The Rhen of Fate Achievement. Bind on Pickup.' }
mimi.db.name_obtained["Mossclaw"] = { obtained='Rift Store', details='Requires Saint Taranis: Decorated' }
mimi.db.name_obtained["Ms. Meles"] = { obtained='World Event', details='"Please refer to the ""Hidden Minion Cards"" tab for full information."' }
mimi.db.name_obtained["Mudthumper the Mulcher"] = { obtained='Zone Event Drop', details='Cracking Xarth\'s Skull' }
mimi.db.name_obtained["Muirden"] = { obtained='World Event', details='From Summerfest World Event 2015. Temporary found RIFT Store -> World Event for Credits' }
mimi.db.name_obtained["Nado"] = { obtained='Rift Drop', details='Nightmare Rift. Received from Nightmare Rift IV in Rift Loot Bag.' }
mimi.db.name_obtained["Naveer"] = { obtained='RIFT Store', details='"From ""Minion Starter Pack"""' }
mimi.db.name_obtained["Necrawler"] = { obtained='World Event', details='From Autumn Harvest World Event 2014. Temporary found RIFT Store -> World Event' }
mimi.db.name_obtained["Nessie"] = { obtained='Fishing', details='Fished up using Uncle Stan\'s Secret Lure or Lure of Planar Distortion.' }
mimi.db.name_obtained["Nightbringer"] = { obtained='World Event', details='"Fae Yule World Event 2014. Part of ""2014 Fae Yule Minion Adventure Pack"" in RIFT Store."' }
mimi.db.name_obtained["Nipper"] = { obtained='RIFT Store', details='"From ""Minion Starter Pack"""' }
mimi.db.name_obtained["Nixtoc"] = { obtained='RIFT Store', details='Requires Cerulean Rhenke: Decorated' }
mimi.db.name_obtained["Noggol the Tainted"] = { obtained='',
details='' }
mimi.db.name_obtained["Noxie"] = { obtained='Rift Drop', details='Nightmare Rift drop.' }
mimi.db.name_obtained["Nyor'tothgylu (H)"] = { obtained='World Event', details='"Please refer to the ""Hidden Minion Cards"" tab for full information."' }
mimi.db.name_obtained["Oblivia"] = { obtained='RIFT Store', details='Gained from RIFT Store -> Pets -> Minions' }
mimi.db.name_obtained["Omi"] = { obtained='Puzzle', details='Gained from Goboro Reef Puzzle as random drop from the chest after your first-time reward.' }
mimi.db.name_obtained["Opheline"] = { obtained='RIFT Store', details='Requires The Onir: Friendly' }
mimi.db.name_obtained["Opie (A)"] = { obtained='RIFT Vendor', details='Tenebrian Mistery Box (SFP launch)' }
mimi.db.name_obtained["Orlan"] = { obtained='Chest Drop', details='Chance drop from \'Hidden Chest\' and/or the rare mob Blightbread in Chronicle: Intrepid: Greenscale\'s Blight.' }
mimi.db.name_obtained["Ornipteryx"] = { obtained='Puzzle', details='Gained from Nightmare Tide Puzzle chest after 1st time.' }
mimi.db.name_obtained["Patches"] = { obtained='Fishing', details='Fished up using Uncle Stan\'s Secret Lure or Lure of Planar Distortion.' }
mimi.db.name_obtained["Pay to Whinny"] = { obtained='Loyalty', details='"Gained from getting 1' }
mimi.db.name_obtained["Pebbles"] = { obtained='',
details='' }
mimi.db.name_obtained["Phanagos"] = { obtained='RIFT Store', details='Requires Pelagic Order: Revered' }
mimi.db.name_obtained["Pirex Flashfire"] = { obtained='',
details='' }
mimi.db.name_obtained["Pizko"] = { obtained='RIFT Store', details='Requires Atragarians: Decorated.' }
mimi.db.name_obtained["Prince Kaliban"] = { obtained='RIFT Store', details='Requires Manugo League: Honored' }
mimi.db.name_obtained["Prince Tristaine"] = { obtained='Achievement', details='Una doesn\'t love you anymore' }
mimi.db.name_obtained["Prophet Ananke"] = { obtained='Evora@Camp Quagmire', details='Requires Mages of Alitty: Revered' }
mimi.db.name_obtained["Pyrestorm"] = { obtained='Mob Drop', details='Random drop from Rare mob: Pyrestorm in Goboro Reef' }
mimi.db.name_obtained["Qu'ella the Wretched"] = { obtained='World Event', details='Gained from the Autumn Harvest Minion Adventure Chain that starts with Minion Card: Taskmaster Atrophinius.' }
mimi.db.name_obtained["Quaq"] = { obtained='Zone Event Drop', details='"Drops from Zone Event in Rift Loot Bag. Might be any NT zone' }
mimi.db.name_obtained["Queen Zr'Bzz"] = { obtained='Mob Drop', details='Dropped from Sharptalon Windwitch in Howling Plateau and Keenblade Machinist & Keenblade Millhand in Scarwood Reach.' }
mimi.db.name_obtained["Quetzie"] = { obtained='RIFT Store', details='Gained from RIFT Store -> Pets -> Minions' }
mimi.db.name_obtained["Ra'Aran of Fate (H)"] = { obtained='Hidden Minion', details='"Please refer to the ""Hidden Minion Cards"" tab for full information."' }
mimi.db.name_obtained["Ranger Fahrand"] = { obtained='PvP', details='From Marauders Supply Cache (gained by winning Lvl 60+ PvP Warfronts)' }
mimi.db.name_obtained["Rashboil (H)"] = { obtained='World Event', details='"Please refer to the ""Hidden Minion Cards"" tab for full information."' }
mimi.db.name_obtained["Ravi (H)"] = { obtained='World Event', details='"Please refer to the ""Hidden Minion Cards"" tab for full information."' }
mimi.db.name_obtained["Razorleaf Matriarch"] = { obtained='Zone Event Drop', details='Cracking Xarth\'s Skull' }
mimi.db.name_obtained["Reginald"] = { obtained='Achievement', details='A Prowed Moment' }
mimi.db.name_obtained["Rirnef"] = { obtained='Quest', details='Questionable Allegiances from Finric at Port Scuddra in Tarken Glacier.' }
mimi.db.name_obtained["Ritualist Madina"] = { obtained='PvP', details='From Marauders Supply Cache (gained by winning Lvl 60+ PvP Warfronts)' }
mimi.db.name_obtained["Roshin"] = { obtained='IA Drop', details='From Instant Adventures.' }
mimi.db.name_obtained["Rough Raptor"] = { obtained='Promo', details='From Extra Life 2014 charity contest prize.' }
mimi.db.name_obtained["Rudy"] = { obtained='World Event', details='"Fae Yule World Event 2014. Part of ""2014 Fae Yule Minion Adventure Pack"" in RIFT Store."' }
mimi.db.name_obtained["Runald (A)"] = { obtained='Crafted', details='RIFT Store -> Crafting -> Runecrafter. Check \'Minions\' filter.' }
mimi.db.name_obtained["Rusila Dreadblade"] = { obtained='',
details='' }
mimi.db.name_obtained["Ryuu (A)"] = { obtained='RIFT Store', details='Gained from RIFT Store -> Pets -> Minions' }
mimi.db.name_obtained["Salvarola"] = { obtained='RIFT Store', details='Requires Manugo League: Revered' }
mimi.db.name_obtained["Scarbite"] = { obtained='Achievement', details='The Dreaming Seas' }
mimi.db.name_obtained["Scarn"] = { obtained='RIFT Store', details='Requires Thedeor\'s Spear: Decorated' }
mimi.db.name_obtained["Scythe"] = { obtained='World Event', details='From Autumn Harvest World Event 2014. Temporary found RIFT Store -> World Event' }
mimi.db.name_obtained["Seoras (H)"] = { obtained='Hidden Minion', details='"Please refer to the ""Hidden Minion Cards"" tab for full information."' }
mimi.db.name_obtained["Sharad X9"] = { obtained='Achievement', details='Getting Ahead in Tarken' }
mimi.db.name_obtained["Shelath"] = { obtained='Rift Drop', details='Nightmare Rift drop. Received from Nightmare Rift III Rift Loot Bag.' }
mimi.db.name_obtained["Shourloth"] = { obtained='Rift Store', details='Requires Thedeor\'s Spear: Revered' }
mimi.db.name_obtained["Shuffles"] = { obtained='Puzzle', details='Gained from Nightmare Tide Puzzle chest after 1st time.' }
mimi.db.name_obtained["Sienna"] = { obtained='PvP', details='From Marauders Supply Cache (gained by winning Lvl 60+ PvP Warfronts)' }
mimi.db.name_obtained["Simulacrum of Nathairacha"] = { obtained='Rift Store', details='Requires Bailghol: Revered' }
mimi.db.name_obtained["Sir Razerton"] = { obtained='Promo', details='From Razer Naga Redemption Pack 2014' }
mimi.db.name_obtained["Skitters"] = { obtained='Fishing', details='Fished up using Uncle Stan\'s Secret Lure or Lure of Planar Distortion.' }
mimi.db.name_obtained["Sleilun"] = { obtained='World Event', details='Gained from the Autumn Harvest Minion Adventure Chain that starts with Minion Card: Valzor.' }
mimi.db.name_obtained["Slithers"] = { obtained='Quest', details='"Goboro Reef Story Line Quest: ""Skelf Stories"" obtained from the Atragarian Well."' }
mimi.db.name_obtained["Slobberjaw"] = { obtained='World Event', details='"Fae Yule World Event 2014. Fae Yule 8hr Minion Adventure unlocked with ""2014 Fae Yule Minion Adventure Pack"" from RIFT Store -> World Event."' }
mimi.db.name_obtained["Snerkle"] = { obtained='Fishing', details='Gained through fishing with Lure of Planar Distortion/Uncle Stan\'s Super Secret Lure.' }
mimi.db.name_obtained["Snottongue"] = { obtained='RIFT Store', details='Requires The Ghar: Revered' }
mimi.db.name_obtained["Snowball"] = { obtained='Mob Drop/Fishing', details='Drop from Scribe Nychea in the Crystal Depth cave in Iron Pine Peak. And from Uncle Stan\'s Secret Lure.' }
mimi.db.name_obtained["Speludelver"] = { obtained='Puzzle', details='Gained from Nightmare Tide Puzzle chest after 1st time.' }
mimi.db.name_obtained["Spirit Kite"] = { obtained='Achievement', details='"From ""Master of the Wild"" achievement found under Achievements -> Zones -> RIFT -> Planetouched Wilds"' }
mimi.db.name_obtained["Steamskin"] = { obtained='Mob Drop', details='"Drop from Sicklehorns at (6178' }
mimi.db.name_obtained["Stofie"] = { obtained='Quest', details='"Minion starter quest at (12761' }
mimi.db.name_obtained["Styxoris"] = { obtained='RIFT Store', details='Requires The Onir: Decorated.' }
mimi.db.name_obtained["Sulfus"] = { obtained='Achievement', details='Dream Walking. Also from Draumheim Puzzle reward bag.' }
mimi.db.name_obtained["Sundereth (H)"] = { obtained='Hidden Minion', details='"Please refer to the ""Hidden Minion Cards"" tab for full information."' }
mimi.db.name_obtained["Swarmlord Khargroth"] = { obtained='World Event', details='Summerfest' }
mimi.db.name_obtained["Tagonia"] = { obtained='PvP', details='From Marauders Supply Cache (gained by winning Lvl 60+ PvP Warfronts)' }
mimi.db.name_obtained["Tas'toni"] = { obtained='Mob Drop', details='From Abyssal Commanders and Cabalists in Fortune\'s End in Meridian.' }
mimi.db.name_obtained["Taskmaster Atrophinius"] = { obtained='World Event', details='Gained from RIFT Store -> World Event during Autumn Harvest for 750 Credits (675 for Patrons).' }
mimi.db.name_obtained["Tasuil (H)"] = { obtained='Hidden Minion', details='"Please refer to the ""Hidden Minion Cards"" tab for full information."' }
mimi.db.name_obtained["Tavanion"] = { obtained='Puzzle', details='Gained from Nightmare Tide Puzzle chest after 1st time.' }
mimi.db.name_obtained["The Golden Devourer (H)"] = { obtained='World Event', details='Special version of Senbora the Devourer open raid boss in The Dendrome at Greenscale\'s Crater. Only available during Fae Yule World Event.' }
mimi.db.name_obtained["The Hag of Gloamwood"] = { obtained='World Event', details='Gained from the Autumn Harvest Minion Adventure Chain that starts with Minion Card: Taskmaster Atrophinius.' }
mimi.db.name_obtained["The Nightstalker"] = { obtained='World Event', details='Gained from the Autumn Harvest Minion Adventure Chain that starts with Minion Card: Taskmaster Atrophinius.' }
mimi.db.name_obtained["The Nuclei"] = { obtained='RIFT Store', details='Requires Planar Defense Force: Decorated' }
mimi.db.name_obtained["Thexahel"] = { obtained='Zone Event Drop', details='Cracking Xarth\'s Skull' }
mimi.db.name_obtained["Tiller"] = { obtained='Mob Drop', details='Rift or Mob drop from Silverwood.' }
mimi.db.name_obtained["Tobbler"] = { obtained='RIFT Store', details='Gained from RIFT Store -> Pets -> Minions' }
mimi.db.name_obtained["Tsathtosa"] = { obtained='PvP', details='From Marauders Supply Cache (gained by winning Lvl 60+ PvP Warfronts)' }
mimi.db.name_obtained["Tweop"] = { obtained='Mob Drop', details='"Dropped from rare mob ""Gnarl Nighthunter"" in Gloamwood."' }
mimi.db.name_obtained["Twist"] = { obtained='Achievement', details='Shucking Shrimp' }
mimi.db.name_obtained["Tzul"] = { obtained='RIFT Store', details='Requires Manugo League: Revered' }
mimi.db.name_obtained["Una"] = { obtained='RIFT Store', details='Requires The Onir: Friendly' }
mimi.db.name_obtained["Uriel Chuluun"] = { obtained='Puzzle', details='Gained from Nightmare Tide Puzzle chest after 1st time.' }
mimi.db.name_obtained["Urista"] = { obtained='PvP', details='From Marauders Supply Cache (gained by winning Lvl 60+ PvP Warfronts)' }
mimi.db.name_obtained["Valzor"] = { obtained='RIFT Store', details='Gained from RIFT Store -> World Event during Autumn Harvest for 750 Credits (675 for Patrons).' }
mimi.db.name_obtained["Violet"] = { obtained='RIFT Store', details='Requires Cerulean Rhenke: Friendly' }
mimi.db.name_obtained["Voldax"] = { obtained='Rift Drop', details='Dropped from Nightmare Rift Cache.' }
mimi.db.name_obtained["Warboss Drak"] = { obtained='PvP', details='From Marauders Supply Cache (gained by winning Lvl 60+ PvP Warfronts)' }
mimi.db.name_obtained["Welt"] = { obtained='Rift/IA Drop', details='Nightmare Rift drop. Also from Instant Adventure in Scarwood Reach + Goboro Reef' }
mimi.db.name_obtained["Wicket"] = { obtained='Quest', details='The Eternal Weapon: A Sticky Wicket' }
mimi.db.name_obtained["Wilson"] = { obtained='RIFT Store', details='Gained from RIFT Store -> Pets -> Minions' }
mimi.db.name_obtained["Xandill"] = { obtained='RIFT Store', details='Requires The Ghar: Decorated' }
mimi.db.name_obtained["Xharlion (H)"] = { obtained='Hidden Minion', details='"Please refer to the ""Hidden Minion Cards"" tab for full information."' }
mimi.db.name_obtained["Xorixla"] = { obtained='Rift Drop', details='Nightmare Rift drop. Received from Nightmare Rift Cache.' }
mimi.db.name_obtained["Yarjos Mezrot"] = { obtained='RIFT Store', details='Requires Cerulean Rhenke: Decorated' }
mimi.db.name_obtained["Yoodipti"] = { obtained='Artifact Set', details='Draum\'s Tropical Dreams (61)' }
mimi.db.name_obtained["Yulelogon"] = { obtained='World Event', details='"Fae Yule World Event 2014. Fae Yule 8hr Minion Adventure unlocked with ""2014 Fae Yule Minion Adventure Pack"" from RIFT Store -> World Event."' }
mimi.db.name_obtained["Zairatis"] = { obtained='Achievement', details='Takin\' Tarken in Tarken Glacier (for completing Octus Monastery story quest).' }
mimi.db.name_obtained["Zathral"] = { obtained='Rift Drop', details='Nightmare Rift drop. Received from Nightmare Rift I and III.' }
mimi.db.name_obtained["Zebrayan"] = { obtained='RIFT Store', details='Requires Atragarians: Decorated' }
mimi.db.name_obtained["Zendi"] = { obtained='RIFT Store', details='"Obtained as part of ""The Wilds Pack"" available on RIFT Store -> Services' }
mimi.db.name_obtained["Zephyr"] = { obtained='', details='' }
