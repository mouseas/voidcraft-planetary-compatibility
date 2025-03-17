require "util"

local t_prefix = "__tenebris-prime__"

data:extend({
	VC_COMPAT.compatibility_tech("tenebris-prime", {"s6x-void-vulcanus", "s6x-void-fulgora", "s6x-void-gleba", "planet-discovery-tenebris"}, 1500, "cel")
})
if (VC_COMPAT.scienceCraft) then
	local voidlore = VOIDCRAFT.lore_voidtech("bioluminescent", {"s6x-voidlore-metallurgic", "s6x-voidlore-electromagnetic", "s6x-voidlore-agricultural", "mouseas-void-tenebris-prime"}, 500, "cel", t_prefix)
	data:extend({
		voidlore
	})
end


-- item subgroups

data:extend({
	{
		type = "item-subgroup",
		name = "voidcraft-tenebris-prime",
		order = "vptp",
		group = "voidcraft-grp"
	}, 
	{
		type = "item-subgroup",
		name = "voidcraft-tenebris-prime-flx",
		order = "vptp-za",
		group = "voidcraft-flx-grp"
	},
	{
		type = "item-subgroup",
		name = "voidcraft-tenebris-prime-coh",
		order = "vptp-zb",
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
	
	--[[ if fluid, because Maraxsis doesn't put fluid icons in a subfolder but voidcraft expects them to, the "/fluid" part of the icon path has to be removed.
	if (xinfo.fluid) then
		recipe.icons[1].icon = xinfo.prefix .. "/graphics/icons/" .. (xinfo.img or base_item) .. ".png"
	end]]
	
	--recipe.name = compat_prefix .. "vc-" .. (xinfo.img or base_item)
	return recipe
end

local added_recipes = {
	-- voidcrafting
	compatibility_recipe({prefix = t_prefix, subgroup = "voidcraft-tenebris-prime", img="tenecap"}, {"tenecap", "tenecap-spore", "stone"}, "vptp-xa", 6, "mouseas-void-tenebris-prime", {0.6, 0.4, 0.4}),
	compatibility_recipe({prefix = t_prefix, subgroup = "voidcraft-tenebris-prime", img="lucifunnel"}, {"lucifunnel", "luciferin", "lucifunnel-seed"}, "vptp-xb", 6, "mouseas-void-tenebris-prime", {0.4, 0.8, 0.7}),
	compatibility_recipe({prefix = t_prefix, subgroup = "voidcraft-tenebris-prime", img="quartz-ore"}, {"quartz-ore", "carbon", "stone"}, "vptp-xc", 2, "mouseas-void-tenebris-prime", {0.95, 0.9, 0.9})
	
}

-- voidlore
if (VC_COMPAT.scienceCraft) then
	table.insert(added_recipes, compatibility_recipe({prefix = m_prefix, subgroup = "voidcraft-tenebris-prime", exalted = true}, {"bioluminescent-science-pack", "quartz-crystal", "luciferin"}, "vptp-a", 720, nil, {0.4, 0.8, 0.7}))
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