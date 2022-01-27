
whr.callers = {} -- list of people to accept wt target calls from
whr.group = {} -- list of people we are working with (usually bashing)
whr.delete_prompt = false -- for certain gags
whr.spirit_people = {}
whr.shadow_people = {}
whr.eld = 0

-- associate short pill names with long ones
whr.pills = {
acuity = "a pill of acuity",
amaurosis = "a pill of amaurosis",
anabiotic = "an anabiotic pill",
antipsychotic = "an antipsychotic pill",
coagulation = "a coagulation pill",
decongestant = "a decongestant pill",
depressant = "a depressant pill",
euphoriant = "an euphoriant pill",
kawhe = "a kawhe pill",
opiate = "an opiate pill",
ototoxin = "an ototoxin pill",
panacea = "a panacea pill",
steroid = "a steroid pill",
stimulant = "a stimulant pill",
thanatonin = "a thanatonin pill",
eucrasia = "an eucrasia pill",
waterbreathing = "a pill of waterbreathing",
}

-- pills that take gmcp.Char.Vitals.herb balance
whr.balance_pills = {
"antipsychotic",
"amaurosis",
"steroid",
"opiate",
"panacea",
"euphoriant",
"ototoxin",
"decongestant",
"stimulant",
"depressant",
"waterbreathing",
"eucrasia",
}

-- track which pills are out of cache
whr.outced = {
antipsychotic = 0,
eucrasia = 0,
amaurosis = 0,
steroid = 0,
opiate = 0,
panacea = 0,
euphoriant = 0,
ototoxin = 0,
decongestant = 0,
stimulant = 0,
depressant = 0,
waterbreathing = 0,
}

-- weapon types, for tracking wielded items
whr.weapon_types = {
"club",
"flail",
"mace",
"morningstar",
"greatmaul",
"warhammer",
"handaxe",
"javelin",
"battleaxe",
"broadsword",
"dagger",
"stiletto",
"dirk",
"falchion",
"falcata",
"flyssa",
"longsword",
"rapier",
"sarissa",
"scimitar",
"shortsword",
"spear",
"trident",
"whip",
"bardiche",
"bastard",
"falx",
"glaive",
"halberd",
"scythe",

"banded",
"buckler",
"cavalry",
"kite",
"tower",
"shield",
}