require "util"

local m_prefix = "__loaders-modernized__"
local use_chutes = settings.startup["mdrn-enable-chute"].value
local use_stack_loader = settings.startup["mdrn-enable-stacking"].value == "stack-tier"

local techs = {"s6x-void-belts", "s6x-void-belts-adv", "s6x-void-belts-top", "s6x-void-belts-turbo", "s6x-void-belts"}

local costs = {0, 0, 0, 0, 0}
costs[1] = (16*8) + 30 + (20*6) -- 8 inserters, 1 underground belt, 6 steel plates
costs[2] = costs[1] + (32*4) + 150 -- 1 T1 loader, 4 fast inserters, 1 fast underground belt
costs[3] = costs[2] + (225*2) + 400 -- 1 T2 loader, 2 bulk inserters, 1 express underground belt
costs[4] = costs[3] + (225*6) + 900 -- 1 T3 loader, 6 bulk inserters, 1 turbo underground belt
costs[5] = 4*4 -- 4 iron plates
costs[6] = costs[2] + (225*2) -- 1 T2 loader, n stack inserters

-- recipes
local added_recipes = {
	-- voidcrafting loaders
	VOIDCRAFT.voidcraft_recipe({prefix = m_prefix, subgroup = "voidcraft-logistics", icopy="item"}, {"mdrn-loader", "inserter", "underground-belt"}, "vcb-ad", costs[1], techs[1], {0.1, 0.1, 0.1}),
	VOIDCRAFT.voidcraft_recipe({prefix = m_prefix, subgroup = "voidcraft-logistics", icopy="item"}, {"fast-mdrn-loader", "fast-inserter", "fast-underground-belt"}, "vcb-bd", costs[2], techs[2], {0.1, 0.1, 0.1}),
	VOIDCRAFT.voidcraft_recipe({prefix = m_prefix, subgroup = "voidcraft-logistics", icopy="item"}, {"express-mdrn-loader", "bulk-inserter", "express-underground-belt"}, "vcb-cd", costs[3], techs[3], {0.1, 0.1, 0.1}),
	VOIDCRAFT.voidcraft_recipe({prefix = m_prefix, subgroup = "voidcraft-logistics-sa", icopy="item"}, {"turbo-mdrn-loader", "bulk-inserter", "turbo-underground-belt"}, "vcc-ad", costs[4], techs[4], {0.1, 0.1, 0.1})
}

if use_chutes then
	table.insert(added_recipes, VOIDCRAFT.voidcraft_recipe({prefix = m_prefix, subgroup = "voidcraft-logistics", icopy="item"}, {"chute-mdrn-loader", "iron-plate", "iron-gear-wheel"}, "vcb-fd", costs[5], techs[5], {0.1, 0.1, 0.1}))
end

if use_stack_loader then
	table.insert(added_recipes, VOIDCRAFT.voidcraft_recipe({prefix = m_prefix, subgroup = "voidcraft-logistics", icopy="item"}, {"stack-mdrn-loader", "fast-mdrn-loader", "stack-inserter"}, "vcb-fe", costs[6], techs[4], {1.0, 1.0, 1.0}))
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