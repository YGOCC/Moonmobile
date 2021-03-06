if not banned_list_table then banned_list_table={} end
local string=require'string'
local ls=[[
#[2020.5 YGOCC+2020.4 TCG]

!2020.5.16 YGOCC
#Forbidden YGOCC
--							MAIN DECK MONSTERS
33700093 0 -- Anifriends Aardwolf
33700072 0 -- Anifriends Beaver and Prairie
33700747 0 -- Anifriends Black-Backed Jackal
33700745 0 -- Anifriends Forest Owlet
33700186 0 -- Anifriends Kyushu Owl
33700750 0 -- Anifriends Reindeer
33700079 0 -- Anifriends Small-clawed Otter
33700751 0 -- Anifriends Tanuki
57460651 0 -- Burn Point Alchemist
31157205 0 -- Mezka Melodia
195208400 0 -- Spectre Magician & Dark Light
16599458 0 -- Telum of the Angel Organization, Zagar
28916163 0 -- V-Idol Meiko
--							RITUAL
37564909 0 -- Sayuri - Scarlet Moon
500316972 0 -- Twin-Venuses Fiber VINE Dragon
--							PENDULUM
19772590 0 -- Advocate of Justice - Ivoric
--							PANDEMONIUM
20181405 0 -- Terradication Geryonarsenal
--
--							EXTRA DECK MONSTERS
--							FUSION
33700083 0 -- Anifriends Suzaku of the South
63553466 0 -- Universe marshal
--							SYNCHRO
102400004 0 -- Accel Burst Dragon
33700085 0 -- Anifriends Byakko of the West
56642464 0 -- Holy Noble Knight Crusader, Artorgius
202114501 0 -- Sireknight
--							XYZ
63553469 0 -- Atom marshal
500314234 0 -- Hime, Ultimate Queen of Magnificient VINE
--							LINK
33700082 0 -- Anifriends Seiryu of the East
75977701 0 -- Infected knight of Ivory
32904930 0 -- Jaden the Aeonbreaker’s Alchemist
80347321 0 -- Metalfoes Mercuryrider
56642463 0 -- Noble Knight Mordred
79854547 0 -- Verdant Illusion
160000786 0 -- Yuzu, Guardian of Magnificent VINE
--							EVOLUTE
500316971 0 -- Buttercup of Fiber VINE
16000969 0 -- Cybersian Judgeman
16000130 0 -- Oak Gardna of Fiber Vine
--
--							SPELLS CARDS
19772596 0 -- The Advocate of Justice’s Summoning
195208413 0 -- False Reality Distortion
79854546 0 -- Numbing Winter jewel
10130500 0 -- Pendulum Advance
23251031 0 -- Pharaohnic Papyrus of Patience
17029608 0 -- Psychether priestess, Joan
28915253 0 -- Shadowflame Calvary
500311692 0 -- VINE Sunflower of Greed
99998878 0 -- Voidictator Rune - Greater Gating Art
--
--							TRAPS CARDS
--
#Limited YGOCC
--							MAIN DECK MONSTERS
171000121 1 -- Amethyst-Winged Kuriboh
33700744 1 -- Anifriends "Ikkaku"
33700181 1 -- Anifriends Caracal
33700054 1 -- Anifriends Ezo Red Fox
33700065 1 -- Anifriends PPP Gentoo
77585595 1 -- Forgalgia Emperor Jinzo
33700304 1 -- GearGal Veno
50031699 1 -- Mana, Sharpshooter of Fiber VINE
32904923 1 -- Serene the Aeonbreaker's Sword
11000533 1 -- Shya Shadowlord
221594305 1 -- Voidictator Servant - Knight of Corvus
221594304 1 -- Voidictator Servant - Rune Artist
99998880 1 -- Voidictator Servant - Shield of Corvus
79854524 1 -- Woodland Wing
--							RITUAL
--							PENDULUM
33700746 1 -- Anifriends Sky Impulse
102400114 1 -- Blitzkrieg Dragon - Steel
102400102 1 -- Bitzkrieg Meklight - Dawn
160005445 1 -- Paintress Da Vinca
16000233 1 -- Paintress Gorgia
17029601 1 -- Psychether Dreamer, Iman
--							PANDEMONIUM
53313934 1 -- Mysterious Luster Dragon
--
--							EXTRA DECK MONSTERS
--							FUSION
32904936 1 -- Arisa, the Aeonbreaker's Defender
--							SYNCHRO
63553468 1 -- Proxima Marshall
--							XYZ
19772604 1 -- The Grand Witch of the Advocate of Justice - Flaric Ebona
--							LINK
50031786 1 -- Lana, Whiptail Girl of Magnificent VINE
210424272 1 -- Moon Burst: The Bad Dream
33700311 1 -- NEXTGal G
--							EVOLUTE
--							BIGBANG
48022718 1 -- Space-Time Wizard
--
--							SPELL CARDS
19772610 1 -- The Advocate of Justice's Door
32904931 1 -- Aeonbreaker Fusion
102400133 1 -- Blitzkrieg Sky
33700316 1 -- GearGal Abort
33700058 1 -- Miracle of the Sandstar
160004532 1 -- The Miscomposition of Power Portrait
15747847 1 -- Mythos Valor
63553459 1 -- Nethergear Unit
37564903 1 -- Sayuri - ALICE
37564902 1 -- Sayuri - GRAZE
96212378 1 -- Spiral Drill Formation
20181413 1 -- Terradication Living Fortress
99998875 1 -- Voidictator Rune - Lesser Gating Art
221594311 1 -- Voidictator Rune - Zanyris's Realm
--
--							TRAP CARDS
500311592 1 -- Power Portrait's Cursed Portait Trap
--
#Semi-limited YGOCC
--							MAIN DECK MONSTERS
16000128 2 -- Ivy Butterfly of Fiber VINE
32904921 2 -- Laura the Aeonbreaker's Bow
--
--							EXTRA DECK MONSTERS
--
--							SPELL CARDS
53313927 2 -- Mysterious Dimension
15747835 2 -- Mythos paradox
210424266 2 -- Battle in the Storm
--
--							TRAP CARDS
--
#FORBIDDEN TCG					===Forbidden===
76794549 0 --Astrograph Sorcerer
09929398 0 --Blackwing - Gofu the Vague Shadow
53804307 0 --Blaster, Dragon Ruler of Infernos
34124316 0 --Cyber Jar
15341821 0 --Dandylion
08903700 0 --Djinn Releaser of Rituals
49684352 0 --Double Iris Magician
51858306 0 --Eclipse Wyvern
55623480 0 --Fairy Tail - Snow
78706415 0 --Fiber Jar
93369354 0 --Fishborg Blaster
75732622 0 --Grinder Golem
57421866 0 --Level Eater
34206604 0 --Magical Scientist
31178212 0 --Majespecter Unicorn - Kirin
21593977 0 --Makyura the Destructor
21377582 0 --Master Peace, the True Dracoslaying King
23434538 0 --Maxx "C"
96782886 0 --Mind Master
57835716 0 --Orcust Harp Horror
07563579 0 --Performage Plushfire
17330916 0 --Performapal Monkeyboard
40318957 0 --Performapal Skullcrobat Joker
23558733 0 --Phoenixian Cluster Amaryllis
90411554 0 --Redox, Dragon Ruler of Boulders
05592689 0 --Samsara Lotus
20663556 0 --Substitoad
88071625 0 --The Tyrant Neptune
26400609 0 --Tidal, Dragon Ruler of Waterfalls
44910027 0 --Victory Dragon
03078576 0 --Yata-Garasu
17412721 0 --Elder Entity Norden
43387895 0 --Supreme King Dragon Starving Venom
15291624 0 --Thunder Dragon Colossus
05043010 0 --Firewall Dragon
59537380 0 --Guardragon Agarpain
24094258 0 --Heavymetalfoes Electrumite
39064822 0 --Knightmare Goblin
03679218 0 --Knightmare Mermaid
61665245 0 --Summon Sorceress
26692769 0 --The Phantom Knights of Rusty Bardiche
22593417 0 --Topologic Gumblar Dragon
25862681 0 --Ancient Fairy Dragon
65536818 0 --Denglong, First of the Yang Zing
94677445 0 --Ib the World Chalice Justiciar
63101919 0 --Tempest Magician
34086406 0 --Lavalval Chain
04423206 0 --M-X-Saber Invoker
54719828 0 --Number 16: Shock Master
10389142 0 --Number 42: Galaxy Tomahawk
63504681 0 --Number 86: Heroic Champion - Rhongomyniad
58820923 0 --Number 95: Galaxy-Eyes Dark Matter Dragon
34945480 0 --Outer Entity Azathot
87327776 0 --Salamangreat Miragestallio
18326736 0 --Tellarknight Ptolemaeus
81122844 0 --Wind-Up Carrier Zenmaity
85115440 0 --Zoodiac Broadbull
07394770 0 --Brilliant Fusion
69243953 0 --Butterfly Dagger - Elma
57953380 0 --Card of Safe Return
04031928 0 --Change of Heart
67616300 0 --Chicken Game
60682203 0 --Cold Wave
17375316 0 --Confiscation
44763025 0 --Delinquent Duo
23557835 0 --Dimension Fusion
42703248 0 --Giant Trunade
79571449 0 --Graceful Charity
18144506 0 --Harpie's Feather Duster
19613556 0 --Heavy Storm
35059553 0 --Kaiser Colosseum
85602018 0 --Last Will
34906152 0 --Mass Driver
46411259 0 --Metamorphosis
41482598 0 --Mirage of Nightmare
74191942 0 --Painful Choice
55144522 0 --Pot of Greed
70828912 0 --Premature Burial
94220427 0 --Rank-Up-Magic Argent Chaos Force
63166095 0 --Sky Striker Mobilize - Engage!
45986603 0 --Snatch Steal
54447022 0 --Soul Charge
46448938 0 --Spellbook of Judgment
11110587 0 --That Grass Looks Greener
42829885 0 --The Forceful Sentry
28566710 0 --Last Turn
27174286 0 --Return from the Different Dimension
93016201 0 --Royal Oppression
57585212 0 --Self-Destruct Button
03280747 0 --Sixth Sense
35316708 0 --Time Seal
64697231 0 --Trap Dustshoot
80604091 0 --Ultimate Offering
05851097 0 --Vanity's Emptiness
9047460 0 --Blackwing - Steam the Cloak
5560911 0 --Destrudo the Lost Dragon's Frisson
67441435 0 --Glow-Up Bulb
83190280 0 --Lunalight Tiger
91258852 0 --SPYRAL Master Plan
#LIMITED TCG						====Limited===
07902349 1 --Left Arm of the Forbidden One
44519536 1 --Left Leg of the Forbidden One
70903634 1 --Right Arm of the Forbidden One
08124921 1 --Right Leg of the Forbidden One
42790071 1 --Altergeist Multifaker
28985331 1 --Armageddon Knight
61901281 1 --Black Dragon Collapserpent
57143342 1 --Cir, Malebranche of the Burning Abyss
69015963 1 --Cyber-Stein
70711847 1 --Danger! Nessie!
14536035 1 --Dark Grepher
58984738 1 --Dinomight Knight, the True Dracofighter
82385847 1 --Dinowrestler Pankratops
33396948 1 --Exodia the Forbidden One
64034255 1 --Genex Ally Birdman
20758643 1 --Graff, Malebranche of the Burning Abyss
99177923 1 --Infernity Archfiend
33508719 1 --Morphing Jar
16226786 1 --Night Assailant
12958919 1 --Phantom Skyblaster
88264978 1 --Red-Eyes Darkness Metal Dragon
26889158 1 --Salamangreat Gazelle
92559258 1 --Servant of Endymion
81275020 1 --Speedroid Terrortop
04474060 1 --SPYRAL GEAR - Drone
78080961 1 --SPYRAL Quik-Fix
89399912 1 --Tempest, Dragon Ruler of Storms
30539496 1 --True King Lithosagym, the Disaster
99234526 1 --White Dragon Wyverburster
78872731 1 --Zoodiac Ratpier
45222299 1 --Evigishki Gustkraken
11877465 1 --Evigishki Mind Augus
89463537 1 --Nekroz of Unicore
39512984 1 --Gem-Knight Master Diamond
48063985 1 --Ritual Beast Ulti-Cannahawk
70583986 1 --Dewloren, Tiger King of the Ice Barrier
18239909 1 --Ignister Prominence, the Blasting Dracoslayer
74586817 1 --PSY-Framelord Omega
27552504 1 --Beatrice, Lady of the Eternal
00581014 1 --Daigusto Emeral
08949584 1 --A Hero Lives
72892473 1 --Card Destruction
59750328 1 --Card of Demise
91623717 1 --Chain Strike
81674782 1 --Dimensional Fissure
15854426 1 --Divine Wind of Mist Valley
14733538 1 --Draco Face-Off
13035077 1 --Dragonic Diagram
67723438 1 --Emergency Teleport
95308449 1 --Final Countdown
81439173 1 --Foolish Burial
27970830 1 --Gateway of the Six
75500286 1 --Gold Sarcophagus
66957584 1 --Infernity Launcher
93946239 1 --Into the Void
71650854 1 --Magical Mid-Breaker Field
83764718 1 --Monster Reborn
33782437 1 --One Day of Peace
02295440 1 --One for One
22842126 1 --Pantheism of the Monarchs
12580477 1 --Raigeki
58577036 1 --Reasoning
32807846 1 --Reinforcement of the Army
52155219 1 --Salamangreat Circle
73915051 1 --Scapegoat
24940422 1 --Sekka's Light
73468603 1 --Set Rotation
52340444 1 --Sky Striker Mecha - Hornet Drones
98338152 1 --Sky Striker Mecha - Widow Anchor
24010609 1 --Sky Striker Mecha Modules - Multirole
71344451 1 --Slash Draw
54631665 1 --SPYRAL Resort
45305419 1 --Symbol of Heritage
73628505 1 --Terraforming
35371948 1 --Trickstar Light Stage
70368879 1 --Upstart Goblin
61740673 1 --Imperial Order
30241314 1 --Macro Cosmos
32723153 1 --Magical Explosion
89208725 1 --Metaverse
23002292 1 --Red Reboot
82732705 1 --Skill Drain
35125879 1 --True King's Return
17078030 1 --Wall of Revealing Light
43694650 1 --Danger!? Jackalope?
99745551 1 --Danger!? Tsuchinoko?
1561110 1 --ABC-Dragon Buster
90953320 1 --T.G. Hyper Librarian
52687916 1 --Trishula, Dragon of the Ice Barrier
90809975 1 --Toadally Awesome
48905153 1 --Zoodiac Drident
1845204 1 --Instant Fusion
37520316 1 --Mind Control
46060017 1 --Zoodiac Barrage
#SEMI LIMITED TCG					===Semi Limited===
10802915 2 --Tour Guide From the Underworld
9411399 2 --Destiny HERO - Malicious
98338152 2 --Sky Striker Mecha - Widow Anchor
]]
for id in ls:sub(ls:find("!"),ls:find("!",ls:find("!")+1) and ls:find("!",ls:find("!")+1)-1 or -1):gmatch("([0-9]+) 0") do
	banned_list_table[tonumber(id)]=true
end
