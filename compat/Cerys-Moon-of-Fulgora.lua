require "util"

local m_prefix = "__Cerys-Moon-of-Fulgora__"

data:extend({
	-- basic Cerys materials
	VC_COMPAT.compatibility_tech("cerys", {"s6x-void-thruster", "moon-discovery-cerys"}, 500, "cel"),
})
if (VC_COMPAT.scienceCraft) then
	local voidlore = VOIDCRAFT.lore_voidtech("cerysian", {}, 500, "cel", m_prefix)
	data:extend({
		voidlore
	})
end

-- item subgroups

data:extend({
	{
		type = "item-subgroup",
		name = "voidcraft-cerys",
		order = "vpc",
		group = "voidcraft-grp"
	}, 
	{
		type = "item-subgroup",
		name = "voidcraft-cerys-flx",
		order = "vpc-za",
		group = "voidcraft-flx-grp"
	},
	{
		type = "item-subgroup",
		name = "voidcraft-cerys-coh",
		order = "vpc-zb",
		group = "voidcraft-coh-grp"
	}
})


-- recipes
local added_recipes = {
	-- voidcrafting
	VOIDCRAFT.voidcraft_recipe({prefix = m_prefix, subgroup = "voidcraft-cerys", icopy="item"}, {"methane-ice", "stone", "ice"}, "vpm-xa", 2, "mouseas-void-cerys", {0.78, 0.85, 0.7}),
	VOIDCRAFT.voidcraft_recipe({prefix = m_prefix, subgroup = "voidcraft-cerys", icopy="item"}, {"cerys-nuclear-scrap", "concrete", "iron-gear-wheel"}, "vpc-xb", 2, "mouseas-void-cerys", {0.5, 0.65, 0.5}),
	VOIDCRAFT.voidcraft_recipe({prefix = m_prefix, subgroup = "voidcraft-cerys", icopy="item"}, {"cerys-nitrogen-rich-minerals", "methane-ice", "iron-ore"}, "vpc-xc", 2, "mouseas-void-cerys", {0.22, 0.25, 0.22})
	
}
-- voidlore
if (VC_COMPAT.scienceCraft) then
	table.insert(added_recipes, VOIDCRAFT.voidcraft_recipe({prefix = m_prefix, subgroup = "voidcraft-cerys", exalted = true}, {"cerysian-science-pack", "methane-ice", "cerys-nuclear-scrap"}, "vpm-a", 750, nil, {0.2, 0.85, 0.85}))
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

-- add productivity to relevant Voidcraft recipes
if (data.raw["technology"]["holmium-plate-productivity-1"]) then
	VC_COMPAT.addRecipeToProducitivityTech("holmium-plate-productivity-1", "s6xvc-holmium-plate", 0.1, true, true)
end
if (data.raw["technology"]["holmium-plate-productivity-2"]) then
	VC_COMPAT.addRecipeToProducitivityTech("holmium-plate-productivity-2", "s6xvc-holmium-plate", 0.1, true, true)
end
