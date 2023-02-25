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

-- ##########################################################
-- ############## Internal Functions ########################

local is_in_hub = function()
	if Managers and Managers.state and Managers.state.game_mode then
		return Managers.state.game_mode:game_mode_name() == "hub"
	end
end

local can_activate_hub_view = function(ui_manager, view)
	return is_in_hub() and (not ui_manager:chat_using_input()) and (not ui_manager:has_active_view(view))
end

local activate_hub_view = function(view)
	local ui_manager = Managers.ui
	if ui_manager and can_activate_hub_view(ui_manager, view) then
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

-- ##########################################################
-- ################### Hooks ################################

-- ##########################################################
-- ################### Script ###############################

-- ##########################################################
