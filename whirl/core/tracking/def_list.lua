
whr.defenses = whr.defenses or {
-- Probably handled by firstaid anyways, otherwise auto assume people have plants/vials. 
deafness = {type = "normal", effect = "Protects from sonic effects", balance = {herb = "ototoxin"}, state = "down", skill = "Generic"},
blindness = {type = "normal", effect = "Protects from visual effects", balance = {herb = "amaurosis"}, state = "down", skill = "Generic"},
waterbreathing = {type = "normal", effect = "Prevents choking underwater", balance = {herb = "waterbreathing"}, state = "down", skill = "Generic"},
instawake = {type = "normal", effect = "Removes the WAKE delay", balance = {eat = "stimulant"}, state = "down", skill = "Generic"},
insomnia = {type = "normal", effect = "Prevents sleep effects", balance = {eat = "kawhepill"}, state = "down", skill = "Generic"},
deathsight = {type = "normal", effect = "Reports player deaths", balance = {eat = "thanatonin"}, state = "down", skill = "Generic"},
thirdeye = {type = "normal", effect = "Adds locations to WHO", balance = {eat = "acuity"}, state = "down", skill = "Generic"},
venom_resistance = {type = "normal", effect = "Protects against poison damage", balance = {vial = "antivenin"}, state = "down", skill = "Generic"},
levitation = {type = "normal", effect = "Protects against falling effects", balance = {vial = "levitation"}, state = "down", skill = "Generic"},
temperance = {type = "normal", effect = "Protects against fire damage", balance = {vial = "frost"}, state = "down", skill = "Generic"},
speed = {type = "green", effect = "Protects against aeon affliction", balance = {drink = "speed"}, state = "down", skill = "Generic"},
insulation = {type = "normal", effect = "Protects against cold damage", balance = {salve = "caloric"}, state = "down", skill = "Generic"},
vigor = {type = "normal", effect = "Critical hits heal you", balance = {drink = "vigor"}, state = "down", skill = "Generic"},
fangbarrier = {type = "normal", effect = "Protects against syssin bites", balance = {special = "outc paste"..whr.sep.."apply paste"}, state = "down", skill = "Generic"},
rebounding = {type = "blue", effect = "Causes weapon attacks to backfire", balance = {smoke = "reishi"}, state = "down", skill = "Generic"},

--Generic skills or occurs in more than one
nightsight = {type = "normal", effect = "Allows glancing at night", balance = {special = "nightsight on"}, state = "down", skill = "Nightsight"},
fitness = {type = "normal", effect = "Protects from asthma", balance = {takey = "fitness"}, state = "down", skill = "Fitness"},
divert_melee = {type = "normal", effect = "Protects from melee damage", balance = {special = "divert melee"}, state = "down", skill = "Jerk"},
dodge_melee = {type = "normal", effect = "Protects from melee damage", balance = {special = "dodge melee"}, state = "down", skill = "Sidestep"},
dodge_ranged = {type = "normal", effect = "Protects from ranged damage", balance = {special = "dodge ranged"}, state = "down", skill = "Twisting"},
clarity = {type = "normal", effect = "Protects against some mental affs", balance = {takey = "clarity"}, state = "down", skill = "Clarity"},
shroud = { }, -- handled and set per class elsewhere
manipulation_aegis = {type = "normal", effect = "cheap prism", balance = {takey = "manipulate pylon for aegis"}, state = "down", skill = "Generic"},
gripping = {type = "normal", effect = "Prevents disarming", balance = {needy = "grip"}, state = "down", skill = "Gripping"},
starburst = {type = "blue", effect = "Instant revival on death", balance = {tattoo = "starburst"}, state = "down", skill = "Generic"},
density = {type = "red", effect = "Resists forced movement", balance = {salve = "mass"}, state = "down", skill = "Generic"},
waterwalking = {type = "normal", effect = "Allows you to walk on water", balance = {special = "touch waterwalking"}, state = "down", skill = "Generic"},
overwatch = {type = "normal", effect = "See items in the air/trees", balance = {special = "goggle toggle overwatch"}, state = "down", skill = "Generic"},
divine_speed = {type = "normal", effect = "Faster movement through Divine Grace", balance = {takey = "grace"}, state = "down", skill = "Generic"},
hypersight = {type = "normal", effect = "See through shenanigans", balance = {takey = "hypersight on"}, state = "down", skill = "Generic"},
lifevision = {type = "normal", effect = "See all things living, sometimes identify illusions.", balance = {takey = "lifevision"}, state = "down", skill = "Lifevision" },

--Ylem
amber_orb = {type = "ansi_light_yellow", effect = "5% increase in experience", balance = {special = "activate amber orb"}, state = "down", skill = "Generic"},
green_orb = {type = "lawn_green", effect = "25% increase in vigour healing", balance = {special = "activate green orb"}, state = "down", skill = "Generic"},
crimson_orb = {type = "firebrick", effect = "More damage to and less from denizens", balance = {special = "activate crimson orb"}, state = "down", skill = "Generic"},
cerulean_orb = {type = "ansiLightBlue", effect = "Protection from damage", balance = {special = "activate cerulean orb"}, state = "down", skill = "Generic"},
white_orb = {type = "ghost_white", effect = "Increased ylem gain from eld", balance = {special = "activate white orb"}, state = "down", skill = "Generic"},

--Generic endgame
safeguard = {type = "normal", effect = "Increased resistances", balance = {needy = "safeguard"}, state = "down", skill = "Instill"},
warmth = {type = "normal", effect = "Increased resistances", balance = {needy = "warmth"}, state = "down", skill = "Instill"},
miasma = {type = "normal", effect = "Increased resistances", balance = {needy = "miasma"}, state = "down", skill = "Instill"},

--Raceskills or tattoos
pacing = {type = "red", effect = "Keep up while following", balance = {takey = "pacing on"}, state = "down", skill = "Pacing"},
heatsight = {type = "normal", effect = "See hidden people", balance = {takey = "heatsight"}, state = "down", skill = "Heatsight"},
chameleon = {type = "normal", effect = "Change your name on QW/WHO", balance = {needy = "touch chameleon "}, state = "down", skill = "ChameleonTattoo"},
cloak = {type = "blue", effect = "Protects from unwanted summons", balance = {tattoo = "cloak"}, state = "down", skill = "CloakTattoo"},
mindseye = {type = "green", effect = "Allows deaf/blind hearing/vision", balance = {special = "touch allsight"}, state = "down", skill = "Generic"},
firefly = {type = "green", effect = "Protects you against them Sciomancers", balance = {tattoo = "firefly"},state = "down", skill = "FireflyTattoo"},
flame = {type = "green", effect = "Helps protect against writhe affs", balance = {tattoo = "flame"},state = "down", skill = "FlameTattoo"},
shielded = {type = "green", effect = "Magical shield to stop attacks", balance = {tattoo = "shield"},state = "down", skill = "ShieldTattoo"},

--Templar
maingauche = {type = "normal", effect = "Chance to counter attack", balance = {takey = "maingauche"}, state = "down", skill = "MainGauche"},

--Carnifex
fearless = {type = "normal", effect = "Protects against fear affliction.", balance = {special = "fearless"}, state = "down", skill = "Fearless"},
reveling = {type = "normal", effect = "Periodic heal on damage done.", balance = {takey = "reveling on"}, state = "down", skill = "Reveling"},
recklessness = {type = "normal", effect = "Can attack with 1 broken arm.", balance = {takey = "recklessness on"}, state = "down", skill = "Reckless"},
soulharvest = {type = "normal", effect = "Automatically harvest souls.", balance = {special = "soul harvest on"}, state = "down", skill = "Harvest"},
soul_fracture = {type = "normal", effect = "Boosts defenses and weapon damage.", balance = {special = "soul fracture"}, state = "down", skill = "Fracture"},
soul_body = {type = "normal", effect = "Boosts physical defense.", balance = {takey = "soul embed in body"}, state = "down", skill = "EmbedBody"},
soul_fortify = {type = "normal", effect = "Increased constitution.", balance = {takey = "soul fortify"}, state = "down", skill = "Fortify"},
soulthirst = {type = "normal", effect = "Steals soul on hit.", balance = {takey = "soul thirst"}, state = "down", skill = "Soulthirst"},
substitute = {type = "normal", effect = "Protected from death.", balance = {takey = "soul substitute"}, state = "down", skill = "Substitute"},
spiritsight = {type = "normal", effect = "You can see the hidden.", balance = {takey = "soul spiritsight"}, state = "down", skill = "Spiritsight"},
hound_opening = {type = "normal", effect = "Increases damage done to mobs.", balance = {}, state = "down", skill = "Openings"},
bruteforce = {type = "normal", effect = "Attacks hit through parry.", balance = {takey = "hammer force"}, state = "down", skill = "BruteForce"},
herculeanrage = {type = "normal", effect = "Make them prone/off bal.", balance = {takey = "hammer rage on"}, state = "down", skill = "HerculeanRage"},
houndmark = {type = "yellow", effect = "Hounds go zoom", balance = {}, state = "down", skill = "Generic"},

--Lycan
weathering = {type = "normal", effect = "Cold resistance", balance = {special = "weathering"}, state = "down", skill = "Weathering"},
bodyheat = {type = "normal", effect = "Protects against chill", balance = {takey = "bodyheat"}, state = "down", skill = "Bodyheat"},
metabolism = {type = "normal", effect = "Increase strength", balance = {takey = "metabolize on"}, state = "down", skill = "Metabolize"},
celerity = {type = "normal", effect = "Faster movement", balance = {takey = "endurance"}, state = "down", skill = "Endurance"},
thickhide = {type = "normal", effect = "Physical protection", balance = {takey = "thickhide"}, state = "down", skill = "Thickhide"},
cornering = {type = "normal", effect = "Increase dodge chance", balance = {takey = "corner on"}, state = "down", skill = "Cornering"},
salivating = {type = "normal", effect = "Bites give haemophilia", balance = {needy = "salivate"}, state = "down", skill = "Salivate"},
hardening = {type = "normal", effect = "Chance to prevent crippled limbs", balance = {takey = "harden bones"}, state = "down", skill = "Hardening"},
fury = {type = "normal", effect = "Can use claws off balance", balance = {}, state = "down", skill = "Fury"},

--Luminary
lightshield = {type = "normal", effect = "Light-based damage resistance", balance = {takey = "evoke lightshield"}, state = "down", skill = "Lightshield" },
fireblock = {type = "normal", effect = "Resists fire attacks", balance = {takey = "evoke fireblock"}, state = "down", skill = "Fireblock"},
shine = {type = "normal", effect = "Dealing AoE room damage to enemies", balance = {takey = "evoke shine"}, state = "down", skill = "Shine"},
inspiration_strength = {type = "normal", effect = "Increases strength", balance = {takey = "perform inspiration strength"}, state = "down", skill = "Inspiration" },
inspiration_dexterity = {type = "normal", effect = "Increases dexterity", balance = {takey = "perform inspiration dexterity"}, state = "down", skill = "Inspiration" },
inspiration_intelligence = {type = "normal", effect = "Increases intelligence", balance = {takey = "perform inspiration intelligence"}, state = "down", skill = "Inspiration" },
inspiration_constitution = {type = "normal", effect = "Increases constitution", balance = {takey = "perform inspiration constitution"}, state = "down", skill = "Inspiration" },

--earthcaller
heatshield = {type = "normal", effect = "Light-based damage resistance", balance = {takey = "tectonic heatshield"}, state = "down", skill = "Heatshield" },
smothering = {type = "normal", effect = "Resists fire attacks", balance = {takey = "tectonic smothering"}, state = "down", skill = "Smnothering"},
seismicity = {type = "normal", effect = "Dealing AoE room damage to enemies", balance = {takey = "tectonic seismicity"}, state = "down", skill = "Shine"},
battlehymn_strength = {type = "normal", effect = "Increases strength", balance = {takey = "dirge battlehymn strength"}, state = "down", skill = "Battlehymn" },
battlehymn_constitution = {type = "normal", effect = "Increases constitution", balance = {takey = "dirge battlehymn constitution"}, state = "down", skill = "Battlehymn" },
battlehymn_intelligence = {type = "normal", effect = "Increases intelligence", balance = {takey = "dirge battlehymn intelligence"}, state = "down", skill = "Battlehymn" },
battlehymn_dexterity = {type = "normal", effect = "Increases dexterity", balance = {takey = "dirge battlehymn dexterity"}, state = "down", skill = "Battlehymn" },


--Syssin
hiding = {type = "blue", effect = "Conceals your presence", balance = {takey = "hide"}, state = "down", skill = "Hide"},
warding = {type = "normal", effect = "Physical resistance", balance = {takey = "warding"}, state = "down", skill = "Warding"},
finesse = {type = "normal", effect = "Protects against rebounding", balance = {takey = "finesse"}, state = "down", skill = "Finesse"},
weaving = {type = "red", effect = "Increases dodge rate", balance = {takey = "weaving on"}, state = "down", skill = "Weaving"},
shadowsight = {type = "normal", effect = "See hidden people", balance = {takey = "shadowsight"}, state = "down", skill = "Shadowsight"},
ghosted = {type = "normal", effect = "Conceals movement", balance = {takey = "conjure ghost"}, state = "down", skill = "Ghost"},
--shadowslip = {type = "normal", effect = "HIDE on killing blow", balance = {takey = "shadowslip on"}, state = "down", skill = "Shadowslip"},
phased = {type = "yellow", effect = "On another plane", balance = {}, state = "down", skill = "Phase"},
lipreading = {type = "normal", effect = "Hear through DEAF", balance = {takey = "lipread"}, state = "down", skill = "Lipread"},


--Monk
vitality = {type = "normal", effect = "You will get a burst of HP when near death", balance = {takey = "vitality"}, state = "down", skill = "Vitality"},
kaido_regeneration = {type = "normal", effect = "HP regen", balance = {special = "regeneration on"}, state = "down", skill = "Regeneration"},
constitution = {type = "normal", effect = "Protection from nausea", balance = {takey = "constitution"}, state = "down", skill = "Constitution"},
split_mind = {type = "normal", effect = "Constant meditation", balance = {takey = "split mind"}, state = "down", skill = "Splitting"},
kaido_immunity = {type = "normal", effect = "You will auto cure the next poison you are hit with", balance = {takey = "immunity"}, state = "down", skill = "Immunity"},
boosted_regen = {type = "normal", effect = "Even more HP regen", balance = {special = "boost regeneration"}, state = "down", skill = "Boosting"},
insight = {type = "normal", effect = "See the thoughts of others", balance = {takey = "mind insight on"}, state = "down", skill = "Insight"},
toughness = {type = "normal", effect = "Cutting resistance", balance = {takey = "toughness"}, state = "down", skill = "Toughness"},
resistance = {type = "normal", effect = "Magic resistance", balance = {takey = "resistance"}, state = "down", skill = "Resistance"},


--Sentinel
barkskin = {type = "normal", effect = "10% Resist to Cutting/Blunt", balance = {takey = "barkskin"}, state = "down", skill = "Barkskin"},
lifesap = {type = "normal", effect = "Gain health on melee attack", balance = {takey = "lifesap"}, state = "down", skill = "Lifesap" },
hardiness = {type = "normal", effect = "15% Resist to Cold/Venom", balance = {takey = "hardiness"}, state = "down", skill = "Hardiness" },
flexibility = {type = "normal", effect = "Increased writhe", balance = {takey = "flexibility"}, state = "down", skill = "Flexibility" },
masked_scent = {type = "normal", effect = "Not listed on scent", balance = {takey = "mask scent"}, state = "down", skill = "Masking" },
concealed = {type = "normal", effect = "You are a shadowy figure", balance = {takey = "conceal"}, state = "down", skill = "Conceal" },
foreststride = {type = "normal", effect = "You move faster outdoors & in forests", balance = {takey = "foreststride"}, state = "down", skill = "Foreststriding" },

--Wayfarer
ironskin = {type = "normal", effect = "Resist physical damage", balance = {takey = "wayfare ironskin"}, state = "down", skill = "Ironskin" },
blindsense = {type = "normal", effect = "Resistance to accuracy reduction", balance = {takey = "wayfare blindsense on"}, state = "down", skill = "Blindsense" },
greenheart = {type = "normal", effect = "Tree Tattoo is sped up", balance = {takey = "outc greenink"..whr.sep.."wayfare greenheart on"}, state = "down", skill = "Greenheart" },
endure = {type = "normal", effect = "Endurance usage reduced", balance = {takey = "wayfare endure on"}, state = "down", skill = "Endure" },
mountaineer = {type = "normal", effect = "You're shoutin' room-wide", balance = {takey = "wayfare mountaineer on"}, state = "down", skill = "Mountaineer" },
dustcoat = {type = "normal", effect = "Soulmask while moving", balance = {takey = "wayfare dustcoat"}, state = "down", skill = "Dustcoat" },
resilience = {type = "normal", effect = "Assess is wonky vs you", balance = {takey = "wayfare resilience on"}, state = "down", skill = "Resilience" },
desolation = {type = "normal", effect = "You do more melee damage, ranged speed down", balance = {takey = "wayfare desolation on"}, state = "down", skill = "Desolation" },
circulation = {type = "normal", effect = "+1STR, clot under haemophilia, clot cost up", balance = {takey = "wayfare circulation on"}, state = "down", skill = "Circulation" },
-- Brutality, axe avert, axe obstruct, axe repel, weathering, bloodtrails, phalanx are missing

--Archivist
spheres = {type = "normal", effect = "Spheres defense for Archivist", balance = {takey = "contemplate spheres"}, state = "down", skill = "Spheres" },
linked = {type = "normal", effect = "Yay link", balance = {takey = "elicit link 50"}, state = "down", skill = "Link" },
oneness = {type = "normal", effect = "oneness", balance = {takey = "elicit oneness"}, state = "down", skill = "Oneness" },
sublimation = {type = "normal", effect = "sublimation", balance = {needy = "elicit sublimation me"}, state = "down", skill = "Sublimation" },
ameliorate = {type = "normal", effect = "ameliorate", balance = {takey = "bio ameliorate on"}, state = "down", skill = "Ameliorate" },
catabolism = {type = "normal", effect = "catabolism", balance = {takey = "bio catabolism"}, state = "down", skill = "Catabolism" },
geo_invert = {type = "normal", effect = "You Have Inverted Your Token", balance = {takey = "drop token"..whr.sep.."geo invert"}, state = "down", skill = "Invert" },
geo_trace = {type = "normal", effect = "You Have Traced Your Token", balance = {takey = "geo trace me"}, state = "down", skill = "Trace" },
empower_jhako = {type = "normal", effect = "You Have Empowered Jhako", balance = {takey = "empower jhako"}, state = "down", skill = "Empower" },
nexus = {type = "normal", effect = "Setup your nexus", balance = {takey = "bio nexus one"}, state = "down", skill = "Nexus" },

--Indorani
soulmask = {type = "normal", effect = "Your soul is harder to sense.", balance = {special = "soulmask"}, state = "down", skill = "Soulmask" },
vengeance = {type = "normal", effect = "You will deal AoE damage to enemies upon death.", balance = {takey = "vengeance"}, state = "down", skill = "Vengeance" },
deathaura = {type = "normal", effect = "You deal damage to enemies in room passively.", balance = {takey = "deathaura on"}, state = "down", skill = "Deathaura" },
gravechill = {type = "normal", effect = "Cold damage on decay instead of magic.", balance = {takey = "gravechill"}, state = "down", skill = "Gravechill" },
soulcage = {type = "normal", effect = "You come back to life upon death instantly.", balance = {takey = "soulcage"}, state = "down", skill = "Soulcage" },
devilpact = {type = "normal", effect = "Throw 2 cards at once.", balance = {takey = "fling devil at ground"}, state = "down", skill = "Devil" },
eclipse = {type = "normal", effect = "Every 3rd card is hidden, sun/moon only.", balance = {takey = "fling eclipse at me"}, state = "down", skill = "Eclipse" },
chariot = {type = "normal", effect = "+Celerity, +bal for cards", balance = {takey = "fling chariot at ground"}, state = "down", skill = "Chariot" },
hierophant = {type = "normal", effect = "Protect against disloyalty.", balance = {takey = "fling hierophant at me"}, state = "down", skill = "Hierophant"},

--Oneiromancer
redoubt = {type = "normal", effect = "Your soul is harder to sense.", balance = {special = "redoubt"}, state = "down", skill = "Redoubt" },
defiance = {type = "normal", effect = "You will deal AoE damage to enemies upon death.", balance = {takey = "defiance"}, state = "down", skill = "Defiance" },
intoxication = {type = "normal", effect = "You deal damage to enemies in room passively.", balance = {takey = "intoxication"}, state = "down", skill = "Intoxication" },
glaciation = {type = "normal", effect = "Cold damage on decay instead of magic.", balance = {takey = "glaciation"}, state = "down", skill = "Glaciation" },
remembrance = {type = "normal", effect = "You come back to life upon death instantly.", balance = {takey = "remembrance"}, state = "down", skill = "remembrance" },
faerie = {type = "normal", effect = "Throw 2 cards at once.", balance = {takey = "unfurl faerie at ground"}, state = "down", skill = "Faerie" },
cloud = {type = "normal", effect = "Every 3rd card is hidden, sun/moon only.", balance = {takey = "unfurl cloud at me"}, state = "down", skill = "Cloud" },
crane = {type = "normal", effect = "+Celerity, +bal for cards", balance = {takey = "unfurl crane at ground"}, state = "down", skill = "Crane" },
fan = {type = "normal", effect = "Protect against disloyalty.", balance = {takey = "unfurl fan at me"}, state = "down", skill = "Fan"},


--Shaman
spiritbond = {type = "normal", effect = "Share damage with your spirit.", balance = {takey = "familiar spiritbond on"}, state = "down", skill = "Spiritbond" },
protection = {type = "normal", effect = "Resistance to cutting/blunt.", balance = {takey = "shaman protection"}, state = "down", skill = "Protection"},
shaman_spiritsight = {type = "normal", effect = "You get loki 2.0.", balance = {takey = "shaman spiritsight on"}, state = "down", skill = "Spiritsight" },
lifebloom = {type = "normal", effect = "Restore HP upon getting low health.", balance = {takey = "commune lifebloom"}, state = "down", skill = "Lifebloom"},
shaman_warding  = {type = "normal", effect = "Give mental affs when your parry is hit.", balance = {takey = "shaman warding"}, state = "down", skill = "Warding" },

--Praenomen
potence_strength = {type = "normal", effect = "+1 STR", balance = {takey = "potence strength"}, state = "down", skill = "Potence"},
potence_constitution = {type = "normal", effect = "+1 CON", balance = {takey = "potence constitution"}, state = "down", skill = "Potence"},
potence_intelligence = {type = "normal", effect = "+1 INT", balance = {takey = "potence intelligence"}, state = "down", skill = "Potence"},
potence_dexterity = {type = "normal", effect = "+1 DEX", balance = {takey = "potence dexterity"}, state = "down", skill = "Potence" },
fortify = {type = "normal", effect = "Fortify your body to take less physical damage", balance = {takey = "fortify"}, state = "down", skill = "Fortify" },
corpus_warding = {type = "normal", effect = "Fortify your body to take less magical damage", balance = {takey = "ward"}, state = "down", skill = "Warding" },
celerity = {type = "normal", effect = "Increased movement speed", balance = {takey = "celerity"}, state = "down", skill = "Celerity" },
lifescent = {type = "normal", effect = "Detect nearby prey movements", balance = {takey = "lifescent"}, state = "down", skill = "Lifescent" },
veil = {type = "normal", effect = "Hide deeper in the shadows", balance = {takey = "veil"}, state = "down", skill = "Veil"},
stalk = {type = "normal", effect = "Nighttime hiding in the shadows", balance = {takey = "stalk"}, state = "down", skill = "Stalking" },
concentrate = {type = "normal", effect = "Make your blood use more efficient", balance = {takey = "blood concentrate"}, state = "down", skill = "Concentration" },
shadowblow = {type = "normal", effect = "Your shadow strikes out at your attacker", balance = {takey = "blood shadow"}, state = "down", skill = "Shadow" },
blurred = {type = "normal", effect = "Others cannot see your vitals", balance = {takey = "blood blur"}, state = "down", skill = "Blur" },
elusion = {type = "normal", effect = "You avoid opponents' blows", balance = {takey = "elusion on"}, state = "down", skill = "Elusion" },
deathlink = {type = "normal", effect = "You are linked to your coffin", balance = {takey = "deathlink"}, state = "down", skill = "Deathlink" },


--Teradrim
earthenform = {type = "normal", effect = "Embrace your earthen features", balance = {takey = "earthenform embrace"}, state = "down", skill = "Earthenform" },
entwine = {type = "normal", effect = "Disarm when someone goes for your parried limb", balance = {takey = "earth entwine"}, state = "down", skill = "Entwine" },
ricochet =  {type = "normal", effect = "Bounce attacks back to cripple limbs at times", balance = {takey = "earth ricochet"}, state = "down", skill = "Ricochet" },
twinsoul = {type = "normal", effect = "Link your soul to your golem", balance = {takey = "golem twinsoul on"}, state = "down", skill = "Twinsoul" },
earth_resonance = {type = "normal", effect = "Boosted health/mana regen", balance = {takey = "earth resonance"}, state = "down", skill = "Resonance" },
stonebind = {type = "normal", effect = "They can't take your weapon", balance = {takey = "earth stonebind"}, state = "down", skill = "Stonebind" },
imbue_will = {type = "normal", effect = "Golem can hit freely next time", balance = {takey = "prepare earthenwill"}, state = "down", skill = "Earthenwill" },
erosion = {type = "normal", effect = "Erosion is useful on your weapon if you're sand sweltering", balance = {takey = "earth imbue erosion"}, state = "down", skill = "Erosion" },
imbue_stonefury = {type = "normal", effect = "Stonefury is useful on your weapon for bashing", balance = {takey = "earth imbue stonefury"}, state = "down", skill = "Stonefury" },
sand_swelter = {type = "normal", effect = "Your sands hit people in the room", balance = {takey = "sand swelter on"}, state = "down", skill = "Swelter" },



--Ascendril
missiles = {type = "normal", effect = "PvE damage", balance = {takey = "cast missiles on"}, state = "down", skill = "Missiles" },
sagacity = {type = "normal", effect = "extra mana recovery", balance = {takey = "cast sagacity"}, state = "down", skill = "Sagacity" },
arcaneskin = {type = "normal", effect = "Increased cutting/blunt resistances", balance = {needy = "cast arcaneskin"}, state = "down", skill = "Arcaneskin"},
countercurrent = {type = "normal", effect = "chance to resist venoms", balance = {needy = "cast countercurrent"}, state = "down", skill = "Countercurrent"},
stalled = {type = "normal", effect = "holding an attack", balance = {needy = ""}, state = "down", skill = "Stall"},

--Sciomancer
rigor = {type = "normal", effect = "WP drain but better crit chance", balance = {takey = "cast rigor on"}, state = "down", skill = "Rigor" },
shadow_engulf  = {type = "normal", effect = "Mask your movements", balance = {takey = "cast engulf on"}, state = "down", skill = "Engulf" },
shadow_mantle = {type = "normal", effect = "Reduce damage taken from elements", balance = {takey = "cast mantle"}, state = "down", skill = "Mantle" },
blurring = {type = "normal", effect = "Better diverting", balance = {takey = "cast blurring"}, state = "down", skill = "Blurring" },

--Zealot
firefist = {type = "normal", effect = "makes your fists attack cause ablaze", balance = {takey = "enact firefist"}, state = "down", skill = "Firefist" },
focalmark = {type = "normal", effect = "Enabled your use of purification abilities", balance = {takey = "enact focalmark"}, state = "down", skill = "Focalmark" },
tempered_body = {type = "normal", effect = "Resist cutting and blunt dmg", balance = {takey = "enact tempering"}, state = "down", skill = "Tempering" },
swagger = {type = "normal", effect = "Negates paresis only once", balance = {takey = "swagger"}, state = "down", skill = "Swagger" },
deflection = {type = "normal", effect = "Deflect arrows by chance, return them on success", balance = {takey = "enact deflection"}, state = "down", skill = "Deflection"},
discharge = {type = "normal", effect = "Store up dmgs until threshold, then it heal some of your wounds", balance = {takey = "enact discharge"}, state = "down", skill = "Discharge"},
resurgence = {type = "normal", effect = "Revive you once you died", balance = {takey = "enact resurgence"}, state = "down", skill = "Resurgence" },
haste = {type = "normal", effect = " +2 to movement", balance = {special = "haste"}, state = "down", skill = "Haste" },
litheness = {type = "normal", effect = "Suffer no malus to dodge chance when use channeling action", balance = {needybalance = "litheness"}, state = "down", skill = "Litheness" },
disunion = {type = "normal", effect = "give chance to reduce eq and bal timer", balance = {takey = "disunion"}, state = "down", skill = "Disunion" },
wrath = {type = "normal", effect = "see what other would parries in very short time", balance = {takey = "wrath"}, state = "down", skill = "Wrath" },
zenith = {type = "normal", effect = "cure a random AFF, use certain attacks off bal", balance = {takey = "enact zenith"}, state = "down", skill = "Zenith" },
mindspark = {type = "normal", effect = "raises your intelligence", balance = {needy = "psi mindspark"}, state = "down", skill = "Mindspark" },
bending = {type = "normal", effect = "magical damage reduction or something", balance = {needy = "psi bending"}, state = "down", skill = "Bending"},


-- Warden
battleflow = {type = "normal", effect = "Can attack with 1 broken arm.", balance = {takey = "warden battleflow on"}, state = "down", skill = "Battleflow"},
victory = {type = "normal", effect = "Automatically harvest renown.", balance = {special = "ancest victory on"}, state = "down", skill = "Victory"},
invocation = {type = "normal", effect = "Boosts defenses and weapon damage.", balance = {special = "ancest invocation"}, state = "down", skill = "Invocation"},
ancest_blessing_safeguard = {type = "normal", effect = "Boosts physical defense.", balance = {takey = "ancest blessing safeguard"}, state = "down", skill = "Safeguard"},
ancestral_bolster = {type = "normal", effect = "Increased constitution.", balance = {takey = "ancest bolster"}, state = "down", skill = "Bolster"},
intervention = {type = "normal", effect = "Protected from death.", balance = {takey = "ancest intervention"}, state = "down", skill = "Intervention"},
tacticianmark = {type = "yellow", effect = "simuls go zoom", balance = {}, state = "down", skill = "Generic"},
initiative = {type = "normal", effect = "Periodic heal on damage done.", balance = {takey = "warden initiative on"}, state = "down", skill = "Initiative"},
displacement = {type = "normal", effect = "Steals soul on hit.", balance = {takey = "ancest displacement"}, state = "down", skill = "Displacement"},
simulacrum_opening = {type = "normal", effect = "Increases damage done to mobs.", balance = {}, state = "down", skill = "Openings"},
severity = {type = "normal", effect = "Attacks hit through parry.", balance = {takey = "warden severity"}, state = "down", skill = "Severity"},
roaring = {type = "normal", effect = "Make them prone/off bal.", balance = {takey = "warden roaring on"}, state = "down", skill = "Roaring"},

}

whr.alternative_class_defenses = {
Luminary_constitution = {type = "normal", effect = "Protection against vomiting", balance = {takey = "perform constitution"}, state = "down", skill = "Constitution"},
Indorani_shroud = {type = "normal", effect = "Shrouded.",  balance = {takey = "shroud"}, state = "down", skill = "Shroud" },
Carnifex_shroud = {type = "normal", effect = "Shrouded.",  balance = {takey = "soul shroud"}, state = "down", skill = "Shroud" },
Syssin_shroud = {type = "normal", effect = "Shrouded.",  balance = {takey = "conjure cloak"}, state = "down", skill = "Cloak" },
Revenant_maingauche = {type = "normal", effect = "Chance to counter attack", balance = {takey = "maingauche"}, state = "down", skill = "MainGauche"},
Warden_shroud = {type = "normal", effect = "Shrouded.",  balance = {takey = "ancest distort"}, state = "down", skill = "Distort" },
Warden_fearless = {type = "normal", effect = "Protects against fear affliction.", balance = {special = "warden fortitude"}, state = "down", skill = "Fortitude"},
Earthcaller_constitution = {type = "normal", effect = "Protection against vomiting", balance = {takey = "dirge constitution"}, state = "down", skill = "Constitution"},
Artifact_shroud = {type = "normal", effect = "Shrouded.",  balance = {takey = "shroud"}, state = "down", skill = "Generic" },


}


