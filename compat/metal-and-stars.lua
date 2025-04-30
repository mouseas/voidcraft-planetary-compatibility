require "util"

local m_prefix = "__metal-and-stars__"
local m_gfx_prefix = "__metal-and-stars-graphics__"
local m_gfx2_prefix = "__metal-and-stars-graphics-2__"
local cp_gfx_prefix = "__common-prototypes-graphics__"

data:extend({
	VC_COMPAT.compatibility_tech("mas-shipyard", {"s6x-void-thruster", "planet-discovery-shipyard"}, 500, "cel"),
	VC_COMPAT.compatibility_tech("mas-nix", {"s6x-void-thruster", "planet-discovery-nix"}, 500, "cel"),
	VC_COMPAT.compatibility_tech("mas-ringworld", {"s6x-void-thruster", "planet-discovery-ringworld"}, 500, "cel"),
	VC_COMPAT.compatibility_tech("mas-mirandus", {"s6x-void-thruster", "planet-discovery-mirandus"}, 500, "cel"),
})
if (VC_COMPAT.scienceCraft) then
	local voidlore = {
		VOIDCRAFT.lore_voidtech("nanite", {"mouseas-void-mas-shipyard"}, 500, "cel", m_gfx_prefix),
		VOIDCRAFT.lore_voidtech("anomaly", {"mouseas-void-mas-nix"}, 500, "cel", m_gfx_prefix),
		VOIDCRAFT.lore_voidtech("ring", {"mouseas-void-mas-ringworld"}, 500, "cel", m_gfx_prefix),
		VOIDCRAFT.lore_voidtech("quantum", {"mouseas-void-mas-mirandus"}, 500, "cel", m_gfx_prefix)
	}
	data:extend(voidlore)
end

-- item subgroups

data:extend({
	{
		type = "item-subgroup",
		name = "voidcraft-mas-shipyard",
		order = "vpmas-sh",
		group = "voidcraft-grp"
	}, 
	{
		type = "item-subgroup",
		name = "voidcraft-mas-shipyard-flx",
		order = "vpmas-sh-za",
		group = "voidcraft-flx-grp"
	},
	{
		type = "item-subgroup",
		name = "voidcraft-mas-shipyard-coh",
		order = "vpmas-sh-zb",
		group = "voidcraft-coh-grp"
	},
	{
		type = "item-subgroup",
		name = "voidcraft-mas-nix",
		order = "vpmas-n",
		group = "voidcraft-grp"
	}, 
	{
		type = "item-subgroup",
		name = "voidcraft-mas-nix-flx",
		order = "vpmas-n-za",
		group = "voidcraft-flx-grp"
	},
	{
		type = "item-subgroup",
		name = "voidcraft-mas-nix-coh",
		order = "vpmas-n-zb",
		group = "voidcraft-coh-grp"
	},
	{
		type = "item-subgroup",
		name = "voidcraft-mas-ringworld",
		order = "vpmas-r",
		group = "voidcraft-grp"
	}, 
	{
		type = "item-subgroup",
		name = "voidcraft-mas-ringworld-flx",
		order = "vpmas-r-za",
		group = "voidcraft-flx-grp"
	},
	{
		type = "item-subgroup",
		name = "voidcraft-mas-ringworld-coh",
		order = "vpmas-r-zb",
		group = "voidcraft-coh-grp"
	},
	{
		type = "item-subgroup",
		name = "voidcraft-mas-mirandus",
		order = "vpmas-r",
		group = "voidcraft-grp"
	}, 
	{
		type = "item-subgroup",
		name = "voidcraft-mas-mirandus-flx",
		order = "vpmas-r-za",
		group = "voidcraft-flx-grp"
	},
	{
		type = "item-subgroup",
		name = "voidcraft-mas-mirandus-coh",
		order = "vpmas-r-zb",
		group = "voidcraft-coh-grp"
	}
})

local gold_ore_junk = "silica-sand"
if mods["secretas"] then
	gold_ore_junk = "copper-ore"
end
-- recipes
local added_recipes = {
	-- shipyard
	VOIDCRAFT.voidcraft_recipe({prefix = m_gfx_prefix, subgroup = "voidcraft-mas-shipyard", fluid = 240, secondary_item = true, icopy="fluid"}, {"gray-goo", "nanites", "iron-ore"}, "vpmas-aa", 4, "mouseas-void-mas-shipyard", {0.7, 0.7, 0.7}),
	VOIDCRAFT.voidcraft_recipe({prefix = m_gfx_prefix, subgroup = "voidcraft-mas-shipyard", icopy = "item", amount_main=10}, {"nanites", "carbon", "iron-ore"}, "vpmas-ab", 2, "mouseas-void-mas-shipyard", {0.92, 0.92, 0.92}),
	
	-- nix
	VOIDCRAFT.voidcraft_recipe({prefix = m_gfx_prefix, subgroup = "voidcraft-mas-nix", fluid = 240, secondary_item = true, icopy = "fluid"}, {"dark-matter-fluid", "stone", "coal"}, "vpmas-ba", 12, "mouseas-void-mas-nix", {0.38, 0.32, 0.58}),
	VOIDCRAFT.voidcraft_recipe({prefix = m_gfx_prefix, subgroup = "voidcraft-mas-nix", fluid = 240, secondary_item = true, icopy = "fluid"}, {"crude-slush", "ice", "coal"}, "vpmas-bb", 4, "mouseas-void-mas-nix", {0.15, 0.15, 0.15}),
	
	-- ringworld
	VOIDCRAFT.voidcraft_recipe({prefix = m_gfx_prefix, subgroup = "voidcraft-mas-ringworld", fluid = 240, secondary_item = true, icopy="fluid"}, {"heavy-water", "stone", "iron-ore"}, "vpmas-ca", 10, "mouseas-void-mas-ringworld", {0.5, 0.5, 0.92}),
	VOIDCRAFT.voidcraft_recipe({prefix = m_gfx_prefix, subgroup = "voidcraft-mas-ringworld", icopy = "item"}, {"bitumen", "bone-fragments", "carbon"}, "vpmas-cb", 4, "mouseas-void-mas-ringworld", {0.12, 0.1, 0.1}),
	VOIDCRAFT.voidcraft_recipe({prefix = cp_gfx_prefix, subgroup = "voidcraft-mas-ringworld", icopy = "item"}, {"gold-ore", gold_ore_junk, "stone"}, "vpmas-cc", 4, "mouseas-void-mas-ringworld", {0.9, 0.8, 0.0}),
	VOIDCRAFT.voidcraft_recipe({prefix = cp_gfx_prefix, subgroup = "voidcraft-mas-ringworld", icopy = "item"}, {"silica-sand", "gold-ore", "stone"}, "vpmas-cd", 4, "mouseas-void-mas-ringworld", {0.8, 0.7, 0.7}),
	
	-- mirandus
	VOIDCRAFT.voidcraft_recipe({prefix = m_gfx_prefix, subgroup = "voidcraft-mas-mirandus", fluid = 100, secondary_item = true, icopy="fluid"}, {"mirandite-sludge", "calcite", "lithium"}, "vpmas-da", 120, "mouseas-void-mas-mirandus", {0.4, 0, 0.3}),
	VOIDCRAFT.voidcraft_recipe({prefix = m_gfx_prefix, subgroup = "voidcraft-mas-mirandus", icopy = "item"}, {"neodymium-ore", "lithium", "iron-ore"}, "vpmas-dd", 12, "mouseas-void-mas-mirandus", {0.92, 0.92, 0.92}),
	VOIDCRAFT.voidcraft_recipe({prefix = m_gfx_prefix, subgroup = "voidcraft-mas-mirandus", icopy = "item"}, {"thorium", "uranium-238", "uranium-235"}, "vpmas-dc", 12, "mouseas-void-mas-mirandus", {0.57, 0.7, 0.35}),
}
-- voidlore
if (VC_COMPAT.scienceCraft) then
	table.insert(added_recipes, VOIDCRAFT.voidcraft_recipe({prefix = m_gfx_prefix, subgroup = "voidcraft-mas-shipyard", exalted = true}, {"nanite-science-pack", "nanites", "iron-ore"}, "vpmas-a", 300, nil, {1, 1, 1}))
	table.insert(added_recipes, VOIDCRAFT.voidcraft_recipe({prefix = m_gfx_prefix, subgroup = "voidcraft-mas-nix", exalted = true}, {"anomaly-science-pack", "ice", "coal"}, "vpmas-b", 750, nil, {1, 1, 1}))
	table.insert(added_recipes, VOIDCRAFT.voidcraft_recipe({prefix = m_gfx_prefix, subgroup = "voidcraft-mas-ringworld", exalted = true}, {"ring-science-pack", "gold-ore", "silica-sand"}, "vpmas-c", 750, nil, {1, 1, 0.5}))
	table.insert(added_recipes, VOIDCRAFT.voidcraft_recipe({prefix = m_gfx_prefix, subgroup = "voidcraft-mas-mirandus", exalted = true}, {"quantum-science-pack", "neodymium-ore", "thorium"}, "vpmas-d", 750, nil, {1, 1, 0.5}))
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

if (#added_recipes > 0) then
	data:extend(added_recipes)
	data:extend(fluxized_recipes)
	data:extend(coherized_recipes)
end

-- add productivity to relevant Voidcraft recipes
if (data.raw["technology"]["bullet-productivity"]) then
	VC_COMPAT.addRecipeToProducitivityTech("bullet-productivity", "s6xvc-firearm-magazine", 0.1, true, true)
	VC_COMPAT.addRecipeToProducitivityTech("bullet-productivity", "s6xvc-piercing-rounds-magazine", 0.1, true, true)
	VC_COMPAT.addRecipeToProducitivityTech("bullet-productivity", "s6xvc-uranium-rounds-magazine", 0.1, true, true)
end
if (data.raw["technology"]["railgun-ammo-productivity"]) then
	VC_COMPAT.addRecipeToProducitivityTech("railgun-ammo-productivity", "s6xvc-railgun-ammo", 0.1, true, true)
	VC_COMPAT.addRecipeToProducitivityTech("railgun-ammo-productivity", "s6xvc-rail", 0.1, true, true)
end
if (data.raw["technology"]["rocket-ammo-productivity"]) then
	VC_COMPAT.addRecipeToProducitivityTech("rocket-ammo-productivity", "s6xvc-rocket", 0.1, true, true)
	VC_COMPAT.addRecipeToProducitivityTech("rocket-ammo-productivity", "s6xvc-explosive-rocket", 0.1, true, true)
end
if (data.raw["technology"]["space-fuel-productivity"]) then
	VC_COMPAT.addRecipeToProducitivityTech("space-fuel-productivity", "s6x-void-thruster-fuel", 0.1, false, false)
end
if (data.raw["technology"]["module-productivity-basic"]) then
	VC_COMPAT.addRecipeToProducitivityTech("module-productivity-basic", "s6x-voidcraft-eff-module", 0.1, false, false)
	VC_COMPAT.addRecipeToProducitivityTech("module-productivity-basic", "s6x-voidcraft-speed-module", 0.1, false, false)
	VC_COMPAT.addRecipeToProducitivityTech("module-productivity-basic", "s6xvc-void-eff-module", 0.1, false, true)
	VC_COMPAT.addRecipeToProducitivityTech("module-productivity-basic", "s6xvc-void-speed-module", 0.1, false, true)
end
if (data.raw["technology"]["module-productivity-intermediate"]) then
	VC_COMPAT.addRecipeToProducitivityTech("module-productivity-intermediate", "s6x-voidcraft-eff-module-2", 0.1, false, false)
	VC_COMPAT.addRecipeToProducitivityTech("module-productivity-intermediate", "s6x-voidcraft-speed-module-2", 0.1, false, false)
end
if (data.raw["technology"]["module-productivity-advanced"]) then
	VC_COMPAT.addRecipeToProducitivityTech("module-productivity-advanced", "s6x-voidcraft-eff-module-3", 0.1, false, false)
	VC_COMPAT.addRecipeToProducitivityTech("module-productivity-advanced", "s6x-voidcraft-speed-module-3", 0.1, false, false)
end



