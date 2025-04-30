require "util"

local m_prefix = "__secretas__"

-- basic Secretas materials
local frozeta_materials_tech = VC_COMPAT.compatibility_tech("frozeta", {"s6x-void-thruster", "planet-discovery-secretas"}, 500, "cel")
data:extend({ frozeta_materials_tech })
if (VC_COMPAT.scienceCraft) then
	local voidlore = VOIDCRAFT.lore_voidtech("golden", {"mouseas-void-frozeta"}, 500, "cel", m_prefix)
	voidlore.icons[2] = { icon = m_prefix .. "/graphics/technology/gold-science-pack.png", icon_size=256, scale = 0.25, shift={24,16} } -- grumble grumble item name doesn't match image name
	data:extend({ voidlore })
end


-- item subgroups

data:extend({
	{
		type = "item-subgroup",
		name = "voidcraft-frozeta",
		order = "vpsaf",
		group = "voidcraft-grp"
	}, 
	{
		type = "item-subgroup",
		name = "voidcraft-frozeta-flx",
		order = "vpsaf-za",
		group = "voidcraft-flx-grp"
	},
	{
		type = "item-subgroup",
		name = "voidcraft-frozeta-coh",
		order = "vpsaf-zb",
		group = "voidcraft-coh-grp"
	}
})

-- recipes
local added_recipes = {
	-- voidcrafting
	VOIDCRAFT.voidcraft_recipe({prefix = m_prefix, subgroup = "voidcraft-frozeta", icopy="item"}, {"spaceship-scrap", "scrap", "iron-gear-wheel"}, "vpsaf-xa", 16, "mouseas-void-frozeta", {0.2, 0.4, 0.8}),
}
-- gold ore may be added by Metal & Stars or Common Prototypes mod(s), let's not add a recipe for it twice.
if not data.raw.recipe["s6xvc-gold-ore"] then
	table.insert(added_recipes, VOIDCRAFT.voidcraft_recipe({prefix = m_prefix, subgroup = "voidcraft-frozeta", icopy="item"}, {"gold-ore", "copper-ore", "stone"}, "vpsaf-xb", 4, "mouseas-void-frozeta", {1.0, 0.9, 0.2}))
else
	table.insert(frozeta_materials_tech.effects, { type="unlock-recipe", recipe="s6xvc-gold-ore" })
end
-- voidlore
if (VC_COMPAT.scienceCraft) then
	table.insert(added_recipes, VOIDCRAFT.voidcraft_recipe({prefix = m_prefix, subgroup = "voidcraft-frozeta", exalted = true}, {"golden-science-pack", "gold-plate", "solid-fuel"}, "vpsaf-a", 360, nil, {1.0, 0.9, 0.2}))
end

-- make flux and coherence versions of the recipes
local fluxized_recipes = {}
local coherized_recipes = {}
for r, rd in pairs(added_recipes) do
    rd.vc_fluxize = true
    rd.vc_coherize = true
    table.insert(fluxized_recipes, VOIDCRAFT.fluxize(rd))
    table.insert(coherized_recipes, VOIDCRAFT.coherize(rd))
end

data:extend(added_recipes)
data:extend(fluxized_recipes)
data:extend(coherized_recipes)