require "util"

local m_prefix = "__terrapalus__"

data:extend({
	-- basic Terra Palus material. Aint' much else to add.
	VC_COMPAT.compatibility_tech("terrapalus", {"s6x-void-thruster", "planet-discovery-terrapalus"}, 500, "cel"),
})

-- recipes
local added_recipes = {
	-- voidcrafting
	VOIDCRAFT.voidcraft_recipe({prefix = m_prefix, subgroup = "voidcraft-resource", icopy="item"}, {"palusium-ore", "stone", "iron-ore"}, "vptp-xa", 2, "mouseas-void-terrapalus", {0.3, 0.2, 0.74}),
	
}

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