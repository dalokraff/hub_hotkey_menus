return {
	run = function()
		fassert(rawget(_G, "new_mod"), "`hub_hotkey_menus` encountered an error loading the Darktide Mod Framework.")

		new_mod("hub_hotkey_menus", {
			mod_script       = "hub_hotkey_menus/scripts/mods/hub_hotkey_menus/hub_hotkey_menus",
			mod_data         = "hub_hotkey_menus/scripts/mods/hub_hotkey_menus/hub_hotkey_menus_data",
			mod_localization = "hub_hotkey_menus/scripts/mods/hub_hotkey_menus/hub_hotkey_menus_localization",
		})
	end,
	packages = {},
}
