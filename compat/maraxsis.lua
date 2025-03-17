require "util"

local m_prefix = "__maraxsis__"

data:extend({
	VC_COMPAT.compatibility_tech("maraxsis", {"s6x-void-vulcanus", "s6x-void-fulgora", "s6x-void-gleba", "planet-discovery-maraxsis"}, 1500, "cel")
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
local function compatibility_recipe(xinfo, basetbl, order, energy, add_to_tech, tinttbl)
	local recipe = VOIDCRAFT.voidcraft_recipe(xinfo, basetbl, order, energy, add_to_tech, tinttbl)
	
	local base_item = nil
	if (type(basetbl) ~= "table") then
		base_item = basetbl
	else
		base_item = basetbl[1]
	end
	
	-- if fluid, because Maraxsis doesn't put fluid icons in a subfolder but voidcraft expects them to, the "/fluid" part of the icon path has to be removed.
	if (xinfo.fluid) then
		recipe.icons[1].icon = xinfo.prefix .. "/graphics/icons/" .. (xinfo.img or base_item) .. ".png"
	end
	
	--recipe.name = compat_prefix .. "vc-" .. (xinfo.img or base_item)
	return recipe
end


local added_recipes = {
	-- voidcrafting
	compatibility_recipe({prefix = m_prefix, subgroup = "voidcraft-maraxsis", img="limestone-1"}, {"maraxsis-limestone", "maraxsis-coral", "sand"}, "vpm-xa", 2, "mouseas-void-maraxsis", {0.78, 0.74, 0.74}),
	compatibility_recipe({prefix = m_prefix, subgroup = "voidcraft-maraxsis", img="salt-1"}, {"maraxsis-salt", "sand", "stone"}, "vpm-xb", 6, "mouseas-void-maraxsis", {0.78, 0.74, 0.74}),
	compatibility_recipe({prefix = m_prefix, subgroup = "voidcraft-maraxsis", fluid = 240, secondary_item = true, img = "saline-water"}, {"maraxsis-saline-water", "stone", "maraxsis-salt"}, "vpm-xc", 5, "mouseas-void-maraxsis", {0.22, 0.32, 0.7}),
	compatibility_recipe({prefix = m_prefix, subgroup = "voidcraft-maraxsis", img="tropical-fish"}, {"maraxsis-tropical-fish", "maraxsis-coral", "sand"}, "vpm-xd", 6, "mouseas-void-maraxsis", {0.92, 0.35, 0.1}),
	compatibility_recipe({prefix = m_prefix, subgroup = "voidcraft-maraxsis", img="glass-1"}, {"maraxsis-glass-panes", "maraxsis-salt", "sand"}, "vpm-xe", 16, "mouseas-void-maraxsis", {0.3125, 0.86, 0.9}),
	compatibility_recipe({prefix = m_prefix, subgroup = "voidcraft-maraxsis", fluid = 240, secondary_item = true, img = "atmosphere"}, {"maraxsis-atmosphere", "sand", "maraxsis-limestone"}, "vpm-xf", 32, "mouseas-void-maraxsis", {0.55, 0.72, 0.74}),
	compatibility_recipe({prefix = m_prefix, subgroup = "voidcraft-maraxsis", img="coral-1"}, {"maraxsis-coral", "maraxsis-limestone", "sand"}, "vpm-xg", 2, "mouseas-void-maraxsis", {0.2, 0.61, 0.5}),
	
}
-- voidlore
if (VC_COMPAT.scienceCraft) then
	table.insert(added_recipes, compatibility_recipe({prefix = m_prefix, subgroup = "voidcraft-maraxsis", exalted = true}, {"hydraulic-science-pack", "maraxsis-salt", "sand"}, "vpm-a", 720, nil, {0.25, 0.45, 0.85}))
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