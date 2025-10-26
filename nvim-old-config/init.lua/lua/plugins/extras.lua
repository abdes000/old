return {
 'akinsho/toggleterm.nvim',
 'kevinhwang91/nvim-bqf',
'nvim-lua/plenary.nvim',
'antoinemadec/FixCursorHold.nvim',
'nvim-treesitter/nvim-treesitter',
'nvim-neotest/nvim-nio',
'nvim-neotest/neotest',
 'edluffy/hologram.nvim',
  "potamides/pantran.nvim",
  "AckslD/nvim-neoclip.lua",
  'kkharji/sqlite.lua',
  "tversteeg/registers.nvim",
  "cbochs/grapple.nvim",
  'nvim-pack/nvim-spectre',
  "FabianWirth/search.nvim",
  'stevearc/oil.nvim',
  'nvim-tree/nvim-tree.lua',
  'natecraddock/workspaces.nvim',
 'nvim-orgmode/orgmode',
  'nvimdev/dashboard-nvim',
 'xiyaowong/transparent.nvim',
 'gaborvecsei/cryptoprice.nvim',
 'alanfortlink/blackjack.nvim',
 'rktjmp/playtime.nvim',
 'seandewar/nvimesweeper',
 'alec-gibson/nvim-tetris',
  'jim-fx/sudoku.nvim',
    "kawre/leetcode.nvim",
  "folke/flash.nvim",
  config = function()

--bqf
vim.cmd([[
    hi BqfPreviewBorder guifg=#3e8e2d ctermfg=71
    hi BqfPreviewTitle guifg=#3e8e2d ctermfg=71
    hi BqfPreviewThumb guibg=#3e8e2d ctermbg=71
    hi link BqfPreviewRange Search
]])

require('bqf').setup({
  auto_enable = true,
  auto_resize_height = true, -- highly recommended enable
  preview = {
    win_height = 12,
    win_vheight = 12,
    delay_syntax = 80,
    border = {'┏', '━', '┓', '┃', '┛', '━', '┗', '┃'},
    show_title = false,
    should_preview_cb = function(bufnr, qwinid)
      local ret = true
      local bufname = vim.api.nvim_buf_get_name(bufnr)
      local fsize = vim.fn.getfsize(bufname)
      if fsize > 100 * 1024 then
        -- skip file size greater than 100k
        ret = false
      elseif bufname:match('^fugitive://') then
        -- skip fugitive buffer
        ret = false
      end
      return ret
    end
  },
  -- make `drop` and `tab drop` to become preferred
  func_map = {
    drop = 'o',
    openc = 'O',
    split = '<C-s>',
    tabdrop = '<C-t>',
    -- set to empty string to disable
    tabc = '',
    ptogglemode = 'z,',
  },
  filter = {
    fzf = {
      action_for = {['ctrl-s'] = 'split', ['ctrl-t'] = 'tab drop'},
      extra_opts = {'--bind', 'ctrl-o:toggle-all', '--prompt', '> '}
    }
  }
})





--neotest
require("neotest").setup({
  adapters = {
    require("neotest-python")({
      dap = { justMyCode = false },
    }),
    require("neotest-plenary"),
    require("neotest-vim-test")({
      ignore_file_types = { "python", "vim", "lua" },
    }),
  },
})




--hologram
require('hologram').setup{
  auto_display = true -- WIP automatic markdown image display, may be prone to breaking
}








--translate
local opts = {noremap = true, silent = true, expr = true}
vim.keymap.set("n", "<leader>tr", pantran.motion_translate, opts)
vim.keymap.set("n", "<leader>trr", function() return pantran.motion_translate() .. "_" end, opts)
vim.keymap.set("x", "<leader>tr", pantran.motion_translate, opts)
require("pantran").setup{
  -- Default engine to use for translation. To list valid engine names run
  -- `:lua =vim.tbl_keys(require("pantran.engines"))`.
  default_engine = "argos",
  -- Configuration for individual engines goes here.
  engines = {
    yandex = {
      -- Default languages can be defined on a per engine basis. In this case
      -- `:lua require("pantran.async").run(function()
      -- vim.pretty_print(require("pantran.engines").yandex:languages()) end)`
      -- can be used to list available language identifiers.
      default_source = "auto",
      default_target = "en"
    },
  },
  controls = {
    mappings = {
      edit = {
        n = {
          -- Use this table to add additional mappings for the normal mode in
          -- the translation window. Either strings or function references are
          -- supported.
          ["j"] = "gj",
          ["k"] = "gk"
        },
        i = {
          -- Similar table but for insert mode. Using 'false' disables
          -- existing keybindings.
          ["<C-y>"] = false,
          ["<C-a>"] = require("pantran.ui.actions").yank_close_translation
        }
      },
      -- Keybindings here are used in the selection window.
      select = {
        n = {
        -- ...
        }
      }
    }
  }
}




--neoclip
require('neoclip').setup({
  history = 1000,
  enable_persistent_history = false,
  length_limit = 1048576,
  continuous_sync = false,
  db_path = vim.fn.stdpath("data") .. "/databases/neoclip.sqlite3",
  filter = nil,
  preview = true,
  prompt = nil,
  default_register = '"',
  default_register_macros = 'q',
  enable_macro_history = true,
  content_spec_column = false,
  disable_keycodes_parsing = false,
  on_select = {
    move_to_front = false,
    close_telescope = true,
  },
  on_paste = {
    set_reg = false,
    move_to_front = false,
    close_telescope = true,
  },
  on_replay = {
    set_reg = false,
    move_to_front = false,
    close_telescope = true,
  },
  on_custom_action = {
    close_telescope = true,
  },
  keys = {
    telescope = {
      i = {
        select = '<cr>',
        paste = '<c-p>',
        paste_behind = '<c-k>',
        replay = '<c-q>',  -- replay a macro
        delete = '<c-d>',  -- delete an entry
        edit = '<c-e>',  -- edit an entry
        custom = {},
      },
      n = {
        select = '<cr>',
        paste = 'p',
        --- It is possible to map to more than one key.
        -- paste = { 'p', '<c-p>' },
        paste_behind = 'P',
        replay = 'q',
        delete = 'd',
        edit = 'e',
        custom = {},
      },
    },
    fzf = {
      select = 'default',
      paste = 'ctrl-p',
      paste_behind = 'ctrl-k',
      custom = {},
    },
  },
})
local function is_whitespace(line)
  return vim.fn.match(line, [[^\s*$]]) ~= -1
end

local function all(tbl, check)
  for _, entry in ipairs(tbl) do
    if not check(entry) then
      return false
    end
  end
  return true
end

require('neoclip').setup{
  filter = function(data)
    return not all(data.event.regcontents, is_whitespace)
  end,
}




--registers
local registers = require("registers")
registers.setup({
  -- Show these registers in the order of the string
  show = "*+\"-/_=#%.0123456789abcdefghijklmnopqrstuvwxyz:",
  -- Show a line at the bottom with registers that aren't filled
  show_empty = true,
  -- Expose the :Registers user command
  register_user_command = true,
  -- Always transfer all selected registers to the system clipboard
  system_clipboard = true,
  -- Don't show whitespace at the begin and end of the register's content
  trim_whitespace = true,
  -- Don't show registers which are exclusively filled with whitespace
  hide_only_whitespace = true,
  -- Show a character next to the register name indicating how the register will be applied
  show_register_types = true,
  bind_keys = {
    -- Show the window when pressing " in normal mode, applying the selected register as part of a motion, which is the default behavior of Neovim
    normal    = registers.show_window({ mode = "motion" }),
    -- Show the window when pressing " in visual mode, applying the selected register as part of a motion, which is the default behavior of Neovim
    visual    = registers.show_window({ mode = "motion" }),
    -- Show the window when pressing <C-R> in insert mode, inserting the selected register, which is the default behavior of Neovim
    insert    = registers.show_window({ mode = "insert" }),

    -- When pressing the key of a register, apply it with a very small delay, which will also highlight the selected register
    registers = registers.apply_register({ delay = 0.1 }),
    -- Immediately apply the selected register line when pressing the return key
    ["<CR>"]  = registers.apply_register(),
    -- Close the registers window when pressing the Esc key
    ["<Esc>"] = registers.close_window(),

    -- Move the cursor in the registers window down when pressing <C-n>
    ["<C-n>"] = registers.move_cursor_down(),
    -- Move the cursor in the registers window up when pressing <C-p>
    ["<C-p>"] = registers.move_cursor_up(),
    -- Move the cursor in the registers window down when pressing <C-j>
    ["<C-j>"] = registers.move_cursor_down(),
    -- Move the cursor in the registers window up when pressing <C-k>
    ["<C-k>"] = registers.move_cursor_up(),
    -- Clear the register of the highlighted line when pressing <DeL>
    ["<Del>"] = registers.clear_highlighted_register(),
    -- Clear the register of the highlighted line when pressing <BS>
    ["<BS>"]  = registers.clear_highlighted_register(),
  },
  events = {
    -- When a register line is highlighted, show a preview in the main buffer with how the register will be applied, but only if the register will be inserted or pasted
    on_register_highlighted = registers.preview_highlighted_register({ if_mode = { "insert", "paste" } }),
  },
  symbols = {
    -- Show a special character for line breaks
    newline = "⏎",
    -- Show space characters without changes
    space = " ",
    -- Show a special character for tabs
    tab = "·",
    -- The character to show when a register will be applied in a char-wise fashion
    register_type_charwise = "ᶜ",
    -- The character to show when a register will be applied in a line-wise fashion
    register_type_linewise = "ˡ",
    -- The character to show when a register will be applied in a block-wise fashion
    register_type_blockwise = "ᵇ",
  },
  window = {
    -- The window can't be wider than 100 characters
    max_width = 100,
    -- Show a small highlight in the sign column for the line the cursor is on
    highlight_cursorline = true,
    -- Don't draw a border around the registers window
    border = "none",
    -- Apply a tiny bit of transparency to the the window, letting some characters behind it bleed through
    transparency = 10,
  },
  -- Highlight the sign registers as regular Neovim highlights
  sign_highlights = {
    cursorlinesign = "CursorLine",
    signcolumn = "SignColumn",
    cursorline = "Visual",
    selection = "Constant",
    default = "Function",
    unnamed = "Statement",
    read_only = "Type",
    expression = "Exception",
    black_hole = "Error",
    alternate_buffer = "Operator",
    last_search = "Tag",
    delete = "Special",
    yank = "Delimiter",
    history = "Number",
    named = "Todo",
  },
})


--grapple
-- Lua
vim.keymap.set("n", "<leader>m", require("grapple").toggle)
vim.keymap.set("n", "<leader>M", require("grapple").toggle_tags)
vim.keymap.set("n", "<leader>1", "<cmd>Grapple select index=1<cr>")

--spectre
vim.keymap.set('n', '<leader>S', '<cmd>lua require("spectre").toggle()<CR>', {
  desc = "Toggle Spectre"
})
vim.keymap.set('n', '<leader>sw', '<cmd>lua require("spectre").open_visual({select_word=true})<CR>', {
  desc = "Search current word"
})
vim.keymap.set('v', '<leader>sw', '<esc><cmd>lua require("spectre").open_visual()<CR>', {
  desc = "Search current word"
})
vim.keymap.set('n', '<leader>sp', '<cmd>lua require("spectre").open_file_search({select_word=true})<CR>', {
  desc = "Search on current file"
})



--search
local builtin = require('telescope.builtin')
require("search").setup({
  mappings = { -- optional: configure the mappings for switching tabs (will be set in normal and insert mode(!))
    next = "<Tab>",
    prev = "<S-Tab>"
  },
  append_tabs = { -- append_tabs will add the provided tabs to the default ones
    {
      "Commits", -- or name = "Commits"
      builtin.git_commits, -- or tele_func = require('telescope.builtin').git_commits
      available = function() -- optional
        return vim.fn.isdirectory(".git") == 1
      end
  }
  },
  -- its also possible to overwrite the default tabs using the tabs key instead of append_tabs
  tabs = {
    {
      "Files",
      function(opts)
        opts = opts or {}
        if vim.fn.isdirectory(".git") == 1 then
          builtin.git_files(opts)
        else
          builtin.find_files(opts)
        end
      end
    }
  },
})




--oil
require("oil").setup({
  -- Oil will take over directory buffers (e.g. `vim .` or `:e src/`)
  -- Set to false if you still want to use netrw.
  default_file_explorer = true,
  -- Id is automatically added at the beginning, and name at the end
  -- See :help oil-columns
  columns = {
    "icon",
  -- "permissions",
  -- "size",
  -- "mtime",
  },
  -- Buffer-local options to use for oil buffers
  buf_options = {
    buflisted = false,
    bufhidden = "hide",
  },
  -- Window-local options to use for oil buffers
  win_options = {
    wrap = false,
    signcolumn = "no",
    cursorcolumn = false,
    foldcolumn = "0",
    spell = false,
    list = false,
    conceallevel = 3,
    concealcursor = "nvic",
  },
  -- Send deleted files to the trash instead of permanently deleting them (:help oil-trash)
  delete_to_trash = false,
  -- Skip the confirmation popup for simple operations (:help oil.skip_confirm_for_simple_edits)
  skip_confirm_for_simple_edits = false,
  -- Selecting a new/moved/renamed file or directory will prompt you to save changes first
  -- (:help prompt_save_on_select_new_entry)
  prompt_save_on_select_new_entry = true,
  -- Oil will automatically delete hidden buffers after this delay
  -- You can set the delay to false to disable cleanup entirely
  -- Note that the cleanup process only starts when none of the oil buffers are currently displayed
  cleanup_delay_ms = 2000,
  lsp_file_methods = {
    -- Time to wait for LSP file operations to complete before skipping
    timeout_ms = 1000,
    -- Set to true to autosave buffers that are updated with LSP willRenameFiles
    -- Set to "unmodified" to only save unmodified buffers
    autosave_changes = false,
  },
  -- Constrain the cursor to the editable parts of the oil buffer
  -- Set to `false` to disable, or "name" to keep it on the file names
  constrain_cursor = "editable",
  -- Set to true to watch the filesystem for changes and reload oil
  experimental_watch_for_changes = false,
  -- Keymaps in oil buffer. Can be any value that `vim.keymap.set` accepts OR a table of keymap
  -- options with a `callback` (e.g. { callback = function() ... end, desc = "", mode = "n" })
  -- Additionally, if it is a string that matches "actions.<name>",
  -- it will use the mapping at require("oil.actions").<name>
  -- Set to `false` to remove a keymap
  -- See :help oil-actions for a list of all available actions
  keymaps = {
    ["g?"] = "actions.show_help",
    ["<CR>"] = "actions.select",
    ["<C-s>"] = "actions.select_vsplit",
    ["<C-h>"] = "actions.select_split",
    ["<C-t>"] = "actions.select_tab",
    ["<C-p>"] = "actions.preview",
    ["<C-c>"] = "actions.close",
    ["<C-l>"] = "actions.refresh",
    ["-"] = "actions.parent",
    ["_"] = "actions.open_cwd",
    ["`"] = "actions.cd",
    ["~"] = "actions.tcd",
    ["gs"] = "actions.change_sort",
    ["gx"] = "actions.open_external",
    ["g."] = "actions.toggle_hidden",
    ["g\\"] = "actions.toggle_trash",
  },
  -- Set to false to disable all of the above keymaps
  use_default_keymaps = true,
  view_options = {
    -- Show files and directories that start with "."
    show_hidden = false,
    -- This function defines what is considered a "hidden" file
    is_hidden_file = function(name, bufnr)
      return vim.startswith(name, ".")
    end,
    -- This function defines what will never be shown, even when `show_hidden` is set
    is_always_hidden = function(name, bufnr)
      return false
    end,
    -- Sort file names in a more intuitive order for humans. Is less performant,
    -- so you may want to set to false if you work with large directories.
    natural_order = true,
    sort = {
      -- sort order can be "asc" or "desc"
      -- see :help oil-columns to see which columns are sortable
      { "type", "asc" },
      { "name", "asc" },
    },
  },
  -- Extra arguments to pass to SCP when moving/copying files over SSH
  extra_scp_args = {},
  -- EXPERIMENTAL support for performing file operations with git
  git = {
    -- Return true to automatically git add/mv/rm files
    add = function(path)
      return false
    end,
    mv = function(src_path, dest_path)
      return false
    end,
    rm = function(path)
      return false
    end,
  },
  -- Configuration for the floating window in oil.open_float
  float = {
    -- Padding around the floating window
    padding = 2,
    max_width = 0,
    max_height = 0,
    border = "rounded",
    win_options = {
      winblend = 0,
    },
    -- This is the config that will be passed to nvim_open_win.
    -- Change values here to customize the layout
    override = function(conf)
      return conf
    end,
  },
  -- Configuration for the actions floating preview window
  preview = {
    -- Width dimensions can be integers or a float between 0 and 1 (e.g. 0.4 for 40%)
    -- min_width and max_width can be a single value or a list of mixed integer/float types.
    -- max_width = {100, 0.8} means "the lesser of 100 columns or 80% of total"
    max_width = 0.9,
    -- min_width = {40, 0.4} means "the greater of 40 columns or 40% of total"
    min_width = { 40, 0.4 },
    -- optionally define an integer/float for the exact width of the preview window
    width = nil,
    -- Height dimensions can be integers or a float between 0 and 1 (e.g. 0.4 for 40%)
    -- min_height and max_height can be a single value or a list of mixed integer/float types.
    -- max_height = {80, 0.9} means "the lesser of 80 columns or 90% of total"
    max_height = 0.9,
    -- min_height = {5, 0.1} means "the greater of 5 columns or 10% of total"
    min_height = { 5, 0.1 },
    -- optionally define an integer/float for the exact height of the preview window
    height = nil,
    border = "rounded",
    win_options = {
      winblend = 0,
    },
    -- Whether the preview window is automatically updated when the cursor is moved
    update_on_cursor_moved = true,
  },
  -- Configuration for the floating progress window
  progress = {
    max_width = 0.9,
    min_width = { 40, 0.4 },
    width = nil,
    max_height = { 10, 0.9 },
    min_height = { 5, 0.1 },
    height = nil,
    border = "rounded",
    minimized_border = "none",
    win_options = {
      winblend = 0,
    },
  },
  -- Configuration for the floating SSH window
  ssh = {
    border = "rounded",
  },
  -- Configuration for the floating keymaps help window
  keymaps_help = {
    border = "rounded",
  },
})



--nvim-tree
-- disable netrw at the very start of your init.lua
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- optionally enable 24-bit colour
vim.opt.termguicolors = true

-- empty setup using defaults
require("nvim-tree").setup()

-- OR setup with some options
require("nvim-tree").setup({
  sort = {
    sorter = "case_sensitive",
  },
  view = {
    width = 30,
  },
  renderer = {
    group_empty = true,
  },
  filters = {
    dotfiles = true,
  },
})
vim.cmd([[
    :hi      NvimTreeExecFile    guifg=#ffa0a0
    :hi      NvimTreeSpecialFile guifg=#ff80ff gui=underline
    :hi      NvimTreeSymlink     guifg=Yellow  gui=italic
    :hi link NvimTreeImageFile   Title
]])



--workspaces
require("workspaces").setup({
  -- path to a file to store workspaces data in
  -- on a unix system this would be ~/.local/share/nvim/workspaces
  path = vim.fn.stdpath("data") .. "/workspaces",

  -- to change directory for nvim (:cd), or only for window (:lcd)
  -- deprecated, use cd_type instead
  -- global_cd = true,

  -- controls how the directory is changed. valid options are "global", "local", and "tab"
  --   "global" changes directory for the neovim process. same as the :cd command
  --   "local" changes directory for the current window. same as the :lcd command
  --   "tab" changes directory for the current tab. same as the :tcd command
  --
  -- if set, overrides the value of global_cd
  cd_type = "global",

  -- sort the list of workspaces by name after loading from the workspaces path.
  sort = true,

  -- sort by recent use rather than by name. requires sort to be true
  mru_sort = true,

  -- option to automatically activate workspace when opening neovim in a workspace directory
  auto_open = false,

  -- enable info-level notifications after adding or removing a workspace
  notify_info = true,

  -- lists of hooks to run after specific actions
  -- hooks can be a lua function or a vim command (string)
  -- lua hooks take a name, a path, and an optional state table
  -- if only one hook is needed, the list may be omitted
  hooks = {
    add = {},
    remove = {},
    rename = {},
    open_pre = {},
    open = {},
  },
})


--orgmode
-- init.lua

require('orgmode').setup({
  org_agenda_files = {'~/Dropbox/org/*', '~/my-orgs/**/*'},
  org_default_notes_file = '~/Dropbox/org/refile.org',
})
require('cmp').setup({
  sources = {
    { name = 'orgmode' }
  }
})




--dashboard
local db = require("dashbard")
db.setup({
  theme = '',
  config = {
    header = {}, --your header
    center = {
      {
        icon = ' ',
        icon_hl = 'Title',
        desc = 'Find File           ',
        desc_hl = 'String',
        key = 'b',
        keymap = 'SPC f f',
        key_hl = 'Number',
        key_format = ' %s', -- remove default surrounding `[]`
        action = 'lua print(2)'
      },
      {
        icon = ' ',
        desc = 'Find Dotfiles',
        key = 'f',
        keymap = 'SPC f d',
        key_format = ' %s', -- remove default surrounding `[]`
        action = 'lua print(3)'
      },
    },
    footer = {}  --your footer
  }
})




--transparent
vim.cmd([[
:TransparentEnable
]])
require("transparent").setup({ -- Optional, you don't have to run setup.
  groups = { -- table: default groups
    'Normal', 'NormalNC', 'Comment', 'Constant', 'Special', 'Identifier',
    'Statement', 'PreProc', 'Type', 'Underlined', 'Todo', 'String', 'Function',
    'Conditional', 'Repeat', 'Operator', 'Structure', 'LineNr', 'NonText',
    'SignColumn', 'CursorLine', 'CursorLineNr', 'StatusLine', 'StatusLineNC',
    'EndOfBuffer',
  },
  extra_groups = {}, -- table: additional groups that should be cleared
  exclude_groups = {}, -- table: groups you don't want to clear
})
require('transparent').clear_prefix('lualine')



--crypto
vim.g.cryptoprice_base_currency = "usd"
vim.g.cryptoprice_crypto_list = {"bitcoin", "ethereum"} 
vim.g.cryptoprice_window_width = 60
vim.g.cryptoprice_window_height = 10
require("cryptoprice").setup{
    base_currency="usd",
    crypto_list={"bitcoin", "ethereum"},
    window_height=10,
    window_width=60
}
vim.api.nvim_set_keymap('n', '<leader>cy', '<cmd>lua require("cryptoprice").toggle()<CR>', { noremap = true, silent = true })


--toggleterm
-- Add this to your init.lua or a separate keymap file
vim.api.nvim_set_keymap('n', '`', '<cmd>ToggleTerm<CR>', { noremap = true, silent = true })





--games
require("blackjack").setup({
  card_style = "mini", -- Can be "mini" or "large".
  suit_style = "black", -- Can be "black" or "white".
  scores_path = "/home/foo/blackjack_scores.json", -- Default location to store the scores.json file.
  keybindings = {
    ["next"] = "j",
    ["finish"] = "k",
    ["quit"] = "q",
  },
})
-- These are the defaults for the settings
require("sudoku").setup({
  persist_settings = true, -- safe the settings under vim.fn.stdpath("data"), usually ~/.local/share/nvim,
  persist_games = true, -- persist a history of all played games
  default_mappings = true, -- if set to false you need to set your own, like the following:
  mappings = {
      { key = "x",     action = "clear_cell" },
      { key = "r1",    action = "insert=1" },
      { key = "r2",    action = "insert=2" },
      { key = "r3",    action = "insert=3" },
      -- ...
      { key = "r9",    action = "insert=9" },
      { key = "gn",    action = "new_game" },
      { key = "gr",    action = "reset_game" },
      { key = "gs",    action = "view=settings" },
      { key = "gt",    action = "view=tip" },
      { key = "gz",    action = "view=zen" },
      { key = "gh",    action = "view=help" },
      { key = "u",     action = "undo" },
      { key = "<C-r>", action = "redo" },
      { key = "+",     action = "increment" },
      { key = "-",     action = "decrement" },
  },
  custom_highlights = {
      board = { fg = "#7d7d7d" },
      number = { fg = "white", bg = "black" },
      active_menu = { fg = "white", bg = "black", gui = "bold" },
      hint_cell = { fg = "white", bg = "yellow" },
      square = { bg = "#292b35", fg = "white" },
      column = { bg = "#14151a", fg = "#d5d5d5" },
      row = { bg = "#14151a", fg = "#d5d5d5" },
      settings_disabled = { fg = "#8e8e8e", gui = "italic" },
      same_number = { fg = "white", gui = "bold" },
      set_number = { fg = "white", gui = "italic" },
      error = { fg = "white", bg = "#843434" },
  }
})



--leetcode
require("leetcode").setup({
    ---@type string
    arg = "leetcode.nvim",

    ---@type lc.lang
    lang = "cpp",

    cn = { -- leetcode.cn
        enabled = false, ---@type boolean
        translator = true, ---@type boolean
        translate_problems = true, ---@type boolean
    },

    ---@type lc.storage
    storage = {
        home = vim.fn.stdpath("data") .. "/leetcode",
        cache = vim.fn.stdpath("cache") .. "/leetcode",
    },

    ---@type table<string, boolean>
    plugins = {
        non_standalone = false,
    },

    ---@type boolean
    logging = true,

    injector = {}, ---@type table<lc.lang, lc.inject>

    cache = {
        update_interval = 60 * 60 * 24 * 7, ---@type integer 7 days
    },

    console = {
        open_on_runcode = true, ---@type boolean

        dir = "row", ---@type lc.direction

        size = { ---@type lc.size
            width = "90%",
            height = "75%",
        },

        result = {
            size = "60%", ---@type lc.size
        },

        testcase = {
            virt_text = true, ---@type boolean

            size = "40%", ---@type lc.size
        },
    },

    description = {
        position = "left", ---@type lc.position

        width = "40%", ---@type lc.size

        show_stats = true, ---@type boolean
    },

    hooks = {
        ---@type fun()[]
        ["enter"] = {},

        ---@type fun(question: lc.ui.Question)[]
        ["question_enter"] = {},

        ---@type fun()[]
        ["leave"] = {},
    },

    keys = {
        toggle = { "q" }, ---@type string|string[]
        confirm = { "<CR>" }, ---@type string|string[]

        reset_testcases = "r", ---@type string
        use_testcase = "U", ---@type string
        focus_testcases = "H", ---@type string
        focus_result = "L", ---@type string
    },

    ---@type lc.highlights
    theme = {},

    ---@type boolean
    image_support = false,
})




--flash 
require("flash").setup({
  -- labels = "abcdefghijklmnopqrstuvwxyz",
  labels = "asdfghjklqwertyuiopzxcvbnm",
  search = {
    -- search/jump in all windows
    multi_window = true,
    -- search direction
    forward = true,
    -- when `false`, find only matches in the given direction
    wrap = true,
    ---@type Flash.Pattern.Mode
    -- Each mode will take ignorecase and smartcase into account.
    -- * exact: exact match
    -- * search: regular search
    -- * fuzzy: fuzzy search
    -- * fun(str): custom function that returns a pattern
    --   For example, to only match at the beginning of a word:
    --   mode = function(str)
    --     return "\\<" .. str
    --   end,
    mode = "exact",
    -- behave like `incsearch`
    incremental = false,
    -- Excluded filetypes and custom window filters
    ---@type (string|fun(win:window))[]
    exclude = {
      "notify",
      "cmp_menu",
      "noice",
      "flash_prompt",
      function(win)
        -- exclude non-focusable windows
        return not vim.api.nvim_win_get_config(win).focusable
      end,
    },
    -- Optional trigger character that needs to be typed before
    -- a jump label can be used. It's NOT recommended to set this,
    -- unless you know what you're doing
    trigger = "",
    -- max pattern length. If the pattern length is equal to this
    -- labels will no longer be skipped. When it exceeds this length
    -- it will either end in a jump or terminate the search
    max_length = false, ---@type number|false
  },
  jump = {
    -- save location in the jumplist
    jumplist = true,
    -- jump position
    pos = "start", ---@type "start" | "end" | "range"
    -- add pattern to search history
    history = false,
    -- add pattern to search register
    register = false,
    -- clear highlight after jump
    nohlsearch = false,
    -- automatically jump when there is only one match
    autojump = false,
    -- You can force inclusive/exclusive jumps by setting the
    -- `inclusive` option. By default it will be automatically
    -- set based on the mode.
    inclusive = nil, ---@type boolean?
    -- jump position offset. Not used for range jumps.
    -- 0: default
    -- 1: when pos == "end" and pos < current position
    offset = nil, ---@type number
  },
  label = {
    -- allow uppercase labels
    uppercase = true,
    -- add any labels with the correct case here, that you want to exclude
    exclude = "",
    -- add a label for the first match in the current window.
    -- you can always jump to the first match with `<CR>`
    current = true,
    -- show the label after the match
    after = true, ---@type boolean|number[]
    -- show the label before the match
    before = false, ---@type boolean|number[]
    -- position of the label extmark
    style = "overlay", ---@type "eol" | "overlay" | "right_align" | "inline"
    -- flash tries to re-use labels that were already assigned to a position,
    -- when typing more characters. By default only lower-case labels are re-used.
    reuse = "lowercase", ---@type "lowercase" | "all" | "none"
    -- for the current window, label targets closer to the cursor first
    distance = true,
    -- minimum pattern length to show labels
    -- Ignored for custom labelers.
    min_pattern_length = 0,
    -- Enable this to use rainbow colors to highlight labels
    -- Can be useful for visualizing Treesitter ranges.
    rainbow = {
      enabled = false,
      -- number between 1 and 9
      shade = 5,
    },
    -- With `format`, you can change how the label is rendered.
    -- Should return a list of `[text, highlight]` tuples.
    ---@class Flash.Format
    ---@field state Flash.State
    ---@field match Flash.Match
    ---@field hl_group string
    ---@field after boolean
    ---@type fun(opts:Flash.Format): string[][]
    format = function(opts)
      return { { opts.match.label, opts.hl_group } }
    end,
  },
  highlight = {
    -- show a backdrop with hl FlashBackdrop
    backdrop = true,
    -- Highlight the search matches
    matches = true,
    -- extmark priority
    priority = 5000,
    groups = {
      match = "FlashMatch",
      current = "FlashCurrent",
      backdrop = "FlashBackdrop",
      label = "FlashLabel",
    },
  },
  -- action to perform when picking a label.
  -- defaults to the jumping logic depending on the mode.
  ---@type fun(match:Flash.Match, state:Flash.State)|nil
  action = nil,
  -- initial pattern to use when opening flash
  pattern = "",
  -- When `true`, flash will try to continue the last search
  continue = false,
  -- Set config to a function to dynamically change the config
  config = nil, ---@type fun(opts:Flash.Config)|nil
  -- You can override the default options for a specific mode.
  -- Use it with `require("flash").jump({mode = "forward"})`
  ---@type table<string, Flash.Config>
  modes = {
    -- options used when flash is activated through
    -- a regular search with `/` or `?`
    search = {
      -- when `true`, flash will be activated during regular search by default.
      -- You can always toggle when searching with `require("flash").toggle()`
      enabled = false,
      highlight = { backdrop = false },
      jump = { history = true, register = true, nohlsearch = true },
      search = {
        -- `forward` will be automatically set to the search direction
        -- `mode` is always set to `search`
        -- `incremental` is set to `true` when `incsearch` is enabled
      },
    },
    -- options used when flash is activated through
    -- `f`, `F`, `t`, `T`, `;` and `,` motions
    char = {
      enabled = true,
      -- dynamic configuration for ftFT motions
      config = function(opts)
        -- autohide flash when in operator-pending mode
        opts.autohide = opts.autohide or (vim.fn.mode(true):find("no") and vim.v.operator == "y")

        -- disable jump labels when not enabled, when using a count,
        -- or when recording/executing registers
        opts.jump_labels = opts.jump_labels
          and vim.v.count == 0
          and vim.fn.reg_executing() == ""
          and vim.fn.reg_recording() == ""

        -- Show jump labels only in operator-pending mode
        -- opts.jump_labels = vim.v.count == 0 and vim.fn.mode(true):find("o")
      end,
      -- hide after jump when not using jump labels
      autohide = false,
      -- show jump labels
      jump_labels = false,
      -- set to `false` to use the current line only
      multi_line = true,
      -- When using jump labels, don't use these keys
      -- This allows using those keys directly after the motion
      label = { exclude = "hjkliardc" },
      -- by default all keymaps are enabled, but you can disable some of them,
      -- by removing them from the list.
      -- If you rather use another key, you can map them
      -- to something else, e.g., { [";"] = "L", [","] = H }
      keys = { "f", "F", "t", "T", ";", "," },
      ---@alias Flash.CharActions table<string, "next" | "prev" | "right" | "left">
      -- The direction for `prev` and `next` is determined by the motion.
      -- `left` and `right` are always left and right.
      char_actions = function(motion)
        return {
          [";"] = "next", -- set to `right` to always go right
          [","] = "prev", -- set to `left` to always go left
          -- clever-f style
          [motion:lower()] = "next",
          [motion:upper()] = "prev",
          -- jump2d style: same case goes next, opposite case goes prev
          -- [motion] = "next",
          -- [motion:match("%l") and motion:upper() or motion:lower()] = "prev",
        }
      end,
      search = { wrap = false },
      highlight = { backdrop = true },
      jump = { register = false },
    },
    -- options used for treesitter selections
    -- `require("flash").treesitter()`
    treesitter = {
      labels = "abcdefghijklmnopqrstuvwxyz",
      jump = { pos = "range" },
      search = { incremental = false },
      label = { before = true, after = true, style = "inline" },
      highlight = {
        backdrop = false,
        matches = false,
      },
    },
    treesitter_search = {
      jump = { pos = "range" },
      search = { multi_window = true, wrap = true, incremental = false },
      remote_op = { restore = true },
      label = { before = true, after = true, style = "inline" },
    },
    -- options used for remote flash
    remote = {
      remote_op = { restore = true, motion = true },
    },
  },
  -- options for the floating window that shows the prompt,
  -- for regular jumps
  prompt = {
    enabled = true,
    prefix = { { "⚡", "FlashPromptIcon" } },
    win_config = {
      relative = "editor",
      width = 1, -- when <=1 it's a percentage of the editor width
      height = 1,
      row = -1, -- when negative it's an offset from the bottom
      col = 0, -- when negative it's an offset from the right
      zindex = 1000,
    },
  },
  -- options for remote operator pending mode
  remote_op = {
    -- restore window views and cursor position
    -- after doing a remote operation
    restore = false,
    -- For `jump.pos = "range"`, this setting is ignored.
    -- `true`: always enter a new motion when doing a remote operation
    -- `false`: use the window's cursor position and jump target
    -- `nil`: act as `true` for remote windows, `false` for the current window
    motion = false,
  },
})

      local function flash(prompt_bufnr)
        require("flash").jump({
          pattern = "^",
          label = { after = { 0, 0 } },
          search = {
            mode = "search",
            exclude = {
              function(win)
                return vim.bo[vim.api.nvim_win_get_buf(win)].filetype ~= "TelescopeResults"
              end,
            },
          },
          action = function(match)
            local picker = require("telescope.actions.state").get_current_picker(prompt_bufnr)
            picker:set_selection(match.pos[1] - 1)
          end,
        })
      end
      opts.defaults = vim.tbl_deep_extend("force", opts.defaults or {}, {
        mappings = {
          n = { s = flash },
          i = { ["<c-s>"] = flash },
        },
      })
  end
}




