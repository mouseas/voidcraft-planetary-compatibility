require "util"

local m_prefix = "__corrundum__"

data:extend({
	-- basic Corrundum materials
	VC_COMPAT.compatibility_tech("corrundum", {"s6x-void-thruster", "planet-discovery-corrundum"}, 500, "cel"),
	-- platinum plate
	VC_COMPAT.compatibility_tech("platinum-plate", {"mouseas-void-corrundum", "platinum-processing"}, 500, "cel")
})
if (VC_COMPAT.scienceCraft) then
	local voidlore = VOIDCRAFT.lore_voidtech("electrochemical", {"mouseas-void-corrundum"}, 500, "cel", m_prefix)
	data:extend({ voidlore })
end

-- item subgroups

data:extend({
	{
		type = "item-subgroup",
		name = "voidcraft-corrundum",
		order = "vpcor",
		group = "voidcraft-grp"
	}, 
	{
		type = "item-subgroup",
		name = "voidcraft-corrundum-flx",
		order = "vpcor-za",
		group = "voidcraft-flx-grp"
	},
	{
		type = "item-subgroup",
		name = "voidcraft-corrundum-coh",
		order = "vpcor-zb",
		group = "voidcraft-coh-grp"
	}
})

-- recipes
local added_recipes = {
	-- voidcrafting
	VOIDCRAFT.voidcraft_recipe({prefix = m_prefix, subgroup = "voidcraft-corrundum", icopy="item"}, {"platinum-ore", "iron-ore", "stone"}, "vpcor-xa", 16, "mouseas-void-corrundum", {0.4, 0.4, 0.4}),
	VOIDCRAFT.voidcraft_recipe({prefix = m_prefix, subgroup = "voidcraft-corrundum", icopy="item"}, {"chalcopyrite-ore", "copper-ore", "stone"}, "vpcor-xb", 4, "mouseas-void-corrundum", {0.2, 0.2, 1.0}),
	--VOIDCRAFT.voidcraft_recipe({prefix = m_prefix, subgroup = "voidcraft-corrundum", icopy="item"}, {"calcium-sulfate", "calcite", "stone"}, "vpcor-xd", 20, "mouseas-void-corrundum", {0.4, 0.2, 0.1}),
	VOIDCRAFT.voidcraft_recipe({prefix = m_prefix, subgroup = "voidcraft-corrundum", icopy="item"}, {"platinum-plate", "platinum-ore", "iron-ore"}, "vpcor-xe", (16*4)+2, "mouseas-void-platinum-plate", {0.9, 0.8, 0.25}),
}

if not mods["castra"] then
	table.insert(added_recipes, VOIDCRAFT.voidcraft_recipe({prefix = m_prefix, subgroup = "voidcraft-corrundum", fluid = 240, secondary_item = true, midpath = "/graphics/icons/fluid/", icopy="fluid"}, {"hydrogen-sulfide", "sulfur", "carbon"}, "vpcor-xc", 24, "mouseas-void-corrundum", {1.0, 1.0, 0.2}))
else
	table.insert(data.raw["technology"]["mouseas-void-corrundum"]["effects"], {
		type = "unlock-recipe",
		recipe = "s6xvc-hydrogen-sulfide"
	})
end

-- voidlore
if (VC_COMPAT.scienceCraft) then
	table.insert(added_recipes, VOIDCRAFT.voidcraft_recipe({prefix = m_prefix, subgroup = "voidcraft-corrundum", exalted = true}, {"electrochemical-science-pack", "platinum-plate", "sulfur"}, "vpcor-a", 750, nil, {0.4, 0.0, 0.0}))
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