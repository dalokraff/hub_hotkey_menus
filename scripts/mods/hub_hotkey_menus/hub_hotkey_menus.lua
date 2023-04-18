--[[
    author: dalo_kraff
	
	-----
 
	Copyright 2022 dalo_kraff

	Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated
  documentation files (the "Software"), to deal in the Software without restriction, including without limitation
  the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and
  to permit persons to whom the Software is furnished to do so, subject to the following conditions:

	The above copyright notice and this permission notice shall be included in all copies or
  substantial portions of the Software.

	THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED
  TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL
  THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF
  CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR
  OTHER DEALINGS IN THE SOFTWARE.
 
	-----

	Description: Open various menus from the hub world with hotkeys
--]]

local mod = get_mod("hub_hotkey_menus")

-- ##########################################################
-- ################## Variables #############################

local InputUtils = require("scripts/managers/input/input_utils")

local valid_lvls = {
	shooting_range = true,
	hub = true,
}

--disables the default Inventroy hotkey "I"
local GameModeSettings = require("scripts/settings/game_mode/game_mode_settings")
GameModeSettings.hub.hotkeys.hotkeys["hotkey_inventory"] = nil
GameModeSettings.hub.hotkeys.lookup["inventory_background_view"] = nil

--Patch tables for PsykaniumInvHotkey
mod.PsykaniumInvHotkey_levels = {
	shooting_range = true,
}
mod.PsykaniumInvHotkey_views = {
	inventory_background_view = "hotkey_inventory",
}

-- ##########################################################
-- ############## Internal Functions ########################

local is_in_valid_lvl = function()
	if Managers and Managers.state and Managers.state.game_mode then
		valid_lvls["shooting_range"] = mod:get("enable_in_pykhanium")
		return valid_lvls[Managers.state.game_mode:game_mode_name()] or false
	end
end

local get_default_hotkey = function (hotkey_alias)
	local _keyboard_devices = {
		"keyboard",
		"mouse"
	}
	local _gamepad_devices = {
		xbox_controller = {
			"xbox_controller"
		},
		ps4_controller = {
			"ps4_controller"
		}
	}
	local device_types = _keyboard_devices
	
	local input_manager = Managers.input
	if input_manager:device_in_use("gamepad") then
		if IS_XBS then
			device_types = _gamepad_devices.xbox_controller
		else
			local device = input_manager:last_pressed_device()
			local type = device:type()
			device_types = _gamepad_devices[type] or _keyboard_devices
		end
	end

	local alias = input_manager:alias_object("View")
	local key_info = alias:get_keys_for_alias(hotkey_alias, 1, device_types)
	local key_name = key_info.main

	local device_type = InputUtils.key_device_type(key_name)
	local usable_key_name = InputUtils.local_key_name(key_name, device_type)

	return usable_key_name
end

local PsykaniumInvHotkey_patch = function(view)
	local PsykaniumInvHotkey_mod = get_mod("PsykaniumInvHotkey")
	if PsykaniumInvHotkey_mod then
		local level_check = mod.PsykaniumInvHotkey_levels[Managers.state.game_mode:game_mode_name()]
		local view_hotkey_alias = mod.PsykaniumInvHotkey_views[view]
		local check = PsykaniumInvHotkey_mod:is_enabled() and level_check and view_hotkey_alias
		if check then
			local official_keybind = get_default_hotkey(view_hotkey_alias)
			local current_mod_keybind = mod:get("open_inventory_view_key")[1]
			return not (official_keybind == current_mod_keybind)
		else
			return true
		end
	else
		return true
	end
end

local can_activate_view = function(ui_manager, view)
	return is_in_valid_lvl() and (not ui_manager:chat_using_input()) and (not ui_manager:has_active_view(view)) and PsykaniumInvHotkey_patch(view)
end

local close_sub_views = function(view, ui_manager)
	
end

local close_views = function(view, ui_manager)
	local activeViews = ui_manager:active_views()
	for _, active_view in pairs(activeViews) do
		if active_view == view then
			ui_manager:close_all_views()
			return false
		end
	end
	return true
end

local activate_hub_view = function(view)
	local ui_manager = Managers.ui

	if ui_manager and close_views(view, ui_manager) and can_activate_view(ui_manager, view) then
		local context = {
			hub_interaction = true
		}

		ui_manager:open_view(view, nil, nil, nil, nil, context)
	end
end

-- ##########################################################
-- ################## Functions #############################

mod.activate_barber_vendor_background_view = function(self)
  activate_hub_view("barber_vendor_background_view")
end

mod.activate_contracts_background_view = function(self)
  activate_hub_view("contracts_background_view")
end

mod.activate_crafting_view = function(self)
  activate_hub_view("crafting_view")
end

mod.activate_credits_vendor_background_view = function(self)
  activate_hub_view("credits_vendor_background_view")
end

mod.activate_inbox_view = function(self)
  activate_hub_view("inbox_view")
end

mod.activate_mission_board_view = function(self)
  activate_hub_view("mission_board_view")
end

mod.activate_store_view = function(self)
  activate_hub_view("store_view")
end

mod.activate_training_grounds_view = function(self)
  activate_hub_view("training_grounds_view")
end

mod.activate_social_view = function(self)
	activate_hub_view("social_menu_view")
end

mod.activate_inventory_view = function(self)
	activate_hub_view("inventory_background_view")
end

-- mod.activate_main_menu_view = function(self)
-- 	activate_hub_view("main_menu_background_view")
-- end



-- ##########################################################
-- ################### Hooks ################################

-- ##########################################################
-- ################### Script ###############################

-- ##########################################################
