require "util"

local m_prefix = "__maraxsis__"

data:extend({
	-- basic Maraxsis materials
	VC_COMPAT.compatibility_tech("maraxsis", {"s6x-void-vulcanus", "s6x-void-fulgora", "s6x-void-gleba", "planet-discovery-maraxsis"}, 1500, "cel"),
	-- salt
	VC_COMPAT.compatibility_tech("salt", {"mouseas-void-maraxsis", "maraxsis-hydro-plant"}, 1000, "cel"),
	-- glass
	VC_COMPAT.compatibility_tech("glass", {"mouseas-void-maraxsis", "maraxsis-glassworking"}, 1000, "cel"),
})
if (VC_COMPAT.scienceCraft) then
	local voidlore = VOIDCRAFT.lore_voidtech("hydraulic", {"s6x-voidlore-metallurgic", "s6x-voidlore-electromagnetic", "s6x-voidlore-agricultural", "mouseas-void-maraxsis"}, 500, "cel", m_prefix)
	data:extend({
		voidlore
	})
end

-- item subgroups

data:extend({
	{
		type = "item-subgroup",
		name = "voidcraft-maraxsis",
		order = "vpm",
		group = "voidcraft-grp"
	}, 
	{
		type = "item-subgroup",
		name = "voidcraft-maraxsis-flx",
		order = "vpm-za",
		group = "voidcraft-flx-grp"
	},
	{
		type = "item-subgroup",
		name = "voidcraft-maraxsis-coh",
		order = "vpm-zb",
		group = "voidcraft-coh-grp"
	}
})

-- recipes
local added_recipes = {
	-- voidcrafting
	VOIDCRAFT.voidcraft_recipe({prefix = m_prefix, subgroup = "voidcraft-maraxsis", img="sand-1"}, {"sand", "stone", "maraxsis-coral"}, "vpm-xa", 2, "mouseas-void-maraxsis", {0.78, 0.74, 0.74}),
	VOIDCRAFT.voidcraft_recipe({prefix = m_prefix, subgroup = "voidcraft-maraxsis", img="limestone-1"}, {"limestone", "maraxsis-coral", "sand"}, "vpm-xa", 4, "mouseas-void-maraxsis", {0.78, 0.74, 0.74}),
	VOIDCRAFT.voidcraft_recipe({prefix = m_prefix, subgroup = "voidcraft-maraxsis", fluid = 240, secondary_item = true, midpath = "/graphics/icons/", icopy="fluid"}, {"maraxsis-saline-water", "stone", "salt"}, "vpm-xb", 4, "mouseas-void-maraxsis", {0.22, 0.32, 0.7}),
	VOIDCRAFT.voidcraft_recipe({prefix = m_prefix, subgroup = "voidcraft-maraxsis", img="tropical-fish"}, {"maraxsis-tropical-fish", "maraxsis-coral", "sand"}, "vpm-xc", 6, "mouseas-void-maraxsis", {0.92, 0.35, 0.1}),
	VOIDCRAFT.voidcraft_recipe({prefix = m_prefix, subgroup = "voidcraft-maraxsis", fluid = 240, secondary_item = true, midpath = "/graphics/icons/", icopy="fluid"}, {"maraxsis-atmosphere", "sand", "limestone"}, "vpm-xd", 32, "mouseas-void-maraxsis", {0.55, 0.72, 0.74}),
	VOIDCRAFT.voidcraft_recipe({prefix = m_prefix, subgroup = "voidcraft-maraxsis", img="coral-1"}, {"maraxsis-coral", "limestone", "sand"}, "vpm-xe", 4, "mouseas-void-maraxsis", {0.2, 0.61, 0.5}),
	VOIDCRAFT.voidcraft_recipe({prefix = m_prefix, subgroup = "voidcraft-maraxsis", img="salt-1"}, {"salt", "sand", "stone"}, "vpm-xf", 8, "mouseas-void-salt", {0.78, 0.74, 0.74}),
	VOIDCRAFT.voidcraft_recipe({prefix = m_prefix, subgroup = "voidcraft-maraxsis", img="glass-1"}, {"maraxsis-glass-panes", "salt", "sand"}, "vpm-xg", 28, "mouseas-void-glass", {0.3125, 0.86, 0.9}),
	
}
-- voidlore
if (VC_COMPAT.scienceCraft) then
	table.insert(added_recipes, VOIDCRAFT.voidcraft_recipe({prefix = m_prefix, subgroup = "voidcraft-maraxsis", exalted = true}, {"hydraulic-science-pack", "salt", "sand"}, "vpm-a", 750, nil, {0.25, 0.45, 0.85}))
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
if (data.raw["technology"]["maraxsis-glass-productivity"]) then
	if (data.raw["recipe"]["s6xvc-glass-1"]) then -- voidcraft uses the img string when naming its VC recipes...
		VC_COMPAT.addRecipeToProducitivityTech("maraxsis-glass-productivity", "s6xvc-glass-1", 0.1, true, true)
	elseif (data.raw["recipe"]["s6xvc-maraxsis-glass"]) then -- this is what it *should* be named.
		VC_COMPAT.addRecipeToProducitivityTech("maraxsis-glass-productivity", "s6xvc-maraxsis-glass", 0.1, true, true)
	end
end

if (VC_COMPAT.scienceCraft and data.raw["technology"]["maraxsis-promethium-productivity"]) then
	VC_COMPAT.addRecipeToProducitivityTech("maraxsis-promethium-productivity", "s6xvc-promethium-science-pack", 0.1, true, true)
end