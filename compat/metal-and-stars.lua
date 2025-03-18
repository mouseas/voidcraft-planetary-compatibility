require "util"

local m_prefix = "__metal-and-stars__"
local m_gfx_prefix = "__metal-and-stars-graphics__"
local m_gfx2_prefix = "__metal-and-stars-graphics-2__"
local cp_gfx_prefix = "__common-prototypes-graphics__"

data:extend({
	VC_COMPAT.compatibility_tech("mas-shipyard", {"planet-discovery-shipyard"}, 500, "cel"),
	VC_COMPAT.compatibility_tech("mas-nix", {"planet-discovery-nix"}, 500, "cel"),
	VC_COMPAT.compatibility_tech("mas-ringworld", {"planet-discovery-ringworld"}, 500, "cel"),
	VC_COMPAT.compatibility_tech("mas-mirandus", {"planet-discovery-mirandus"}, 500, "cel"),
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

-- recipes
local added_recipes = {
	-- shipyard
	VOIDCRAFT.voidcraft_recipe({prefix = m_gfx_prefix, subgroup = "voidcraft-mas-shipyard", fluid = 240, secondary_item = true, icopy="fluid"}, {"gray-goo", "nanites", "iron-ore"}, "vpmas-aa", 5, "mouseas-void-mas-shipyard", {0.7, 0.7, 0.7}),
	VOIDCRAFT.voidcraft_recipe({prefix = m_gfx_prefix, subgroup = "voidcraft-mas-shipyard", icopy = "item"}, {"nanites", "carbon", "iron-ore"}, "vpmas-ab", 1, "mouseas-void-mas-shipyard", {0.92, 0.92, 0.92}),
	
	-- nix
	VOIDCRAFT.voidcraft_recipe({prefix = m_gfx_prefix, subgroup = "voidcraft-mas-nix", fluid = 240, secondary_item = true, midpath = "/graphics/icons/", img = "dark-matter-gas"}, {"dark-matter-fluid", "stone", "coal"}, "vpmas-ba", 5, "mouseas-void-mas-nix", {0.9, 0.12, 0.5}),
	VOIDCRAFT.voidcraft_recipe({prefix = m_gfx_prefix, subgroup = "voidcraft-mas-nix", fluid = 240, secondary_item = true, midpath = "/graphics/icons/", icopy = "fluid"}, {"crude-slush", "ice", "coal"}, "vpmas-bb", 32, "mouseas-void-mas-nix", {0.15, 0.15, 0.15}),
	
	-- ringworld
	VOIDCRAFT.voidcraft_recipe({prefix = m_gfx_prefix, subgroup = "voidcraft-mas-ringworld", fluid = 240, secondary_item = true, midpath = "/graphics/icons/", icopy="fluid"}, {"heavy-water", "stone", "iron-ore"}, "vpmas-ca", 32, "mouseas-void-mas-ringworld", {0.5, 0.5, 0.92}),
	VOIDCRAFT.voidcraft_recipe({prefix = m_gfx_prefix, subgroup = "voidcraft-mas-ringworld", icopy = "item"}, {"bitumen", "bone-fragments", "carbon"}, "vpmas-cb", 6, "mouseas-void-mas-ringworld", {0.12, 0.1, 0.1}),
	VOIDCRAFT.voidcraft_recipe({prefix = cp_gfx_prefix, subgroup = "voidcraft-mas-ringworld", img = "gold-ore-1", midpath = "/icons/items/"}, {"gold-ore", "silica-sand", "stone"}, "vpmas-cc", 16, "mouseas-void-mas-ringworld", {0.9, 0.8, 0.0}),
	VOIDCRAFT.voidcraft_recipe({prefix = cp_gfx_prefix, subgroup = "voidcraft-mas-ringworld", img = "silica-sand-1", midpath = "/icons/items/"}, {"silica-sand", "gold-ore", "stone"}, "vpmas-cd", 16, "mouseas-void-mas-ringworld", {0.8, 0.7, 0.7}),
	
	-- mirandus
	VOIDCRAFT.voidcraft_recipe({prefix = m_gfx_prefix, subgroup = "voidcraft-mas-mirandus", fluid = 240, secondary_item = true, midpath = "/graphics/icons/", icopy="fluid"}, {"mirandite-sludge", "calcite", "lithium"}, "vpmas-da", 32, "mouseas-void-mas-mirandus", {0.4, 0, 0.3}),
	VOIDCRAFT.voidcraft_recipe({prefix = m_gfx_prefix, subgroup = "voidcraft-mas-mirandus", icopy = "item"}, {"neodymium-ore", "lithium", "iron-ore"}, "vpmas-dd", 1, "mouseas-void-mas-mirandus", {0.92, 0.92, 0.92}),
	VOIDCRAFT.voidcraft_recipe({prefix = m_gfx_prefix, subgroup = "voidcraft-mas-mirandus", icopy = "item"}, {"thorium", "uranium-238", "uranium-235"}, "vpmas-dc", 1, "mouseas-void-mas-mirandus", {0.3, 0.92, 0.2}),
}
-- voidlore
if (VC_COMPAT.scienceCraft) then
	table.insert(added_recipes, compatibility_recipe({prefix = m_gfx_prefix, subgroup = "voidcraft-mas-shipyard", exalted = true}, {"nanite-science-pack", "nanites", "iron-ore"}, "vpmas-a", 720, nil, {1, 1, 1}))
	table.insert(added_recipes, compatibility_recipe({prefix = m_gfx_prefix, subgroup = "voidcraft-mas-nix", exalted = true}, {"anomaly-science-pack", "ice", "coal"}, "vpmas-b", 720, nil, {1, 1, 1}))
	table.insert(added_recipes, compatibility_recipe({prefix = m_gfx_prefix, subgroup = "voidcraft-mas-ringworld", exalted = true}, {"ring-science-pack", "gold-ore", "silica-sand"}, "vpmas-c", 720, nil, {1, 1, 0.5}))
	table.insert(added_recipes, compatibility_recipe({prefix = m_gfx_prefix, subgroup = "voidcraft-mas-mirandus", exalted = true}, {"quantum-science-pack", "neodymium-ore", "thorium"}, "vpmas-d", 720, nil, {1, 1, 0.5}))
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