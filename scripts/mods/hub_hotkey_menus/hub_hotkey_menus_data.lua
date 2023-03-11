local mod = get_mod("hub_hotkey_menus")

return {
  name = mod:localize("mod_name"),
  description = mod:localize("mod_description"),
  is_togglable = true,
  options = {
    widgets = {
      {
        setting_id      = "enable_in_psykanium",
        type            = "checkbox",
        default_value   = true,
      },
      {
        setting_id      = "open_barber_view_key",
        type            = "keybind",
        default_value   = {},
        keybind_trigger = "pressed",
        keybind_type    = "function_call",
        function_name   = "activate_barber_vendor_background_view",
      },
      {
        setting_id      = "open_contracts_view_key",
        type            = "keybind",
        default_value   = {},
        keybind_trigger = "pressed",
        keybind_type    = "function_call",
        function_name   = "activate_contracts_background_view",
      },
      {
        setting_id      = "open_crafting_view_key",
        type            = "keybind",
        default_value   = {},
        keybind_trigger = "pressed",
        keybind_type    = "function_call",
        function_name   = "activate_crafting_view",
      },
      {
        setting_id      = "open_credits_vendor_view_key",
        type            = "keybind",
        default_value   = {},
        keybind_trigger = "pressed",
        keybind_type    = "function_call",
        function_name   = "activate_credits_vendor_background_view",
      },
      {
        setting_id      = "open_inbox_view_key",
        type            = "keybind",
        default_value   = {},
        keybind_trigger = "pressed",
        keybind_type    = "function_call",
        function_name   = "activate_inbox_view",
      },
      {
        setting_id      = "open_mission_board_view_key",
        type            = "keybind",
        default_value   = {},
        keybind_trigger = "pressed",
        keybind_type    = "function_call",
        function_name   = "activate_mission_board_view",
      },
      {
        setting_id      = "open_premium_store_view_key",
        type            = "keybind",
        default_value   = {},
        keybind_trigger = "pressed",
        keybind_type    = "function_call",
        function_name   = "activate_store_view",
      },
      {
        setting_id      = "open_training_grounds_view_key",
        type            = "keybind",
        default_value   = {},
        keybind_trigger = "pressed",
        keybind_type    = "function_call",
        function_name   = "activate_training_grounds_view",
      },
    }
  }
}
