
-- for capturing combat message attacks
whr.aecho = {
attacker = "none",
ability = "none",
target = "none"
}

whr.supporting = "none"

whr.attacker = "none" -- last person we saw attack
whr.current_offense = "" -- which offense we're running
whr.last_attack = "none" -- last attack we used
whr.rebounded = false -- was rebounding hit?

whr.my_last_limb_damaged = "none" -- which of my limbs was hit last
whr.toparry = "none" -- which limb do I want to parry?
whr.my_resto = "none" -- which limb am I using restoration on
whr.cureset = "none" -- which cureset am I using?

whr.limb_targeting = { -- what am I targeting with each hand?
left = "none",
right = "none"
}

whr.last_cure = "" -- the last cure we saw used
whr.last_cured = "" -- which aff was cured
whr.people_hitting_me = {} -- list of who is attacking us
whr.who_called_affs = "" -- this person called some affs
whr.called_affs = {} -- someone called these affs
whr.last_affs = {} -- these affs landed hits
whr.last_limb_dmg = 0 -- damage of the last limb hit we saw

whr.pk_status_template = {
class = "none",
affs = {}, -- what affs do they have?
limb_dmg = { -- 33% is damaged, 66% is mangled
  head = 0,
  torso = 0,
  ["left arm"] = 0,
  ["right arm"] = 0,
  ["left leg"] = 0,
  ["right leg"] = 0,
  },
bruising = { -- 0 is none, 1 is light, 2 is moderate, 3 is critical
  head = 0,
  torso = 0,
  ["left arm"] = 0,
  ["right arm"] = 0,
  ["left leg"] = 0,
  ["right leg"] = 0,
  },
parrying = "none", -- what are they parrying?
last_limb = "none", -- which of their limbs was hit last?
resto_limb = "none", -- which limb did they resto?
tumbling = false, -- are they tumbling?
impaled = false, -- has anyone impaled them?
we_impaled = false, -- have /we/ impaled them?
shield = false, -- are they shielded?
rebounding = false, -- do they have rebounding?
paste = true, -- do they have fangbarrier?
}

whr.victim = {} -- this will be filled with the status table of our target

whr.giving = {} -- our queue of affs to give


-- convert affs to venoms/attacks

whr.effects = {
--venoms
sight = "oculus",
hearing = "prefarar",
asthma = "kalmia", 
paresis = "curare", 
clumsiness = "xentio", 
sensitivity = "prefarar", 
vomiting = "euphorbia",
allergies = "darkshade", 
colocasia = "colocasia", 
haemophilia = "hepafarin", 
peace = "ouabain", 

stupidity = "aconite", 
weariness = "vernalius", 
recklessness = "eurypteria", 
dizziness = "larkspur", 
shyness = "digitalis", 

anorexia = "slike",
belonephobia = "araceae",
slickness = "gecko",

voyria = "voyria", --immunity

squelched = "selarnia",
disfigurement = "monkshood",

thin_blood = "scytherus",
left_leg_broken = "epseth",
right_leg_broken = "epseth",
left_arm_broken = "epteth",
right_arm_broken = "epteth",

conviction = "conviction",
mental_disruption = "disrupt",
physical_disruption = "disrupt",
crippled = "cripple",
crippled_body = "cripple",
hemorrhage = "hemorrhage",

rend = "rend",
}

function whr.rev_empower(aff)

   local revenant = {
        ["conviction"] = "bimre",
        ["disrupt"] = "dirne",
        ["cripple"] = "azu",
        ["hemorrhage"] = "wilave",
                    }
    if revenant[aff] == nil then return aff
    else return revenant[aff]
    end
end

whr.spirituality_attacks = {
paresis = "shield strike",
sight = "shield brilliance",
berserking = "shield facesmash",
weariness = "shield punch",
asthma = "shield slam",
haemophilia = "shield slam",
confusion = "perform dazzle",
writhe_transfix = "evoke transfixion",
}

whr.subjugation_attacks = {
paresis = "shield strike",
sight = "shield horrify",
berserking = "shield facesmash",
weariness = "shield punch",
asthma = "shield slam",
haemophilia = "shield slam",
confusion = "dirge hysteria",
writhe_transfix = "dirge transfixion",
}

whr.hound_attacks = {
  ["Carnifex"] = {
    recklessness = "growl",
    dizziness = "growl",
    berserking = "stare",
    impairment = "stare",
    weariness = "acidspit",
    crippled = "acidspit",
    epilepsy = "shock",
    hallucinations = "shock",
    blisters = "poisonclaw",
    limp_veins = "poisonclaw",
    frozen = "tundralhowl",
    shivering = "tundralhowl",
    no_caloric = "tundralhowl",
    blurry_vision = "ululate",
    mark = "mark",
              },
  ["Warden"] = {
    recklessness = "chant",
    dizziness = "chant",
    berserking = "incite",
    impairment = "incite",
    weariness = "harry",
    crippled = "harry",
    epilepsy = "shock",
    hallucinations = "shock",
    blisters = "poison",
    limp_veins = "poison",
    frozen = "freeze",
    shivering = "freeze",
    no_caloric = "freeze",
    blurry_vision = "dirge",
    mark = "mark",
  }
}

-- ordered lists of affs by cure, for tracking
whr.cures = {

amaurosis = {
"sight",
},

ototoxin = {
"hearing",
},

panacea = {
"stormtouched",
"patterns",
"shaderot_body",
"shaderot_wither",
"shaderot_heat",
"shaderot_spirit",
"shaderot_benign",
},

anabiotic = {
"plodding",
"idiocy",
},

opiate = {
"paralysis",
"paresis",
"mirroring",
"crippled_body",
"crippled",
"blisters",
"slickness",
"heartflutter",
"sandrot",
},

steroid = {
"hubris",
"pacifism",
"peace",
"accursed",
"agony",
"limp_veins",
"lovers_effect",
"laxity",
"supersition",
"generosity",
"justice",
"magnanimity",
},

coagulation = {
"body_odor",
"lethargy",
"allergies",
"mental_disruption",
"physical_disruption",
"vomiting",
"exhausted",
"thin_blood",
"rend",
"haemophilia",
},

depressant = {
"commitment_fear",
"merciful",
"recklessness",
"egocentric",
"masochism",
"agoraphobia",
"loneliness",
"berserking",
"vertigo",
"claustrophobia",
"nyctophobia",
},

decongestant = {
"baldness",
"clumsiness",
"hypochondria",
"weariness",
"asthma",
"sensitivity",
"ringing_ears",
"impairment",
"blood_poison",
},

euphoriant = {
"self_pity",
"stupidity",
"dizziness",
"faintness",
"shyness",
"epilepsy",
"impatience",
"dissonance",
"infested",
},

antipsychotic = {
"sadness",
"confusion",
"dementia",
"hallucinations",
"paranoia",
"hatred",
"addiction",
"hypersomnia",
"blood_curse",
"blighted",
},

eucrasia = {
"worrywart",
},

willow = {
"aeon",
"hellsight",
"deadening"
},

yarrow = {
"slickness",
"withering",
"disfigurement",
"migraine",
"squelched"
},

epidermal = {
"anorexia",
"gorged",
"effused_blood",
"indifference",
"stuttering",
"blurry_vision",
"blindness",
"deafness"
},

caloric = {
"hypothermia",
"ice_encased",
"frozen",
"shivering",
"no_caloric"
},

focus = {
"muddled",
"egocentric",
"stupidity",
"anorexia",
"epilepsy",
"mirroring",
"mental_disruption",
"peace",
"paranoia",
"hallucinations",
"stuttering",
"dizziness",
"indifference",
"berserking",
"pacifism",
"lovers_effect",
"laxity",
"hatred",
"generosity",
"claustrophobia",
"vertigo",
"faintness",
"loneliness",
"agoraphobia",
"masochism",
"recklessness",
"weariness",
"impatience",
"confusion",
"dementia",
"nyctophobia",
"premonition"
},

}

whr.entangleaffs = {
  "writhe_armpitlock",
  "writhe_bind",
  "writhe_grappled",
  "writhe_gunk",
  "writhe_hoist",
  "writhe_impaled",
  "writhe_lure",
  "writhe_necklock",
  "writhe_ropes",
  "writhe_stasis",
  "writhe_thighlock",
  "writhe_transfix",
  "writhe_vines",
  "writhe_web",
 }


-- which skills go with which curesets
whr.cureset_skills = {
ascendril = {"Elemancy", "Arcanism", "Thaumaturgy"},
sciomancer = {"Sciomancy", "Sorcery", "Gravitation"},
indorani = {"Necromancy", "Tarot", "Domination","Hyalincuru", "Contracts", "Oneiromancy"},
praenomen = {"Corpus", "Mentis", "Sanguis"},
archivist = {"Geometrics", "Numerology", "Bioessence"},
teradrim = {"Terramancy", "Animation", "Desiccation"},
luminary = {"Spirituality", "Devotion", "Illumination","Tectonics", "Fervour", "Subjugation"},
sentinel = {"Dhuriv", "Woodlore", "Tracking"},
shaman = {"Primality", "Shamanism", "Naturalism"},
monk = {"Tekura", "Kaido", "Telepathy"},
zealot = {"Zeal", "Purification", "Psionics"},
syssin = {"Assassination", "Subterfuge", "Hypnosis"},
shifter = {"Ferality", "Shapeshifting", "Vocalizing"},
wayfarer = {"Tenacity", "Wayfaring", "Fury"},
templar = {"Battlefury", "Righteousness", "Bladefire", "Chirography", "Riving", "Manifestation"},
carnifex = {"Savagery", "Deathlore", "Warhounds", "Warding", "Ancestry", "Communion"},
}