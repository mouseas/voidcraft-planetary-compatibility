require "util"

local m_prefix = "__Moshine__"

local moshine_materials_tech = VC_COMPAT.compatibility_tech("moshine", {"s6x-void-thruster", "planet-discovery-moshine"}, 500, "cel")
data:extend({ moshine_materials_tech })

-- there's no void lore tech because there's no science pack from this planet

-- item subgroups
data:extend({
	{
		type = "item-subgroup",
		name = "voidcraft-moshine",
		order = "vpmos",
		group = "voidcraft-grp"
	}, 
	{
		type = "item-subgroup",
		name = "voidcraft-moshine-flx",
		order = "vpmos-za",
		group = "voidcraft-flx-grp"
	},
	{
		type = "item-subgroup",
		name = "voidcraft-moshine-coh",
		order = "vpmos-zb",
		group = "voidcraft-coh-grp"
	}
})

-- recipes
local added_recipes = {
	-- voidcrafting
	VOIDCRAFT.voidcraft_recipe({prefix = m_prefix, subgroup = "voidcraft-moshine", icopy="item"}, {"neodymium", "iron-ore", "stone"}, "vpmas-xb", 4, "mouseas-void-moshine", {0.9, 0.9, 0.9}),
}

-- sand might be added by Maraxsis, let's not add it twice.
if not data.raw["recipe"]["s6xvc-sand"] then
	table.insert(added_recipes, VOIDCRAFT.voidcraft_recipe({prefix = m_prefix, subgroup = "voidcraft-moshine", icopy="item"}, {"sand", "stone", "carbon"}, "vpmas-xa", 4, "mouseas-void-moshine", {0.9, 0.95, 0.5}))
else
	-- if the recipe already exists, Moshine's tech should also unlock it.
	table.insert(moshine_materials_tech["effects"], { type="unlock-recipe", recipe="s6xvc-sand"})
end

-- glass might be added by another mod
if not data.raw["recipe"]["s6xvc-glass"] then
	table.insert(added_recipes, VOIDCRAFT.voidcraft_recipe({prefix = m_prefix, subgroup = "voidcraft-moshine", icopy="item"}, {"glass", "sand", "stone"}, "vpmas-xc", 16, "mouseas-void-moshine", {1, 1, 1}))
else
	table.insert(moshine_materials_tech["effects"], { type="unlock-recipe", recipe="s6xvc-glass"})
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