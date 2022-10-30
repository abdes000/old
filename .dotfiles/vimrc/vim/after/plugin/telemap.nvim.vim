
-- Built-in actions
local transform_mod = require('telescope.actions.mt').transform_mod

-- or create your custom action
local my_cool_custom_action = transform_mod({
  x = function()
    print("This function ran after another action. Prompt_bufnr: " .. prompt_bufnr)
    -- Enter your function logic here. You can take inspiration from lua/telescope/actions.lua
  end,
})