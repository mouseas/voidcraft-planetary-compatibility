
if not (VC_COMPAT) then VC_COMPAT = {} end

VC_COMPAT.compat_prefix = "__voidcraft-planetary-compatibility__" -- prefix for this mod
VC_COMPAT.scienceCraft = settings.startup["s6x-voidcraft-science"].value -- whether you can voidcraft science packs directly

VC_COMPAT.compatibility_tech = function(name, prereq, science_packs, add_science_packs, xinfo, old_prefix)
	local tech = VOIDCRAFT.std_voidtech(name, prereq, science_packs, add_science_packs, xinfo, old_prefix)
	tech.name = "mouseas-void-" .. name
	tech.icon = VC_COMPAT.compat_prefix .. "/graphics/technology/void" .. name .. ".png"
	return tech
end 

VC_COMPAT.addRecipeToProducitivityTech = function(tech_name, recipe_name, change_amt, do_coh, do_flux)
	if (not change_amt) then
		change_amt = 0.1
	end
	local tech_effects = data.raw["technology"][tech_name]["effects"]
	
	if (tech_effects and recipe_name and type(tech_effects) == "table") then
		table.insert(tech_effects, {
			type = "change-recipe-productivity",
			change = change_amt,
			recipe = recipe_name
		})
		if (do_coh) then
			table.insert(tech_effects, {
				type = "change-recipe-productivity",
				change = change_amt,
				recipe = recipe_name .. "-coh"
			})
		end
		if (do_flux) then
			table.insert(tech_effects, {
				type = "change-recipe-productivity",
				change = change_amt,
				recipe = recipe_name .. "-flx"
			})
		end
	end
end