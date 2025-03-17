
if not (VC_COMPAT) then VC_COMPAT = {} end

VC_COMPAT.compat_prefix = "__voidcraft-planetary-compatibility__" -- prefix for this mod
VC_COMPAT.scienceCraft = settings.startup["s6x-voidcraft-science"].value -- whether you can voidcraft science packs directly

VC_COMPAT.compatibility_tech = function(name, prereq, science_packs, add_science_packs, xinfo, old_prefix)
	local tech = VOIDCRAFT.std_voidtech(name, prereq, science_packs, add_science_packs, xinfo, old_prefix)
	tech.name = "mouseas-void-" .. name
	tech.icon = VC_COMPAT.compat_prefix .. "/graphics/technology/void" .. name .. ".png"
	return tech
end 