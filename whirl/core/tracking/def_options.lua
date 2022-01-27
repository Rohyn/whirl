
function whr.loadDef(option)
  if whr.def_options[option] ~= nil then
    whr.message("Loading defense options for: "..option..".", "echo")
    if gmcp.Char.Status.race == "Azudim" then
      whr.def_options[option]["miasma"] = "on"
    elseif gmcp.Char.Status.race == "Yeleni" then
      whr.def_options[option]["warmth"] = "on"
    elseif gmcp.Char.Status.race == "Idreth" then
      whr.def_options[option]["safeguard"] = "on"
    end

    -- start by building a full list of defs we want
    local total_defs = {}
    if option ~= "none" then
      for _,def in pairs(whr.def_options.general_defs) do
        table.insert(total_defs, def)
      end
      for _,def in pairs(whr.def_options[option]) do
        table.insert(total_defs, def)
      end
    end
    -- now load these defs into the list of ones we want to keep
    whr.defs_wanted = {}
    whr.less_defs = {} -- and the list of ones to remove once we raise them once
    for i in pairs(total_defs) do
      if whr.defenses[i] and whr.haveSkill(whr.defenses[i].skill) then
        table.insert(whr.defs_wanted, i)
        if total_defs[i] == "once" then
          table.insert(whr.less_defs, i)
        end
      end
    end
  else
    whr.message("No such defense option as "..option.."!", "echo")
  end
end

whr.defs_wanted = {}
whr.less_defs = {}
whr.defs_waiting = {}

whr.def_options = {

none = {

},

general_defs = {
thirdeye = "on",
mindseye = "on",
cloak = "on",
instawake = "on",
deathsight = "on",
insomnia = "on",
temperance = "on",
venom_resistance = "on",
levitation = "on",
speed = "on",
insulation = "on",
dodge_melee = "on",
nightsight = "on",
clarity = "once",
--heatsight = "once",
},


templar = {
gripping = "on",
fitness = "once",
maingauche = "once",
shroud = "on",
},

revenant = {
gripping = "on",
fitness = "once",
maingauche = "once",
},

luminary = {
lightshield = "once",
inspiration_constitution = "once",
fireblock = "once",
constitution = "once",
shroud = "on",
},

earthcaller = {
heatshield = "once",
battlehymn_constitution = "once",
smothering = "once",
constitution = "once",
},

syssin = {
warding = "once",
finesse = "once",
--hiding = "once",
shadowsight = "once",
ghosted = "on",
shroud = "on",
--shadowslip = "once",
lipreading = "on",
},

monk = {
weathering = "on",
toughness = "on",
vitality = "on",
kaido_regeneration = "on",
resistance = "on",
constitution = "on",
split_mind = "on",
kaido_immunity = "on",
boosted_regen = "on",
fitness = "once",
},

carnifex = {
fearless = "on",
reveling = "once",
recklessness = "once",
soulharvest = "on",
soulthirst = "on",
soul_fortify = "on",
soul_fracture = "on",
soul_body = "once",
gripping = "on",
fitness = "once",
herculeanrage = "once",
},

shapeshifter = {
weathering = "on",
bodyheat = "once",
metabolism = "once",
celerity = "once",
thickhide = "once",
cornering = "once",
--harden = "once",
},

sentinel = {
gripping = "on",
fitness = "once",
lifesap = "on",
barkskin = "on",
hardiness = "on",
concealed = "once",
masked_scent = "once",
vitality = "on",
flexibility = "once",
foreststride = "once",
},

archivist = {
gripping = "on",
--spheres =  "once",
linked = "once",
--oneness = "once",
sublimation = "once",
ameliorate = "once",
--catabolism = "once",
},

indorani = {
gripping = "on",
deathaura = "once",
lifevision = "on",
soulmask = "on",
gravechill = "on",
vengeance = "on",
soulcage = "on",
shroud = "on",
hierophant = "once",
chariot = "on",
eclipse = "on",
devilpact = "on",
},

oneiromancer = {
gripping = "on",
intoxication = "once",
lifevision = "on",
redoubt = "on",
glaciation = "on",
defiance = "on",
remembrance = "on",
shroud = "on",
fan = "once",
crane = "on",
cloud = "on",
faerie = "on",
},

shaman = {
lifevision = "on",
spiritbond = "on",
protection = "on",
shaman_spiritsight = "once",
lifebloom = "on",
shaman_warding = "on",
},

praenomen = {
potence_constitution = "once",
fortify = "on",
corpus_warding = "on",
celerity = "once",
lifescent = "once",
lifevision = "once",
veil = "on",
stalk = "once",
concentrate = "on",
},

teradrim = {
earthenform = "on",
entwine = "on",
ricochet = "on",
twinsoul = "on",
earth_resonance = "on",
stonebind = "on",
imbue_will = "once",
imbue_stonefury = "on",
--sand_swelter = "once",
},


wayfarer = {
ironskin = "on",
--blindsense = "on",
--greenheart = "on",
--endure = "once",
--mountaineer = "on",
--dustcoat = "on",
--resilience = "on",
--desolation = "on",
--circulation = "on",
},

ascendril = {
countercurrent = "on",
sagacity = "on",
arcaneskin = "on",
missiles = "on",
},

sciomancer = {
rigor = "once",
shadow_engulf  = "once",
shadow_mantle = "once",
blurring = "once",
sagacity = "once",
},

zealot = {
focalmark = "on",
tempered_body = "on",
haste = "on",
swagger = "on",
litheness = "on",
bending = "on",
disunion = "on",
clarity = "on",
resurgence = "on",
discharge = "on",
deflection = "on",
mindspark = "on",

},

warden = {
fearless = "on",
initiative = "once",
battleflow = "once",
victory = "on",
displacement  = "on",
ancestral_bolster = "on",
invocation  = "on",
gripping = "on",
fitness = "once",
roaring  = "once",
intervention = "once",
shroud = "once",
},

}