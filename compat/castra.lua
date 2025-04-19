require "util"

local m_prefix = "__castra__"

data:extend({
	-- basic Castra materials
	VC_COMPAT.compatibility_tech("castra", {"s6x-void-thruster", "planet-discovery-castra"}, 500, "cel")
})
if (VC_COMPAT.scienceCraft) then
	local voidlore = {
		VOIDCRAFT.lore_voidtech("battlefield", {"mouseas-void-castra"}, 500, "cel", m_gfx_prefix)
	}
	data:extend(voidlore)
end


-- item subgroups

data:extend({
	{
		type = "item-subgroup",
		name = "voidcraft-castra",
		order = "vpcas",
		group = "voidcraft-grp"
	}, 
	{
		type = "item-subgroup",
		name = "voidcraft-castra-flx",
		order = "vpcas-za",
		group = "voidcraft-flx-grp"
	},
	{
		type = "item-subgroup",
		name = "voidcraft-castra-coh",
		order = "vpcas-zb",
		group = "voidcraft-coh-grp"
	}
})

-- recipes
local added_recipes = {
	-- voidcrafting
	VOIDCRAFT.voidcraft_recipe({prefix = m_prefix, subgroup = "voidcraft-castra", icopy="item"}, {"gunpowder", "carbon", "stone"}, "vpcas-xa", 4, "mouseas-void-castra", {0.1, 0.1, 0.1}),
	VOIDCRAFT.voidcraft_recipe({prefix = m_prefix, subgroup = "voidcraft-castra", icopy="item"}, {"millerite", "iron-ore", "copper-ore"}, "vpcas-xb", 16, "mouseas-void-castra", {0.9, 0.8, 0.25}),
	VOIDCRAFT.voidcraft_recipe({prefix = m_prefix, subgroup = "voidcraft-castra", fluid = 240, secondary_item = true, midpath = "/graphics/icons/fluid/", icopy="fluid"}, {"hydrogen-sulfide", "sulfur", "carbon"}, "vpcas-xc", 24, "mouseas-void-castra", {1.0, 1.0, 0.2}),
	VOIDCRAFT.voidcraft_recipe({prefix = m_prefix, subgroup = "voidcraft-castra", icopy="item"}, {"castra-data", "uranium-ore", "gunpowder"}, "vpcas-xd", 20, "mouseas-void-castra", {0.4, 0.2, 0.1}),
}

-- voidlore
if (VC_COMPAT.scienceCraft) then
	table.insert(added_recipes, VOIDCRAFT.voidcraft_recipe({prefix = m_prefix, subgroup = "voidcraft-castra", exalted = true}, {"battlefield-science-pack", "millerite", "gunpowder"}, "vpcas-a", 750, nil, {0.4, 0.0, 0.0}))
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