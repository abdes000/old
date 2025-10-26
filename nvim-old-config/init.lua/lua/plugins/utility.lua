return {
'gaborvecsei/usage-tracker.nvim',
 'matbme/JABS.nvim',
'doctorfree/cheatsheet.nvim',
'nvim-lua/popup.nvim',
'nvim-lua/plenary.nvim',
'nvim-telescope/telescope.nvim',
'code-biscuits/nvim-biscuits',
 'rcarriga/nvim-notify',
 "folke/noice.nvim",
  'MunifTanjim/nui.nvim',
   'stevearc/dressing.nvim',
 'crusj/bookmarks.nvim',
   'AckslD/messages.nvim',
 'LukasPietzschmann/telescope-tabs',
   "yutkat/confirm-quit.nvim",
 'mfussenegger/nvim-dap',
 'rcarriga/nvim-dap-ui',
  'Weissle/persistent-breakpoints.nvim',
 'ofirgall/goto-breakpoints.nvim',
 'theHamsta/nvim-dap-virtual-text',
  'MarcHamamji/runner.nvim',
 "folke/neodev.nvim",
 "nvim-lua/plenary.nvim",
 'nvim-lua/popup.nvim',
   'piersolenski/telescope-import.nvim',
 "aPeoplesCalendar/apc.nvim",
  'pwntester/octo.nvim',
 "kdheepak/lazygit.nvim",
 "lewis6991/gitsigns.nvim",
 'gen740/SmoothCursor.nvim',
 "folke/which-key.nvim",
  'gorbit99/codewindow.nvim',
  "folke/zen-mode.nvim",
  config = function()

--usage-tracker
require('usage-tracker').setup({
  keep_eventlog_days = 14,
  cleanup_freq_days = 7,
  event_wait_period_in_sec = 5,
  inactivity_threshold_in_min = 5,
  inactivity_check_freq_in_sec = 5,
  verbose = 0,
  telemetry_endpoint = "" -- you'll need to start the restapi for this feature
})


--JABS
require 'jabs'.setup {
  -- Options for the main window
  position = {'center', 'top'}, -- position = {'<position_x>', '<position_y>'} | <position_x> left, center, right,
  --                                             <position_y> top, center, bottom
  -- Default {'right', 'bottom'}

  relative = 'editor', -- win, editor, cursor. Default win
  clip_popup_size = false, -- clips the popup size to the win (or editor) size. Default true

  width = 80, -- default 50
  height = 20, -- default 10
  border = 'single', -- none, single, double, rounded, solid, shadow, (or an array or chars). Default shadow

  offset = { -- window position offset
    top = 2, -- default 0
    bottom = 2, -- default 0
    left = 2, -- default 0
    right = 2, -- default 0
  },

  sort_mru = true, -- Sort buffers by most recently used (true or false). Default false
  split_filename = true, -- Split filename into separate components for name and path. Default false
  split_filename_path_width = 20, -- If split_filename is true, how wide the column for the path is supposed to be, Default 0 (don't show path)

  -- Options for preview window
  preview_position = 'left', -- top, bottom, left, right. Default top
  preview = {
    width = 40, -- default 70
    height = 60, -- default 30
    border = 'single', -- none, single, double, rounded, solid, shadow, (or an array or chars). Default double
  },

  -- Default highlights (must be a valid :highlight)
  highlight = {
    current = "Title", -- default StatusLine
    hidden = "StatusLineNC", -- default ModeMsg
    split = "WarningMsg", -- default StatusLine
    alternate = "StatusLine" -- default WarningMsg
  },

  -- Default symbols
  symbols = {
    current = "C", -- default 
    split = "S", -- default 
    alternate = "A", -- default 
    hidden = "H", -- default ﬘
    locked = "L", -- default 
    ro = "R", -- default 
    edited = "E", -- default 
    terminal = "T", -- default 
    default_file = "D", -- Filetype icon if not present in nvim-web-devicons. Default 
    terminal_symbol = ">_" -- Filetype icon for a terminal split. Default 
  },

  -- Keymaps
  keymap = {
    close = "<c-d>", -- Close buffer. Default D
    jump = "<space>", -- Jump to buffer. Default <cr>
    h_split = "h", -- Horizontally split buffer. Default s
    v_split = "v", -- Vertically split buffer. Default v
    preview = "p", -- Open buffer preview. Default P
  },

  -- Whether to use nvim-web-devicons next to filenames
  use_devicons = false -- true or false. Default true
}





--cheatsheet
require("cheatsheet").setup({
    -- Whether to show bundled cheatsheets

    -- For generic cheatsheets like default, unicode, nerd-fonts, etc
    -- bundled_cheatsheets = {
    --     enabled = {},
    --     disabled = {},
    -- },
    bundled_cheatsheets = true,

    -- For plugin specific cheatsheets
    -- bundled_plugin_cheatsheets = {
    --     enabled = {},
    --     disabled = {},
    -- }
    bundled_plugin_cheatsheets = true,

    -- For bundled plugin cheatsheets, do not show a sheet if you
    -- don't have the plugin installed (searches runtimepath for
    -- same directory name)
    include_only_installed_plugins = true,

    -- Key mappings bound inside the telescope window
    telescope_mappings = {
        ['<CR>'] = require('cheatsheet.telescope.actions').select_or_fill_commandline,
        ['<A-CR>'] = require('cheatsheet.telescope.actions').select_or_execute,
        ['<C-Y>'] = require('cheatsheet.telescope.actions').copy_cheat_value,
        ['<C-E>'] = require('cheatsheet.telescope.actions').edit_user_cheatsheet,
    }
})




--biscuits
require('nvim-biscuits').setup({
  default_config = {
    max_length = 12,
    min_distance = 5,
    prefix_string = " 📎 "
  },
  language_config = {
    html = {
      prefix_string = " 🌐 "
    },
    javascript = {
      prefix_string = " ✨ ",
      max_length = 80
    },
    python = {
      disabled = true
    }
  }
})
require('nvim-biscuits').setup({
  cursor_line_only = true
})




--notify
--noice
require("noice").setup({
  cmdline = {
    enabled = true, -- enables the Noice cmdline UI
    view = "cmdline_popup", -- view for rendering the cmdline. Change to `cmdline` to get a classic cmdline at the bottom
    opts = {}, -- global options for the cmdline. See section on views
    ---@type table<string, CmdlineFormat>
    format = {
      -- conceal: (default=true) This will hide the text in the cmdline that matches the pattern.
      -- view: (default is cmdline view)
      -- opts: any options passed to the view
      -- icon_hl_group: optional hl_group for the icon
      -- title: set to anything or empty string to hide
      cmdline = { pattern = "^:", icon = "", lang = "vim" },
      search_down = { kind = "search", pattern = "^/", icon = " ", lang = "regex" },
      search_up = { kind = "search", pattern = "^%?", icon = " ", lang = "regex" },
      filter = { pattern = "^:%s*!", icon = "$", lang = "bash" },
      lua = { pattern = { "^:%s*lua%s+", "^:%s*lua%s*=%s*", "^:%s*=%s*" }, icon = "", lang = "lua" },
      help = { pattern = "^:%s*he?l?p?%s+", icon = "" },
      input = {}, -- Used by input()
      -- lua = false, -- to disable a format, set to `false`
    },
  },
  messages = {
    -- NOTE: If you enable messages, then the cmdline is enabled automatically.
    -- This is a current Neovim limitation.
    enabled = true, -- enables the Noice messages UI
    view = "notify", -- default view for messages
    view_error = "notify", -- view for errors
    view_warn = "notify", -- view for warnings
    view_history = "messages", -- view for :messages
    view_search = "virtualtext", -- view for search count messages. Set to `false` to disable
  },
  popupmenu = {
    enabled = true, -- enables the Noice popupmenu UI
    ---@type 'nui'|'cmp'
    backend = "nui", -- backend to use to show regular cmdline completions
    ---@type NoicePopupmenuItemKind|false
    -- Icons for completion item kinds (see defaults at noice.config.icons.kinds)
    kind_icons = {}, -- set to `false` to disable icons
  },
  -- default options for require('noice').redirect
  -- see the section on Command Redirection
  ---@type NoiceRouteConfig
  redirect = {
    view = "popup",
    filter = { event = "msg_show" },
  },
  -- You can add any custom commands below that will be available with `:Noice command`
  ---@type table<string, NoiceCommand>
  commands = {
    history = {
      -- options for the message history that you get with `:Noice`
      view = "split",
      opts = { enter = true, format = "details" },
      filter = {
        any = {
          { event = "notify" },
          { error = true },
          { warning = true },
          { event = "msg_show", kind = { "" } },
          { event = "lsp", kind = "message" },
        },
      },
    },
    -- :Noice last
    last = {
      view = "popup",
      opts = { enter = true, format = "details" },
      filter = {
        any = {
          { event = "notify" },
          { error = true },
          { warning = true },
          { event = "msg_show", kind = { "" } },
          { event = "lsp", kind = "message" },
        },
      },
      filter_opts = { count = 1 },
    },
    -- :Noice errors
    errors = {
      -- options for the message history that you get with `:Noice`
      view = "popup",
      opts = { enter = true, format = "details" },
      filter = { error = true },
      filter_opts = { reverse = true },
    },
    all = {
      -- options for the message history that you get with `:Noice`
      view = "split",
      opts = { enter = true, format = "details" },
      filter = {},
    },
  },
  notify = {
    -- Noice can be used as `vim.notify` so you can route any notification like other messages
    -- Notification messages have their level and other properties set.
    -- event is always "notify" and kind can be any log level as a string
    -- The default routes will forward notifications to nvim-notify
    -- Benefit of using Noice for this is the routing and consistent history view
    enabled = true,
    view = "notify",
  },
  lsp = {
    progress = {
      enabled = true,
      -- Lsp Progress is formatted using the builtins for lsp_progress. See config.format.builtin
      -- See the section on formatting for more details on how to customize.
      --- @type NoiceFormat|string
      format = "lsp_progress",
      --- @type NoiceFormat|string
      format_done = "lsp_progress_done",
      throttle = 1000 / 30, -- frequency to update lsp progress message
      view = "mini",
    },
    override = {
      -- override the default lsp markdown formatter with Noice
      ["vim.lsp.util.convert_input_to_markdown_lines"] = false,
      -- override the lsp markdown formatter with Noice
      ["vim.lsp.util.stylize_markdown"] = false,
      -- override cmp documentation with Noice (needs the other options to work)
      ["cmp.entry.get_documentation"] = false,
    },
    hover = {
      enabled = true,
      silent = false, -- set to true to not show a message if hover is not available
      view = nil, -- when nil, use defaults from documentation
      ---@type NoiceViewOptions
      opts = {}, -- merged with defaults from documentation
    },
    signature = {
      enabled = true,
      auto_open = {
        enabled = true,
        trigger = true, -- Automatically show signature help when typing a trigger character from the LSP
        luasnip = true, -- Will open signature help when jumping to Luasnip insert nodes
        throttle = 50, -- Debounce lsp signature help request by 50ms
      },
      view = nil, -- when nil, use defaults from documentation
      ---@type NoiceViewOptions
      opts = {}, -- merged with defaults from documentation
    },
    message = {
      -- Messages shown by lsp servers
      enabled = true,
      view = "notify",
      opts = {},
    },
    -- defaults for hover and signature help
    documentation = {
      view = "hover",
      ---@type NoiceViewOptions
      opts = {
        lang = "markdown",
        replace = true,
        render = "plain",
        format = { "{message}" },
        win_options = { concealcursor = "n", conceallevel = 3 },
      },
    },
  },
  markdown = {
    hover = {
      ["|(%S-)|"] = vim.cmd.help, -- vim help links
      ["%[.-%]%((%S-)%)"] = require("noice.util").open, -- markdown links
    },
    highlights = {
      ["|%S-|"] = "@text.reference",
      ["@%S+"] = "@parameter",
      ["^%s*(Parameters:)"] = "@text.title",
      ["^%s*(Return:)"] = "@text.title",
      ["^%s*(See also:)"] = "@text.title",
      ["{%S-}"] = "@parameter",
    },
  },
  health = {
    checker = true, -- Disable if you don't want health checks to run
  },
  smart_move = {
    -- noice tries to move out of the way of existing floating windows.
    enabled = true, -- you can disable this behaviour here
    -- add any filetypes here, that shouldn't trigger smart move.
    excluded_filetypes = { "cmp_menu", "cmp_docs", "notify" },
  },
  ---@type NoicePresets
  presets = {
    -- you can enable a preset by setting it to true, or a table that will override the preset config
    -- you can also add custom presets that you can enable/disable with enabled=true
    bottom_search = false, -- use a classic bottom cmdline for search
    command_palette = false, -- position the cmdline and popupmenu together
    long_message_to_split = false, -- long messages will be sent to a split
    inc_rename = false, -- enables an input dialog for inc-rename.nvim
    lsp_doc_border = false, -- add a border to hover docs and signature help
  },
  throttle = 1000 / 30, -- how frequently does Noice need to check for ui updates? This has no effect when in blocking mode.
  ---@type NoiceConfigViews
  views = {}, ---@see section on views
  ---@type NoiceRouteConfig[]
  routes = {}, --- @see section on routes
  ---@type table<string, NoiceFilter>
  status = {}, --- @see section on statusline components
  ---@type NoiceFormatOptions
  format = {}, --- @see section on formatting
})
vim.keymap.set({ "n", "i", "s" }, "<c-f>", function()
  if not require("noice.lsp").scroll(4) then
    return "<c-f>"
  end
end, { silent = true, expr = true })

vim.keymap.set({ "n", "i", "s" }, "<c-b>", function()
  if not require("noice.lsp").scroll(-4) then
    return "<c-b>"
  end
end, { silent = true, expr = true })



--nui
local Popup = require("nui.popup")
local Layout = require("nui.layout")
local event = require("nui.utils.autocmd").event
local Input = require("nui.input")
local Menu = require("nui.menu")
local popup_one, popup_two = Popup({
  enter = true,
  border = "single",
}), Popup({
  border = "double",
})

local layout = Layout(
  {
    position = "50%",
    size = {
      width = 80,
      height = "60%",
    },
  },
  Layout.Box({
    Layout.Box(popup_one, { size = "40%" }),
    Layout.Box(popup_two, { size = "60%" }),
  }, { dir = "row" })
)

local current_dir = "row"

popup_one:map("n", "r", function()
  if current_dir == "col" then
    layout:update(Layout.Box({
      Layout.Box(popup_one, { size = "40%" }),
      Layout.Box(popup_two, { size = "60%" }),
    }, { dir = "row" }))

    current_dir = "row"
  else
    layout:update(Layout.Box({
      Layout.Box(popup_two, { size = "60%" }),
      Layout.Box(popup_one, { size = "40%" }),
    }, { dir = "col" }))

    current_dir = "col"
  end
end, {})

layout:mount()

local popup = Popup({
  enter = true,
  focusable = true,
  border = {
    style = "rounded",
  },
  position = "50%",
  size = {
    width = "80%",
    height = "60%",
  },
})

-- mount/open the component
popup:mount()

-- unmount component when cursor leaves buffer
popup:on(event.BufLeave, function()
  popup:unmount()
end)
local input = Input({
  position = "50%",
  size = {
    width = 20,
  },
  border = {
    style = "single",
    text = {
      top = "[Howdy?]",
      top_align = "center",
    },
  },
  win_options = {
    winhighlight = "Normal:Normal,FloatBorder:Normal",
  },
}, {
  prompt = "> ",
  default_value = "Hello",
  on_close = function()
    print("Input Closed!")
  end,
  on_submit = function(value)
    print("Input Submitted: " .. value)
  end,
})

-- mount/open the component
input:mount()

-- unmount component when cursor leaves buffer
input:on(event.BufLeave, function()
  input:unmount()
end)


local menu = Menu({
  position = "50%",
  size = {
    width = 25,
    height = 5,
  },
  border = {
    style = "single",
    text = {
      top = "[Choose-an-Element]",
      top_align = "center",
    },
  },
  win_options = {
    winhighlight = "Normal:Normal,FloatBorder:Normal",
  },
}, {
  lines = {
    Menu.item("Hydrogen (H)"),
    Menu.item("Carbon (C)"),
    Menu.item("Nitrogen (N)"),
    Menu.separator("Noble-Gases", {
      char = "-",
      text_align = "right",
    }),
    Menu.item("Helium (He)"),
    Menu.item("Neon (Ne)"),
    Menu.item("Argon (Ar)"),
  },
  max_width = 20,
  keymap = {
    focus_next = { "j", "<Down>", "<Tab>" },
    focus_prev = { "k", "<Up>", "<S-Tab>" },
    close = { "<Esc>", "<C-c>" },
    submit = { "<CR>", "<Space>" },
  },
  on_close = function()
    print("Menu Closed!")
  end,
  on_submit = function(item)
    print("Menu Submitted: ", item.text)
  end,
})

-- mount the component
menu:mount()



--dressing
require("dressing").setup({
  input = {
    -- Set to false to disable the vim.ui.input implementation
    enabled = true,

    -- Default prompt string
    default_prompt = "Input",

    -- Trim trailing `:` from prompt
    trim_prompt = true,

    -- Can be 'left', 'right', or 'center'
    title_pos = "left",

    -- When true, <Esc> will close the modal
    insert_only = true,

    -- When true, input will start in insert mode.
    start_in_insert = true,

    -- These are passed to nvim_open_win
    border = "rounded",
    -- 'editor' and 'win' will default to being centered
    relative = "cursor",

    -- These can be integers or a float between 0 and 1 (e.g. 0.4 for 40%)
    prefer_width = 40,
    width = nil,
    -- min_width and max_width can be a list of mixed types.
    -- min_width = {20, 0.2} means "the greater of 20 columns or 20% of total"
    max_width = { 140, 0.9 },
    min_width = { 20, 0.2 },

    buf_options = {},
    win_options = {
      -- Disable line wrapping
      wrap = false,
      -- Indicator for when text exceeds window
      list = true,
      listchars = "precedes:…,extends:…",
      -- Increase this for more context when text scrolls off the window
      sidescrolloff = 0,
    },

    -- Set to `false` to disable
    mappings = {
      n = {
        ["<Esc>"] = "Close",
        ["<CR>"] = "Confirm",
      },
      i = {
        ["<C-c>"] = "Close",
        ["<CR>"] = "Confirm",
        ["<Up>"] = "HistoryPrev",
        ["<Down>"] = "HistoryNext",
      },
    },

    override = function(conf)
      -- This is the config that will be passed to nvim_open_win.
      -- Change values here to customize the layout
      return conf
    end,

    -- see :help dressing_get_config
    get_config = nil,
  },
  select = {
    -- Set to false to disable the vim.ui.select implementation
    enabled = true,

    -- Priority list of preferred vim.select implementations
    backend = { "telescope", "fzf_lua", "fzf", "builtin", "nui" },

    -- Trim trailing `:` from prompt
    trim_prompt = true,

    -- Options for telescope selector
    -- These are passed into the telescope picker directly. Can be used like:
    -- telescope = require('telescope.themes').get_ivy({...})
    telescope = nil,

    -- Options for fzf selector
    fzf = {
      window = {
        width = 0.5,
        height = 0.4,
      },
    },

    -- Options for fzf-lua
    fzf_lua = {
      -- winopts = {
      --   height = 0.5,
      --   width = 0.5,
      -- },
    },

    -- Options for nui Menu
    nui = {
      position = "50%",
      size = nil,
      relative = "editor",
      border = {
        style = "rounded",
      },
      buf_options = {
        swapfile = false,
        filetype = "DressingSelect",
      },
      win_options = {
        winblend = 0,
      },
      max_width = 80,
      max_height = 40,
      min_width = 40,
      min_height = 10,
    },

    -- Options for built-in selector
    builtin = {
      -- Display numbers for options and set up keymaps
      show_numbers = true,
      -- These are passed to nvim_open_win
      border = "rounded",
      -- 'editor' and 'win' will default to being centered
      relative = "editor",

      buf_options = {},
      win_options = {
        cursorline = true,
        cursorlineopt = "both",
      },

      -- These can be integers or a float between 0 and 1 (e.g. 0.4 for 40%)
      -- the min_ and max_ options can be a list of mixed types.
      -- max_width = {140, 0.8} means "the lesser of 140 columns or 80% of total"
      width = nil,
      max_width = { 140, 0.8 },
      min_width = { 40, 0.2 },
      height = nil,
      max_height = 0.9,
      min_height = { 10, 0.2 },

      -- Set to `false` to disable
      mappings = {
        ["<Esc>"] = "Close",
        ["<C-c>"] = "Close",
        ["<CR>"] = "Confirm",
      },

      override = function(conf)
        -- This is the config that will be passed to nvim_open_win.
        -- Change values here to customize the layout
        return conf
      end,
    },

    -- Used to override format_item. See :help dressing-format
    format_item_override = {},

    -- see :help dressing_get_config
    get_config = nil,
  },
})



--bookmarks
require("bookmarks").setup({
    storage_dir = "",  -- Default path: vim.fn.stdpath("data").."/bookmarks,  if not the default directory, should be absolute path",
    mappings_enabled = true, -- If the value is false, only valid for global keymaps: toggle、add、delete_on_virt、show_desc
    keymap = {
        toggle = "<tab><tab>", -- Toggle bookmarks(global keymap)
        close = "q", -- close bookmarks (buf keymap)
        add = "\\z", -- Add bookmarks(global keymap)
        add_global = "\\g", -- Add global bookmarks(global keymap), global bookmarks will appear in all projects. Identified with the symbol '󰯾'
        jump = "<CR>", -- Jump from bookmarks(buf keymap)
        delete = "dd", -- Delete bookmarks(buf keymap)
        order = "<space><space>", -- Order bookmarks by frequency or updated_time(buf keymap)
        delete_on_virt = "\\dd", -- Delete bookmark at virt text line(global keymap)
        show_desc = "\\sd", -- show bookmark desc(global keymap)
        focus_tags = "<c-j>",      -- focus tags window
        focus_bookmarks = "<c-k>", -- focus bookmarks window
        toogle_focus = "<S-Tab>", -- toggle window focus (tags-window <-> bookmarks-window)
    },
    width = 0.8, -- Bookmarks window width:  (0, 1]
    height = 0.7, -- Bookmarks window height: (0, 1]
    preview_ratio = 0.45, -- Bookmarks preview window ratio (0, 1]
    tags_ratio = 0.1, -- Bookmarks tags window ratio
    fix_enable = false, -- If true, when saving the current file, if the bookmark line number of the current file changes, try to fix it.

    virt_text = "", -- Show virt text at the end of bookmarked lines, if it is empty, use the description of bookmarks instead.
    sign_icon = "󰃃",                                           -- if it is not empty, show icon in signColumn.
    virt_pattern = { "*.go", "*.lua", "*.sh", "*.php", "*.rs" }, -- Show virt text only on matched pattern
    virt_ignore_pattern = {}, -- Ignore showing virt text on matched pattern, this works after virt_pattern
    border_style = "single", -- border style: "single", "double", "rounded" 
    hl = {
        border = "TelescopeBorder", -- border highlight
        cursorline = "guibg=Gray guifg=White", -- cursorline highlight
    }
})



--messages
require('messages').setup({
  command_name = 'Messages',
  -- should prepare a new buffer and return the winid
  -- by default opens a floating window
  -- provide a different callback to change this behaviour
  -- @param opts: the return value from float_opts
  prepare_buffer = function(opts)
    local buf = vim.api.nvim_create_buf(false, true)
    return vim.api.nvim_open_win(buf, true, opts)
  end,
  -- should return options passed to prepare_buffer
  -- @param lines: a list of the lines of text
  buffer_opts = function(lines)
    local gheight = vim.api.nvim_list_uis()[1].height
    local gwidth = vim.api.nvim_list_uis()[1].width
    return {
      relative = 'editor',
      width = gwidth - 2,
      height = clip_val(1, #lines, gheight * 0.5),
      anchor = 'SW',
      row = gheight - 1,
      col = 0,
      style = 'minimal',
      border = 'rounded',
      zindex = 1,
    }
  end,
  -- what to do after opening the float
  post_open_float = function(winnr)
  end
})

require "confirm-quit".confirm_quit()     -- :ConfirmQuit
require "confirm-quit".confirm_quit_all() -- :ConfirmQuitAll

require "confirm-quit".confirm_quit { bang = true }     -- ConfirmQuit!
require "confirm-quit".confirm_quit_all { bang = true } -- ConfirmQuitAll!





--dap
local opts = { noremap = true, silent = true }
local keymap = vim.api.nvim_set_keymap
-- Save breakpoints to file automatically.
keymap("n", "<YourKey1>", "<cmd>lua require('persistent-breakpoints.api').toggle_breakpoint()<cr>", opts)
keymap("n", "<YourKey2>", "<cmd>lua require('persistent-breakpoints.api').set_conditional_breakpoint()<cr>", opts)
keymap("n", "<YourKey3>", "<cmd>lua require('persistent-breakpoints.api').clear_all_breakpoints()<cr>", opts)
require('persistent-breakpoints').setup{
	save_dir = vim.fn.stdpath('data') .. '/nvim_checkpoints',
	-- when to load the breakpoints? "BufReadPost" is recommanded.
	load_breakpoints_event = nil,
	-- record the performance of different function. run :lua require('persistent-breakpoints.api').print_perf_data() to see the result.
	perf_record = false,
	-- perform callback when loading a persisted breakpoint
	--- @param opts DAPBreakpointOptions options used to create the breakpoint ({condition, logMessage, hitCondition})
	--- @param buf_id integer the buffer the breakpoint was set on
	--- @param line integer the line the breakpoint was set on
	on_load_breakpoint = nil,
} 
local map = vim.keymap.set
map('n', ']d', require('goto-breakpoints').next, {})
map('n', '[d', require('goto-breakpoints').prev, {})
map('n', ']S', require('goto-breakpoints').stopped, {})
require("nvim-dap-virtual-text").setup {
    enabled = true,                        -- enable this plugin (the default)
    enabled_commands = true,               -- create commands DapVirtualTextEnable, DapVirtualTextDisable, DapVirtualTextToggle, (DapVirtualTextForceRefresh for refreshing when debug adapter did not notify its termination)
    highlight_changed_variables = true,    -- highlight changed values with NvimDapVirtualTextChanged, else always NvimDapVirtualText
    highlight_new_as_changed = false,      -- highlight new variables in the same way as changed variables (if highlight_changed_variables)
    show_stop_reason = true,               -- show stop reason when stopped for exceptions
    commented = false,                     -- prefix virtual text with comment string
    only_first_definition = true,          -- only show virtual text at first definition (if there are multiple)
    all_references = false,                -- show virtual text on all all references of the variable (not only definitions)
    clear_on_continue = false,             -- clear virtual text on "continue" (might cause flickering when stepping)
    --- A callback that determines how a variable is displayed or whether it should be omitted
    --- @param variable Variable https://microsoft.github.io/debug-adapter-protocol/specification#Types_Variable
    --- @param buf number
    --- @param stackframe dap.StackFrame https://microsoft.github.io/debug-adapter-protocol/specification#Types_StackFrame
    --- @param node userdata tree-sitter node identified as variable definition of reference (see `:h tsnode`)
    --- @param options nvim_dap_virtual_text_options Current options for nvim-dap-virtual-text
    --- @return string|nil A text how the virtual text should be displayed or nil, if this variable shouldn't be displayed
    display_callback = function(variable, buf, stackframe, node, options)
      if options.virt_text_pos == 'inline' then
        return ' = ' .. variable.value
      else
        return variable.name .. ' = ' .. variable.value
      end
    end,
    -- position of virtual text, see `:h nvim_buf_set_extmark()`, default tries to inline the virtual text. Use 'eol' to set to end of line
    virt_text_pos = vim.fn.has 'nvim-0.10' == 1 and 'inline' or 'eol',

    -- experimental features:
    all_frames = false,                    -- show virtual text for all stack frames not only current. Only works for debugpy on my machine.
    virt_lines = false,                    -- show virtual lines instead of virtual text (will flicker!)
    virt_text_win_col = nil                -- position the virtual text at a fixed window column (starting from the first text column) ,
                                           -- e.g. 80 to position at column 80, see `:h nvim_buf_set_extmark()`
}



--runner
vim.keymap.set('n', '<leader>r', require('runner').run)
require('runner').setup({
  position = 'right', -- position of the terminal window when using the shell_handler
                      -- can be: top, left, right, bottom
                      -- will be overwritten when using the telescope mapping to open horizontally or vertically

  width = 80,         -- width of window when position is left or right
  height = 10,        -- height of window when position is top or bottom

  handlers = {} -- discussed in the next section
})





--neodev
require("neodev").setup({
  library = {
    enabled = true, -- when not enabled, neodev will not change any settings to the LSP server
    -- these settings will be used for your Neovim config directory
    runtime = true, -- runtime path
    types = true, -- full signature, docs and completion of vim.api, vim.treesitter, vim.lsp and others
    plugins = true, -- installed opt or start plugins in packpath
    -- you can also specify the list of plugins to make available as a workspace library
    -- plugins = { "nvim-treesitter", "plenary.nvim", "telescope.nvim" },
  },
  setup_jsonls = true, -- configures jsonls to provide completion for project specific .luarc.json files
  -- for your Neovim config directory, the config.library settings will be used as is
  -- for plugin directories (root_dirs having a /lua directory), config.library.plugins will be disabled
  -- for any other directory, config.library.enabled will be set to false
  override = function(root_dir, options) end,
  -- With lspconfig, Neodev will automatically setup your lua-language-server
  -- If you disable this, then you have to set {before_init=require("neodev.lsp").before_init}
  -- in your lsp start options
  lspconfig = true,
  -- much faster, but needs a recent built of lua-language-server
  -- needs lua-language-server >= 3.6.0
  pathStrict = true,
})






--octo
require"octo".setup({
  use_local_fs = false,                    -- use local files on right side of reviews
  enable_builtin = false,                  -- shows a list of builtin actions when no action is provided
  default_remote = {"upstream", "origin"}; -- order to try remotes
  default_merge_method = "commit",         -- default merge method which should be used when calling `Octo pr merge`, could be `commit`, `rebase` or `squash`
  ssh_aliases = {},                        -- SSH aliases. e.g. `ssh_aliases = {["github.com-work"] = "github.com"}`
  picker = "telescope",                    -- or "fzf-lua"
  picker_config = {
    use_emojis = false,                    -- only used by "fzf-lua" picker for now
    mappings = {                           -- mappings for the pickers
      open_in_browser = { lhs = "<C-b>", desc = "open issue in browser" },
      copy_url = { lhs = "<C-y>", desc = "copy url to system clipboard" },
      checkout_pr = { lhs = "<C-o>", desc = "checkout pull request" },
      merge_pr = { lhs = "<C-r>", desc = "merge pull request" },
    },
  },
  comment_icon = "▎",                      -- comment marker
  outdated_icon = "󰅒 ",                    -- outdated indicator
  resolved_icon = " ",                    -- resolved indicator
  reaction_viewer_hint_icon = " ";        -- marker for user reactions
  user_icon = " ";                        -- user icon
  timeline_marker = " ";                  -- timeline marker
  timeline_indent = "2";                   -- timeline indentation
  right_bubble_delimiter = "";            -- bubble delimiter
  left_bubble_delimiter = "";             -- bubble delimiter
  github_hostname = "";                    -- GitHub Enterprise host
  snippet_context_lines = 4;               -- number or lines around commented lines
  gh_cmd = "gh",                           -- Command to use when calling Github CLI
  gh_env = {},                             -- extra environment variables to pass on to GitHub CLI, can be a table or function returning a table
  timeout = 5000,                          -- timeout for requests between the remote server
  default_to_projects_v2 = false,          -- use projects v2 for the `Octo card ...` command by default. Both legacy and v2 commands are available under `Octo cardlegacy ...` and `Octo cardv2 ...` respectively.
  ui = {
    use_signcolumn = true,                 -- show "modified" marks on the sign column
  },
  issues = {
    order_by = {                           -- criteria to sort results of `Octo issue list`
      field = "CREATED_AT",                -- either COMMENTS, CREATED_AT or UPDATED_AT (https://docs.github.com/en/graphql/reference/enums#issueorderfield)
      direction = "DESC"                   -- either DESC or ASC (https://docs.github.com/en/graphql/reference/enums#orderdirection)
    }
  },
  pull_requests = {
    order_by = {                           -- criteria to sort the results of `Octo pr list`
      field = "CREATED_AT",                -- either COMMENTS, CREATED_AT or UPDATED_AT (https://docs.github.com/en/graphql/reference/enums#issueorderfield)
      direction = "DESC"                   -- either DESC or ASC (https://docs.github.com/en/graphql/reference/enums#orderdirection)
    },
    always_select_remote_on_create = false -- always give prompt to select base remote repo when creating PRs
  },
  file_panel = {
    size = 10,                             -- changed files panel rows
    use_icons = true                       -- use web-devicons in file panel (if false, nvim-web-devicons does not need to be installed)
  },
  colors = {                               -- used for highlight groups (see Colors section below)
    white = "#ffffff",
    grey = "#2A354C",
    black = "#000000",
    red = "#fdb8c0",
    dark_red = "#da3633",
    green = "#acf2bd",
    dark_green = "#238636",
    yellow = "#d3c846",
    dark_yellow = "#735c0f",
    blue = "#58A6FF",
    dark_blue = "#0366d6",
    purple = "#6f42c1",
  },
  mappings_disable_default = false,        -- disable default mappings if true, but will still adapt user mappings
  mappings = {
    issue = {
      close_issue = { lhs = "<space>ic", desc = "close issue" },
      reopen_issue = { lhs = "<space>io", desc = "reopen issue" },
      list_issues = { lhs = "<space>il", desc = "list open issues on same repo" },
      reload = { lhs = "<C-r>", desc = "reload issue" },
      open_in_browser = { lhs = "<C-b>", desc = "open issue in browser" },
      copy_url = { lhs = "<C-y>", desc = "copy url to system clipboard" },
      add_assignee = { lhs = "<space>aa", desc = "add assignee" },
      remove_assignee = { lhs = "<space>ad", desc = "remove assignee" },
      create_label = { lhs = "<space>lc", desc = "create label" },
      add_label = { lhs = "<space>la", desc = "add label" },
      remove_label = { lhs = "<space>ld", desc = "remove label" },
      goto_issue = { lhs = "<space>gi", desc = "navigate to a local repo issue" },
      add_comment = { lhs = "<space>ca", desc = "add comment" },
      delete_comment = { lhs = "<space>cd", desc = "delete comment" },
      next_comment = { lhs = "]c", desc = "go to next comment" },
      prev_comment = { lhs = "[c", desc = "go to previous comment" },
      react_hooray = { lhs = "<space>rp", desc = "add/remove 🎉 reaction" },
      react_heart = { lhs = "<space>rh", desc = "add/remove ❤️ reaction" },
      react_eyes = { lhs = "<space>re", desc = "add/remove 👀 reaction" },
      react_thumbs_up = { lhs = "<space>r+", desc = "add/remove 👍 reaction" },
      react_thumbs_down = { lhs = "<space>r-", desc = "add/remove 👎 reaction" },
      react_rocket = { lhs = "<space>rr", desc = "add/remove 🚀 reaction" },
      react_laugh = { lhs = "<space>rl", desc = "add/remove 😄 reaction" },
      react_confused = { lhs = "<space>rc", desc = "add/remove 😕 reaction" },
    },
    pull_request = {
      checkout_pr = { lhs = "<space>po", desc = "checkout PR" },
      merge_pr = { lhs = "<space>pm", desc = "merge commit PR" },
      squash_and_merge_pr = { lhs = "<space>psm", desc = "squash and merge PR" },
      rebase_and_merge_pr = { lhs = "<space>prm", desc = "rebase and merge PR" },
      list_commits = { lhs = "<space>pc", desc = "list PR commits" },
      list_changed_files = { lhs = "<space>pf", desc = "list PR changed files" },
      show_pr_diff = { lhs = "<space>pd", desc = "show PR diff" },
      add_reviewer = { lhs = "<space>va", desc = "add reviewer" },
      remove_reviewer = { lhs = "<space>vd", desc = "remove reviewer request" },
      close_issue = { lhs = "<space>ic", desc = "close PR" },
      reopen_issue = { lhs = "<space>io", desc = "reopen PR" },
      list_issues = { lhs = "<space>il", desc = "list open issues on same repo" },
      reload = { lhs = "<C-r>", desc = "reload PR" },
      open_in_browser = { lhs = "<C-b>", desc = "open PR in browser" },
      copy_url = { lhs = "<C-y>", desc = "copy url to system clipboard" },
      goto_file = { lhs = "gf", desc = "go to file" },
      add_assignee = { lhs = "<space>aa", desc = "add assignee" },
      remove_assignee = { lhs = "<space>ad", desc = "remove assignee" },
      create_label = { lhs = "<space>lc", desc = "create label" },
      add_label = { lhs = "<space>la", desc = "add label" },
      remove_label = { lhs = "<space>ld", desc = "remove label" },
      goto_issue = { lhs = "<space>gi", desc = "navigate to a local repo issue" },
      add_comment = { lhs = "<space>ca", desc = "add comment" },
      delete_comment = { lhs = "<space>cd", desc = "delete comment" },
      next_comment = { lhs = "]c", desc = "go to next comment" },
      prev_comment = { lhs = "[c", desc = "go to previous comment" },
      react_hooray = { lhs = "<space>rp", desc = "add/remove 🎉 reaction" },
      react_heart = { lhs = "<space>rh", desc = "add/remove ❤️ reaction" },
      react_eyes = { lhs = "<space>re", desc = "add/remove 👀 reaction" },
      react_thumbs_up = { lhs = "<space>r+", desc = "add/remove 👍 reaction" },
      react_thumbs_down = { lhs = "<space>r-", desc = "add/remove 👎 reaction" },
      react_rocket = { lhs = "<space>rr", desc = "add/remove 🚀 reaction" },
      react_laugh = { lhs = "<space>rl", desc = "add/remove 😄 reaction" },
      react_confused = { lhs = "<space>rc", desc = "add/remove 😕 reaction" },
      review_start = { lhs = "<space>vs", desc = "start a review for the current PR" },
      review_resume = { lhs = "<space>vr", desc = "resume a pending review for the current PR" },
    },
    review_thread = {
      goto_issue = { lhs = "<space>gi", desc = "navigate to a local repo issue" },
      add_comment = { lhs = "<space>ca", desc = "add comment" },
      add_suggestion = { lhs = "<space>sa", desc = "add suggestion" },
      delete_comment = { lhs = "<space>cd", desc = "delete comment" },
      next_comment = { lhs = "]c", desc = "go to next comment" },
      prev_comment = { lhs = "[c", desc = "go to previous comment" },
      select_next_entry = { lhs = "]q", desc = "move to previous changed file" },
      select_prev_entry = { lhs = "[q", desc = "move to next changed file" },
      select_first_entry = { lhs = "[Q", desc = "move to first changed file" },
      select_last_entry = { lhs = "]Q", desc = "move to last changed file" },
      close_review_tab = { lhs = "<C-c>", desc = "close review tab" },
      react_hooray = { lhs = "<space>rp", desc = "add/remove 🎉 reaction" },
      react_heart = { lhs = "<space>rh", desc = "add/remove ❤️ reaction" },
      react_eyes = { lhs = "<space>re", desc = "add/remove 👀 reaction" },
      react_thumbs_up = { lhs = "<space>r+", desc = "add/remove 👍 reaction" },
      react_thumbs_down = { lhs = "<space>r-", desc = "add/remove 👎 reaction" },
      react_rocket = { lhs = "<space>rr", desc = "add/remove 🚀 reaction" },
      react_laugh = { lhs = "<space>rl", desc = "add/remove 😄 reaction" },
      react_confused = { lhs = "<space>rc", desc = "add/remove 😕 reaction" },
    },
    submit_win = {
      approve_review = { lhs = "<C-a>", desc = "approve review" },
      comment_review = { lhs = "<C-m>", desc = "comment review" },
      request_changes = { lhs = "<C-r>", desc = "request changes review" },
      close_review_tab = { lhs = "<C-c>", desc = "close review tab" },
    },
    review_diff = {
      submit_review = { lhs = "<leader>vs", desc = "submit review" },
      discard_review = { lhs = "<leader>vd", desc = "discard review" },
      add_review_comment = { lhs = "<space>ca", desc = "add a new review comment" },
      add_review_suggestion = { lhs = "<space>sa", desc = "add a new review suggestion" },
      focus_files = { lhs = "<leader>e", desc = "move focus to changed file panel" },
      toggle_files = { lhs = "<leader>b", desc = "hide/show changed files panel" },
      next_thread = { lhs = "]t", desc = "move to next thread" },
      prev_thread = { lhs = "[t", desc = "move to previous thread" },
      select_next_entry = { lhs = "]q", desc = "move to previous changed file" },
      select_prev_entry = { lhs = "[q", desc = "move to next changed file" },
      select_first_entry = { lhs = "[Q", desc = "move to first changed file" },
      select_last_entry = { lhs = "]Q", desc = "move to last changed file" },
      close_review_tab = { lhs = "<C-c>", desc = "close review tab" },
      toggle_viewed = { lhs = "<leader><space>", desc = "toggle viewer viewed state" },
      goto_file = { lhs = "gf", desc = "go to file" },
    },
    file_panel = {
      submit_review = { lhs = "<leader>vs", desc = "submit review" },
      discard_review = { lhs = "<leader>vd", desc = "discard review" },
      next_entry = { lhs = "j", desc = "move to next changed file" },
      prev_entry = { lhs = "k", desc = "move to previous changed file" },
      select_entry = { lhs = "<cr>", desc = "show selected changed file diffs" },
      refresh_files = { lhs = "R", desc = "refresh changed files panel" },
      focus_files = { lhs = "<leader>e", desc = "move focus to changed file panel" },
      toggle_files = { lhs = "<leader>b", desc = "hide/show changed files panel" },
      select_next_entry = { lhs = "]q", desc = "move to previous changed file" },
      select_prev_entry = { lhs = "[q", desc = "move to next changed file" },
      select_first_entry = { lhs = "[Q", desc = "move to first changed file" },
      select_last_entry = { lhs = "]Q", desc = "move to last changed file" },
      close_review_tab = { lhs = "<C-c>", desc = "close review tab" },
      toggle_viewed = { lhs = "<leader><space>", desc = "toggle viewer viewed state" },
    },
  },
})




--lazygit
vim.g.lazygit_floating_window_winblend = 0 -- transparency of floating window
vim.g.lazygit_floating_window_scaling_factor = 0.9 -- scaling factor for floating window
vim.g.lazygit_floating_window_border_chars = {'╭','─', '╮', '│', '╯','─', '╰', '│'} -- customize lazygit popup window border characters
vim.g.lazygit_floating_window_use_plenary = 0 -- use plenary.nvim to manage floating window if available
vim.g.lazygit_use_neovim_remote = 1 -- fallback to 0 if neovim-remote is not installed

vim.g.lazygit_use_custom_config_file_path = 0 -- config file path is evaluated if this value is 1
vim.g.lazygit_config_file_path = '' -- custom config file path
-- OR
vim.g.lazygit_config_file_path = {} -- table of custom config file paths
-- Key binding to open LazyGit in Neovim
vim.api.nvim_set_keymap('n', '<leader>gg', ':LazyGit<CR>', { noremap = true, silent = true })







--gitsigns
require('gitsigns').setup {
  signs = {
    add          = { text = '┃' },
    change       = { text = '┃' },
    delete       = { text = '_' },
    topdelete    = { text = '‾' },
    changedelete = { text = '~' },
    untracked    = { text = '┆' },
  },
  signcolumn = true,  -- Toggle with `:Gitsigns toggle_signs`
  numhl      = false, -- Toggle with `:Gitsigns toggle_numhl`
  linehl     = false, -- Toggle with `:Gitsigns toggle_linehl`
  word_diff  = false, -- Toggle with `:Gitsigns toggle_word_diff`
  watch_gitdir = {
    follow_files = true
  },
  auto_attach = true,
  attach_to_untracked = false,
  current_line_blame = false, -- Toggle with `:Gitsigns toggle_current_line_blame`
  current_line_blame_opts = {
    virt_text = true,
    virt_text_pos = 'eol', -- 'eol' | 'overlay' | 'right_align'
    delay = 1000,
    ignore_whitespace = false,
    virt_text_priority = 100,
  },
  current_line_blame_formatter = '<author>, <author_time:%Y-%m-%d> - <summary>',
  current_line_blame_formatter_opts = {
    relative_time = false,
  },
  sign_priority = 6,
  update_debounce = 100,
  status_formatter = nil, -- Use default
  max_file_length = 40000, -- Disable if file is longer than this (in lines)
  preview_config = {
    -- Options passed to nvim_open_win
    border = 'single',
    style = 'minimal',
    relative = 'cursor',
    row = 0,
    col = 1
  },
}
require('gitsigns').setup{
  on_attach = function(bufnr)
    local gitsigns = require('gitsigns')

    local function map(mode, l, r, opts)
      opts = opts or {}
      opts.buffer = bufnr
      vim.keymap.set(mode, l, r, opts)
    end

    -- Navigation
    map('n', ']c', function()
      if vim.wo.diff then
        vim.cmd.normal({']c', bang = true})
      else
        gitsigns.nav_hunk('next')
      end
    end)

    map('n', '[c', function()
      if vim.wo.diff then
        vim.cmd.normal({'[c', bang = true})
      else
        gitsigns.nav_hunk('prev')
      end
    end)

    -- Actions
    map('n', '<leader>hs', gitsigns.stage_hunk)
    map('n', '<leader>hr', gitsigns.reset_hunk)
    map('v', '<leader>hs', function() gitsigns.stage_hunk {vim.fn.line('.'), vim.fn.line('v')} end)
    map('v', '<leader>hr', function() gitsigns.reset_hunk {vim.fn.line('.'), vim.fn.line('v')} end)
    map('n', '<leader>hS', gitsigns.stage_buffer)
    map('n', '<leader>hu', gitsigns.undo_stage_hunk)
    map('n', '<leader>hR', gitsigns.reset_buffer)
    map('n', '<leader>hp', gitsigns.preview_hunk)
    map('n', '<leader>hb', function() gitsigns.blame_line{full=true} end)
    map('n', '<leader>tb', gitsigns.toggle_current_line_blame)
    map('n', '<leader>hd', gitsigns.diffthis)
    map('n', '<leader>hD', function() gitsigns.diffthis('~') end)
    map('n', '<leader>td', gitsigns.toggle_deleted)

    -- Text object
    map({'o', 'x'}, 'ih', ':<C-U>Gitsigns select_hunk<CR>')
  end
}




--Smoothcursor
require('smoothcursor').setup({
    type = "default",           -- Cursor movement calculation method, choose "default", "exp" (exponential) or "matrix".

    cursor = "",              -- Cursor shape (requires Nerd Font). Disabled in fancy mode.
    texthl = "SmoothCursor",   -- Highlight group. Default is { bg = nil, fg = "#FFD400" }. Disabled in fancy mode.
    linehl = nil,              -- Highlights the line under the cursor, similar to 'cursorline'. "CursorLine" is recommended. Disabled in fancy mode.

    fancy = {
        enable = true,        -- enable fancy mode
        head = { cursor = "▷", texthl = "SmoothCursor", linehl = nil }, -- false to disable fancy head
        body = {
            { cursor = "󰝥", texthl = "SmoothCursorRed" },
            { cursor = "󰝥", texthl = "SmoothCursorOrange" },
            { cursor = "●", texthl = "SmoothCursorYellow" },
            { cursor = "●", texthl = "SmoothCursorGreen" },
            { cursor = "•", texthl = "SmoothCursorAqua" },
            { cursor = ".", texthl = "SmoothCursorBlue" },
            { cursor = ".", texthl = "SmoothCursorPurple" },
        },
        tail = { cursor = nil, texthl = "SmoothCursor" } -- false to disable fancy tail
    },

    matrix = {  -- Loaded when 'type' is set to "matrix"
        head = {
            -- Picks a random character from this list for the cursor text
            cursor = require('smoothcursor.matrix_chars'),
            -- Picks a random highlight from this list for the cursor text
            texthl = {
                'SmoothCursor',
            },
            linehl = nil,  -- No line highlight for the head
        },
        body = {
            length = 6,  -- Specifies the length of the cursor body
            -- Picks a random character from this list for the cursor body text
            cursor = require('smoothcursor.matrix_chars'),
            -- Picks a random highlight from this list for each segment of the cursor body
            texthl = {
                'SmoothCursorGreen',
            },
        },
        tail = {
            -- Picks a random character from this list for the cursor tail (if any)
            cursor = nil,
            -- Picks a random highlight from this list for the cursor tail
            texthl = {
                'SmoothCursor',
            },
        },
        unstop = false,  -- Determines if the cursor should stop or not (false means it will stop)
    },

    autostart = true,           -- Automatically start SmoothCursor
    always_redraw = true,       -- Redraw the screen on each update
    flyin_effect = nil,         -- Choose "bottom" or "top" for flying effect
    speed = 25,                 -- Max speed is 100 to stick with your current position
    intervals = 35,             -- Update intervals in milliseconds
    priority = 10,              -- Set marker priority
    timeout = 3000,             -- Timeout for animations in milliseconds
    threshold = 3,              -- Animate only if cursor moves more than this many lines
    max_threshold = nil,         -- If you move more than this many lines, don't animate (if `nil`, deactivate check)
    disable_float_win = false,  -- Disable in floating windows
    enabled_filetypes = nil,    -- Enable only for specific file types, e.g., { "lua", "vim" }
    disabled_filetypes = nil,   -- Disable for these file types, ignored if enabled_filetypes is set. e.g., { "TelescopePrompt", "NvimTree" }
    -- Show the position of the latest input mode positions. 
    -- A value of "enter" means the position will be updated when entering the mode.
    -- A value of "leave" means the position will be updated when leaving the mode.
    -- `nil` = disabled
    show_last_positions = nil,  
})





--which-key
    require("which-key").setup({
  plugins = {
    marks = true, -- shows a list of your marks on ' and `
    registers = true, -- shows your registers on " in NORMAL or <C-r> in INSERT mode
    -- the presets plugin, adds help for a bunch of default keybindings in Neovim
    -- No actual key bindings are created
    spelling = {
      enabled = true, -- enabling this will show WhichKey when pressing z= to select spelling suggestions
      suggestions = 20, -- how many suggestions should be shown in the list?
    },
    presets = {
      operators = true, -- adds help for operators like d, y, ...
      motions = true, -- adds help for motions
      text_objects = true, -- help for text objects triggered after entering an operator
      windows = true, -- default bindings on <c-w>
      nav = true, -- misc bindings to work with windows
      z = true, -- bindings for folds, spelling and others prefixed with z
      g = true, -- bindings for prefixed with g
    },
  },
  -- add operators that will trigger motion and text object completion
  -- to enable all native operators, set the preset / operators plugin above
  operators = { gc = "Comments" },
  key_labels = {
    -- override the label used to display some keys. It doesn't effect WK in any other way.
    -- For example:
    -- ["<space>"] = "SPC",
    -- ["<cr>"] = "RET",
    -- ["<tab>"] = "TAB",
  },
  motions = {
    count = true,
  },
  icons = {
    breadcrumb = "»", -- symbol used in the command line area that shows your active key combo
    separator = "➜", -- symbol used between a key and it's label
    group = "+", -- symbol prepended to a group
  },
  popup_mappings = {
    scroll_down = "<c-d>", -- binding to scroll down inside the popup
    scroll_up = "<c-u>", -- binding to scroll up inside the popup
  },
  window = {
    border = "none", -- none, single, double, shadow
    position = "bottom", -- bottom, top
    margin = { 1, 0, 1, 0 }, -- extra window margin [top, right, bottom, left]. When between 0 and 1, will be treated as a percentage of the screen size.
    padding = { 1, 2, 1, 2 }, -- extra window padding [top, right, bottom, left]
    winblend = 0, -- value between 0-100 0 for fully opaque and 100 for fully transparent
    zindex = 1000, -- positive value to position WhichKey above other floating windows.
  },
  layout = {
    height = { min = 4, max = 25 }, -- min and max height of the columns
    width = { min = 20, max = 50 }, -- min and max width of the columns
    spacing = 3, -- spacing between columns
    align = "left", -- align columns left, center or right
  },
  ignore_missing = false, -- enable this to hide mappings for which you didn't specify a label
  hidden = { "<silent>", "<cmd>", "<Cmd>", "<CR>", "^:", "^ ", "^call ", "^lua " }, -- hide mapping boilerplate
  show_help = true, -- show a help message in the command line for using WhichKey
  show_keys = true, -- show the currently pressed key and its label as a message in the command line
  triggers = "auto", -- automatically setup triggers
  -- triggers = {"<leader>"} -- or specifiy a list manually
  -- list of triggers, where WhichKey should not wait for timeoutlen and show immediately
  triggers_nowait = {
    -- marks
    "`",
    "'",
    "g`",
    "g'",
    -- registers
    '"',
    "<c-r>",
    -- spelling
    "z=",
  },
  triggers_blacklist = {
    -- list of mode / prefixes that should never be hooked by WhichKey
    -- this is mostly relevant for keymaps that start with a native binding
    i = { "j", "k" },
    v = { "j", "k" },
  },
  -- disable the WhichKey popup for certain buf types and file types.
  -- Disabled by default for Telescope
  disable = {
    buftypes = {},
    filetypes = {},
  },
})
vim.opt.timeout = true
vim.opt.timeoutlen = 300






--codewindow
    local codewindow = require('codewindow')
    codewindow.setup({
  active_in_terminals = false, -- Should the minimap activate for terminal buffers
  auto_enable = false, -- Automatically open the minimap when entering a (non-excluded) buffer (accepts a table of filetypes)
  exclude_filetypes = { 'help' }, -- Choose certain filetypes to not show minimap on
  max_minimap_height = nil, -- The maximum height the minimap can take (including borders)
  max_lines = nil, -- If auto_enable is true, don't open the minimap for buffers which have more than this many lines.
  minimap_width = 20, -- The width of the text part of the minimap
  use_lsp = true, -- Use the builtin LSP to show errors and warnings
  use_treesitter = true, -- Use nvim-treesitter to highlight the code
  use_git = true, -- Show small dots to indicate git additions and deletions
  width_multiplier = 4, -- How many characters one dot represents
  z_index = 1, -- The z-index the floating window will be on
  show_cursor = true, -- Show the cursor position in the minimap
  screen_bounds = 'lines', -- How the visible area is displayed, "lines": lines above and below, "background": background color
  window_border = 'single', -- The border style of the floating window (accepts all usual options)
  relative = 'win', -- What will be the minimap be placed relative to, "win": the current window, "editor": the entire editor
  events = { 'TextChanged', 'InsertLeave', 'DiagnosticChanged', 'FileWritePost' } -- Events that update the code window
})





--zenmode
vim.api.nvim_set_keymap('n', '<leader>z', ':ZenMode<CR>', { noremap = true, silent = true })
require('zen-mode').setup({
  window = {
    backdrop = 0.95, -- shade the backdrop of the Zen window. Set to 1 to keep the same as Normal
    -- height and width can be:
    -- * an absolute number of cells when > 1
    -- * a percentage of the width / height of the editor when <= 1
    -- * a function that returns the width or the height
    width = 120, -- width of the Zen window
    height = 1, -- height of the Zen window
    -- by default, no options are changed for the Zen window
    -- uncomment any of the options below, or add other vim.wo options you want to apply
    options = {
      -- signcolumn = "no", -- disable signcolumn
      -- number = false, -- disable number column
      -- relativenumber = false, -- disable relative numbers
      -- cursorline = false, -- disable cursorline
      -- cursorcolumn = false, -- disable cursor column
      -- foldcolumn = "0", -- disable fold column
      -- list = false, -- disable whitespace characters
    },
  },
  plugins = {
    -- disable some global vim options (vim.o...)
    -- comment the lines to not apply the options
    options = {
      enabled = true,
      ruler = false, -- disables the ruler text in the cmd line area
      showcmd = false, -- disables the command in the last line of the screen
      -- you may turn on/off statusline in zen mode by setting 'laststatus' 
      -- statusline will be shown only if 'laststatus' == 3
      laststatus = 0, -- turn off the statusline in zen mode
    },
    twilight = { enabled = true }, -- enable to start Twilight when zen mode opens
    gitsigns = { enabled = false }, -- disables git signs
    tmux = { enabled = false }, -- disables the tmux statusline
    -- this will change the font size on kitty when in zen mode
    -- to make this work, you need to set the following kitty options:
    -- - allow_remote_control socket-only
    -- - listen_on unix:/tmp/kitty
    kitty = {
      enabled = false,
      font = "+4", -- font size increment
    },
    -- this will change the font size on alacritty when in zen mode
    -- requires  Alacritty Version 0.10.0 or higher
    -- uses `alacritty msg` subcommand to change font size
    alacritty = {
      enabled = false,
      font = "14", -- font size
    },
    -- this will change the font size on wezterm when in zen mode
    -- See alse also the Plugins/Wezterm section in this projects README
    wezterm = {
      enabled = false,
      -- can be either an absolute font size or the number of incremental steps
      font = "+4", -- (10% increase per step)
    },
  },
  -- callback where you can add custom code when the Zen window opens
  on_open = function(win)
  end,
  -- callback where you can add custom code when the Zen window closes
  on_close = function()
  end,
})







--telescope
-- First, make sure you have telescope and plenary installed
local telescope = require('telescope')

-- Keymap function for ease of use
local map = function(mode, lhs, rhs, opts)
  local options = { noremap = true, silent = true }
  if opts then
    options = vim.tbl_extend('force', options, opts)
  end
  vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end

-- Telescope Keymaps

-- File Pickers
map('n', '<leader>ff', '<cmd>Telescope find_files<cr>')
map('n', '<leader>fg', '<cmd>Telescope live_grep<cr>')
map('n', '<leader>fb', '<cmd>Telescope buffers<cr>')
map('n', '<leader>fh', '<cmd>Telescope help_tags<cr>')
map('n', '<leader>fo', '<cmd>Telescope oldfiles<cr>')
map('n', '<leader>fc', '<cmd>Telescope commands<cr>')
map('n', '<leader>fk', '<cmd>Telescope keymaps<cr>')
map('n', '<leader>fr', '<cmd>Telescope registers<cr>')
map('n', '<leader>fm', '<cmd>Telescope marks<cr>')
map('n', '<leader>fq', '<cmd>Telescope quickfix<cr>')
map('n', '<leader>fl', '<cmd>Telescope loclist<cr>')
map('n', '<leader>ft', '<cmd>Telescope treesitter<cr>')
map('n', '<leader>fs', '<cmd>Telescope spell_suggest<cr>')
map('n', '<leader>fd', '<cmd>Telescope diagnostics<cr>')

-- Vim Pickers
map('n', '<leader>vc', '<cmd>Telescope commands<cr>')
map('n', '<leader>vh', '<cmd>Telescope command_history<cr>')
map('n', '<leader>vs', '<cmd>Telescope search_history<cr>')
map('n', '<leader>vm', '<cmd>Telescope marks<cr>')
map('n', '<leader>vr', '<cmd>Telescope registers<cr>')
map('n', '<leader>vk', '<cmd>Telescope keymaps<cr>')
map('n', '<leader>vo', '<cmd>Telescope vim_options<cr>')
map('n', '<leader>va', '<cmd>Telescope autocommands<cr>')
map('n', '<leader>vc', '<cmd>Telescope colorscheme<cr>')

-- LSP Pickers
map('n', '<leader>lr', '<cmd>Telescope lsp_references<cr>')
map('n', '<leader>ld', '<cmd>Telescope lsp_definitions<cr>')
map('n', '<leader>li', '<cmd>Telescope lsp_implementations<cr>')
map('n', '<leader>lt', '<cmd>Telescope lsp_type_definitions<cr>')
map('n', '<leader>ls', '<cmd>Telescope lsp_document_symbols<cr>')
map('n', '<leader>lw', '<cmd>Telescope lsp_workspace_symbols<cr>')
map('n', '<leader>lc', '<cmd>Telescope lsp_code_actions<cr>')
map('n', '<leader>ll', '<cmd>Telescope lsp_range_code_actions<cr>')
map('n', '<leader>ld', '<cmd>Telescope diagnostics<cr>')

-- Git Pickers
map('n', '<leader>gb', '<cmd>Telescope git_branches<cr>')
map('n', '<leader>gc', '<cmd>Telescope git_commits<cr>')
map('n', '<leader>gs', '<cmd>Telescope git_status<cr>')
map('n', '<leader>gf', '<cmd>Telescope git_files<cr>')
map('n', '<leader>gC', '<cmd>Telescope git_bcommits<cr>') -- Buffer commits
map('n', '<leader>gt', '<cmd>Telescope git_stash<cr>')

-- Treesitter Pickers
map('n', '<leader>ts', '<cmd>Telescope treesitter<cr>')
map('n', '<leader>ta', '<cmd>Telescope treesitter playground<cr>') -- If playground extension is enabled

-- Lists Pickers
map('n', '<leader>lq', '<cmd>Telescope quickfix<cr>')
map('n', '<leader>ll', '<cmd>Telescope loclist<cr>')
require('telescope').setup{
  defaults = {
    -- Default configuration for telescope goes here:
    -- config_key = value,
    layout_strategy = 'horizontal', -- layout strategy: 'horizontal', 'vertical', 'center', 'flex'
    layout_config = {
      horizontal = {
        prompt_position = 'top',  -- position of the prompt: 'top' or 'bottom'
        preview_width = 0.55,     -- percentage of screen to use for the preview window
        results_width = 0.8,      -- percentage of screen to use for the results window
      },
      vertical = {
        mirror = false,           -- set to true if you want the preview and results to be mirrored
      },
      width = 0.87,               -- width of the Telescope window
      height = 0.80,              -- height of the Telescope window
      preview_cutoff = 120,       -- preview window cutoff if previewer is larger than this value
    },
    sorting_strategy = 'ascending',  -- sorting order: 'ascending' or 'descending'
    prompt_position = 'top',          -- prompt position: 'top' or 'bottom'
    winblend = 0,                     -- transparency of the Telescope window
    border = {},                      -- border configuration for Telescope window
    borderchars = { '─', '│', '─', '│', '╭', '╮', '╯', '╰' }, -- characters used for the borders
    color_devicons = true,            -- whether or not to color devicons
  },
  pickers = {
    -- Default configuration for builtin pickers goes here:
    -- picker_name = {
    --   picker_config_key = value,
    --   ...
    -- }
    find_files = {
      theme = "dropdown",            -- dropdown theme for find_files picker
    },
    live_grep = {
      theme = "ivy",                 -- ivy theme for live_grep picker
    },
  },
  extensions = {
    -- Your extension configuration goes here:
    -- extension_name = {
    --   extension_config_key = value,
    -- }
  }
}

-- Optionally, you can load extensions
-- require('telescope').load_extension('fzf')

require("telescope").load_extension("import")
require("telescope").load_extension("aerial")
require('telescope').load_extension('neoclip')
require("telescope").load_extension("grapple")
require("telescope").load_extension("workspaces")

require("telescope").setup({
  extensions = {
    aerial = {
      -- Display symbols as <root>.<parent>.<symbol>
      show_nesting = {
        ["_"] = false, -- This key will be the default
        json = true, -- You can set the option for specific filetypes
        yaml = true,
      },
    },
  },
})


local actions = require("telescope.actions")
local trouble = require("trouble.providers.telescope")

local telescope = require("telescope")

telescope.setup {
  defaults = {
    mappings = {
      i = { ["<c-t>"] = trouble.open_with_trouble },
      n = { ["<c-t>"] = trouble.open_with_trouble },
    },
  },
}



require("telescope").setup({
  extensions = {
    workspaces = {
      -- keep insert mode after selection in the picker, default is false
      keep_insert = true,
    }
  }
})
require("workspaces").setup({
  hooks = {
    open = "NvimTreeOpen",
  }
})

require("telescope").setup({
  extensions = {
    import = {
      -- Add imports to the top of the file keeping the cursor in place
      insert_at_top = true,
      -- Support additional languages
      custom_languages = {
        {
          -- The regex pattern for the import statement
          regex = [[^(?:import(?:[\"'\s]*([\w*{}\n, ]+)from\s*)?[\"'\s](.*?)[\"'\s].*)]],
          -- The Vim filetypes
          filetypes = { "typescript", "typescriptreact", "javascript", "react" },
          -- The filetypes that ripgrep supports (find these via `rg --type-list`)
          extensions = { "js", "ts" },
        },
      },
    },
  },
})
require("telescope").setup({
    extensions = {
        package_info = {
            -- Optional theme (the extension doesn't set a default theme)
            theme = "ivy",
        },
    },
})

require("telescope").load_extension("package_info")
require('package-info').show()
require("telescope").load_extension("lazygit")

--peoplecalender
 require("apeoplescalendar").setup()
  end
}
