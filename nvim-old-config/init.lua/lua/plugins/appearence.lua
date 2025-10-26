return {
  'NvChad/nvim-colorizer.lua',
  'ziontee113/color-picker.nvim',
  "utilyre/barbecue.nvim",
  'Bekaboo/dropbar.nvim',
  "SmiteshP/nvim-navic",
  'nvim-lualine/lualine.nvim',
  'b0o/incline.nvim',
 'lewis6991/gitsigns.nvim', -- OPTIONAL: for git status
  'romgrk/barbar.nvim',
 'RRethy/vim-illuminate',
   'nvim-tree/nvim-web-devicons', 
 'yaocccc/nvim-foldsign',
   'declancm/cinnamon.nvim',
 'vidocqh/auto-indent.nvim',
  "lukas-reineke/indent-blankline.nvim",
  'nvim-focus/focus.nvim',
   'otavioschwanck/tmux-awesome-manager.nvim',
 "CWood-sdf/pineapple",
 'Mofiqul/vscode.nvim',
  "tjdevries/colorbuddy.nvim",
  config = function()

    --colorizer
    require("colorizer").setup {
      filetypes = { "*" },
      user_default_options = {
        RGB = true, -- #RGB hex codes
        RRGGBB = true, -- #RRGGBB hex codes
        names = true, -- "Name" codes like Blue or blue
        RRGGBBAA = false, -- #RRGGBBAA hex codes
        AARRGGBB = false, -- 0xAARRGGBB hex codes
        rgb_fn = false, -- CSS rgb() and rgba() functions
        hsl_fn = false, -- CSS hsl() and hsla() functions
        css = false, -- Enable all CSS features: rgb_fn, hsl_fn, names, RGB, RRGGBB
        css_fn = false, -- Enable all CSS *functions*: rgb_fn, hsl_fn
        -- Available modes for `mode`: foreground, background,  virtualtext
        mode = "background", -- Set the display mode.
        -- Available methods are false / true / "normal" / "lsp" / "both"
        -- True is same as normal
        tailwind = false, -- Enable tailwind colors
        -- parsers can contain values used in |user_default_options|
        sass = { enable = false, parsers = { "css" }, }, -- Enable sass colors
        virtualtext = "■",
        -- update color values even if buffer is not focused
        -- example use: cmp_menu, cmp_docs
        always_update = false
      },
      -- all the sub-options of filetypes apply to buftypes
      buftypes = {},
    }
    -- Alwyas update the color values in cmp_docs even if it not focused
    require("colorizer").setup({
      filetypes = {
        '*'; -- Highlight all files, but customize some others.
        cmp_docs = {always_update = true}
      },
    })




    --color-picker
    local opts = { noremap = true, silent = true }

    vim.keymap.set("n", "<C-c>", "<cmd>PickColor<cr>", opts)
    vim.keymap.set("i", "<C-c>", "<cmd>PickColorInsert<cr>", opts)

    -- vim.keymap.set("n", "your_keymap", "<cmd>ConvertHEXandRGB<cr>", opts)
    -- vim.keymap.set("n", "your_keymap", "<cmd>ConvertHEXandHSL<cr>", opts)

    require("color-picker").setup({ -- for changing icons & mappings
      -- ["icons"] = { "ﱢ", "" },
      -- ["icons"] = { "ﮊ", "" },
      -- ["icons"] = { "", "ﰕ" },
      -- ["icons"] = { "", "" },
      -- ["icons"] = { "", "" },
      ["icons"] = { "ﱢ", "" },
      ["border"] = "rounded", -- none | single | double | rounded | solid | shadow
      ["keymap"] = { -- mapping example:
        ["U"] = "<Plug>ColorPickerSlider5Decrease",
        ["O"] = "<Plug>ColorPickerSlider5Increase",
      },
      ["background_highlight_group"] = "Normal", -- default
      ["border_highlight_group"] = "FloatBorder", -- default
      ["text_highlight_group"] = "Normal", --default
    })

    vim.cmd([[hi FloatBorder guibg=NONE]]) -- if you don't want weird border background colors around the popup.








    --barbecue,dropbar,nvim-navic
    -- triggers CursorHold event faster
    vim.opt.updatetime = 200

    require("barbecue").setup({
      create_autocmd = false, -- prevent barbecue from updating itself automatically
    })

    vim.api.nvim_create_autocmd({
      "WinScrolled", -- or WinResized on NVIM-v0.9 and higher
      "BufWinEnter",
      "CursorHold",
      "InsertLeave",

      -- include this if you have set `show_modified` to `true`
      "BufModifiedSet",
    }, {
      group = vim.api.nvim_create_augroup("barbecue.updater", {}),
      callback = function()
        require("barbecue.ui").update()
      end,
    })

    require("barbecue").setup({
      theme = {
        -- this highlight is used to override other highlights
        -- you can take advantage of its `bg` and set a background throughout your winbar
        -- (e.g. basename will look like this: { fg = "#c0caf5", bold = true })
        normal = { fg = "#c0caf5" },

        -- these highlights correspond to symbols table from config
        ellipsis = { fg = "#737aa2" },
        separator = { fg = "#737aa2" },
        modified = { fg = "#737aa2" },

        -- these highlights represent the _text_ of three main parts of barbecue
        dirname = { fg = "#737aa2" },
        basename = { bold = true },
        context = {},

        -- these highlights are used for context/navic icons
        context_file = { fg = "#ac8fe4" },
        context_module = { fg = "#ac8fe4" },
        context_namespace = { fg = "#ac8fe4" },
        context_package = { fg = "#ac8fe4" },
        context_class = { fg = "#ac8fe4" },
        context_method = { fg = "#ac8fe4" },
        context_property = { fg = "#ac8fe4" },
        context_field = { fg = "#ac8fe4" },
        context_constructor = { fg = "#ac8fe4" },
        context_enum = { fg = "#ac8fe4" },
        context_interface = { fg = "#ac8fe4" },
        context_function = { fg = "#ac8fe4" },
        context_variable = { fg = "#ac8fe4" },
        context_constant = { fg = "#ac8fe4" },
        context_string = { fg = "#ac8fe4" },
        context_number = { fg = "#ac8fe4" },
        context_boolean = { fg = "#ac8fe4" },
        context_array = { fg = "#ac8fe4" },
        context_object = { fg = "#ac8fe4" },
        context_key = { fg = "#ac8fe4" },
        context_null = { fg = "#ac8fe4" },
        context_enum_member = { fg = "#ac8fe4" },
        context_struct = { fg = "#ac8fe4" },
        context_event = { fg = "#ac8fe4" },
        context_operator = { fg = "#ac8fe4" },
        context_type_parameter = { fg = "#ac8fe4" },
      },
    })

    require("barbecue").setup({
      ---Whether to attach navic to language servers automatically.
      ---
      ---@type boolean
      attach_navic = true,

      ---Whether to create winbar updater autocmd.
      ---
      ---@type boolean
      create_autocmd = true,

      ---Buftypes to enable winbar in.
      ---
      ---@type string[]
      include_buftypes = { "" },

      ---Filetypes not to enable winbar in.
      ---
      ---@type string[]
      exclude_filetypes = { "netrw", "toggleterm" },

      modifiers = {
        ---Filename modifiers applied to dirname.
        ---
        ---See: `:help filename-modifiers`
        ---
        ---@type string
        dirname = ":~:.",

        ---Filename modifiers applied to basename.
        ---
        ---See: `:help filename-modifiers`
        ---
        ---@type string
        basename = "",
      },

      ---Whether to display path to file.
      ---
      ---@type boolean
      show_dirname = true,

      ---Whether to display file name.
      ---
      ---@type boolean
      show_basename = true,

      ---Whether to replace file icon with the modified symbol when buffer is
      ---modified.
      ---
      ---@type boolean
      show_modified = false,

      ---Get modified status of file.
      ---
      ---NOTE: This can be used to get file modified status from SCM (e.g. git)
      ---
      ---@type fun(bufnr: number): boolean
      modified = function(bufnr) return vim.bo[bufnr].modified end,

      ---Whether to show/use navic in the winbar.
      ---
      ---@type boolean
      show_navic = true,

      ---Get leading custom section contents.
      ---
      ---NOTE: This function shouldn't do any expensive actions as it is run on each
      ---render.
      ---
      ---@type fun(bufnr: number, winnr: number): barbecue.Config.custom_section
      lead_custom_section = function() return " " end,

      ---@alias barbecue.Config.custom_section
      ---|string # Literal string.
      ---|{ [1]: string, [2]: string? }[] # List-like table of `[text, highlight?]` tuples in which `highlight` is optional.
      ---
      ---Get custom section contents.
      ---
      ---NOTE: This function shouldn't do any expensive actions as it is run on each
      ---render.
      ---
      ---@type fun(bufnr: number, winnr: number): barbecue.Config.custom_section
      custom_section = function() return " " end,

      ---@alias barbecue.Config.theme
      ---|'"auto"' # Use your current colorscheme's theme or generate a theme based on it.
      ---|string # Theme located under `barbecue.theme` module.
      ---|barbecue.Theme # Same as '"auto"' but override it with the given table.
      ---
      ---Theme to be used for generating highlight groups dynamically.
      ---
      ---@type barbecue.Config.theme
      theme = "auto",

      ---Whether context text should follow its icon's color.
      ---
      ---@type boolean
      context_follow_icon_color = false,

      symbols = {
        ---Modification indicator.
        ---
        ---@type string
        modified = "●",

        ---Truncation indicator.
        ---
        ---@type string
        ellipsis = "…",

        ---Entry separator.
        ---
        ---@type string
        separator = "",
      },

      ---@alias barbecue.Config.kinds
      ---|false # Disable kind icons.
      ---|table<string, string> # Type to icon mapping.
      ---
      ---Icons for different context entry kinds.
      ---
      ---@type barbecue.Config.kinds
      kinds = {
        File = "",
        Module = "",
        Namespace = "",
        Package = "",
        Class = "",
        Method = "",
        Property = "",
        Field = "",
        Constructor = "",
        Enum = "",
        Interface = "",
        Function = "",
        Variable = "",
        Constant = "",
        String = "",
        Number = "",
        Boolean = "",
        Array = "",
        Object = "",
        Key = "",
        Null = "",
        EnumMember = "",
        Struct = "",
        Event = "",
        Operator = "",
        TypeParameter = "",
      },
    })
    local M = require("dropbar")
    ---@class dropbar_configs_t
    M.opts = {
      general = {
        ---@type boolean|fun(buf: integer, win: integer, info: table?): boolean
        enable = function(buf, win, _)
          return vim.fn.win_gettype(win) == ''
            and vim.wo[win].winbar == ''
            and vim.bo[buf].bt == ''
            and (
            vim.bo[buf].ft == 'markdown'
            or (
            buf
            and vim.api.nvim_buf_is_valid(buf)
            and (pcall(vim.treesitter.get_parser, buf, vim.bo[buf].ft))
            and true
            or false
            )
            )
        end,
        attach_events = {
          'OptionSet',
          'BufWinEnter',
          'BufWritePost',
        },
        -- Wait for a short time before updating the winbar, if another update
        -- request is received within this time, the previous request will be
        -- cancelled, this improves the performance when the user is holding
        -- down a key (e.g. 'j') to scroll the window, default to 0 ms
        -- If you encounter performance issues when scrolling the window, try
        -- setting this option to a number slightly larger than
        -- 1000 / key_repeat_rate
        update_interval = 0,
        update_events = {
          win = {
            'CursorMoved',
            'CursorMovedI',
            'WinEnter',
            'WinResized',
          },
          buf = {
            'BufModifiedSet',
            'FileChangedShellPost',
            'TextChanged',
            'TextChangedI',
          },
          global = {
            'DirChanged',
            'VimResized',
          },
        },
      },
      icons = {
        enable = true,
        kinds = {
          use_devicons = true,
          symbols = {
            Array = '󰅪 ',
            Boolean = ' ',
            BreakStatement = '󰙧 ',
            Call = '󰃷 ',
            CaseStatement = '󱃙 ',
            Class = ' ',
            Color = '󰏘 ',
            Constant = '󰏿 ',
            Constructor = ' ',
            ContinueStatement = '→ ',
            Copilot = ' ',
            Declaration = '󰙠 ',
            Delete = '󰩺 ',
            DoStatement = '󰑖 ',
            Enum = ' ',
            EnumMember = ' ',
            Event = ' ',
            Field = ' ',
            File = '󰈔 ',
            Folder = '󰉋 ',
            ForStatement = '󰑖 ',
            Function = '󰊕 ',
            H1Marker = '󰉫 ', -- Used by markdown treesitter parser
            H2Marker = '󰉬 ',
            H3Marker = '󰉭 ',
            H4Marker = '󰉮 ',
            H5Marker = '󰉯 ',
            H6Marker = '󰉰 ',
            Identifier = '󰀫 ',
            IfStatement = '󰇉 ',
            Interface = ' ',
            Keyword = '󰌋 ',
            List = '󰅪 ',
            Log = '󰦪 ',
            Lsp = ' ',
            Macro = '󰁌 ',
            MarkdownH1 = '󰉫 ', -- Used by builtin markdown source
            MarkdownH2 = '󰉬 ',
            MarkdownH3 = '󰉭 ',
            MarkdownH4 = '󰉮 ',
            MarkdownH5 = '󰉯 ',
            MarkdownH6 = '󰉰 ',
            Method = '󰆧 ',
            Module = '󰏗 ',
            Namespace = '󰅩 ',
            Null = '󰢤 ',
            Number = '󰎠 ',
            Object = '󰅩 ',
            Operator = '󰆕 ',
            Package = '󰆦 ',
            Pair = '󰅪 ',
            Property = ' ',
            Reference = '󰦾 ',
            Regex = ' ',
            Repeat = '󰑖 ',
            Scope = '󰅩 ',
            Snippet = '󰩫 ',
            Specifier = '󰦪 ',
            Statement = '󰅩 ',
            String = '󰉾 ',
            Struct = ' ',
            SwitchStatement = '󰺟 ',
            Terminal = ' ',
            Text = ' ',
            Type = ' ',
            TypeParameter = '󰆩 ',
            Unit = ' ',
            Value = '󰎠 ',
            Variable = '󰀫 ',
            WhileStatement = '󰑖 ',
          },
        },
        ui = {
          bar = {
            separator = ' ',
            extends = '…',
          },
          menu = {
            separator = ' ',
            indicator = ' ',
          },
        },
      },
      symbol = {
        preview = {
          ---Reorient the preview window on previewing a new symbol
          ---@param _ integer source window id, ignored
          ---@param range {start: {line: integer}, end: {line: integer}} 0-indexed
          reorient = function(_, range)
            local invisible = range['end'].line - vim.fn.line('w$') + 1
            if invisible > 0 then
              local view = vim.fn.winsaveview() --[[@as vim.fn.winrestview.dict]]
              view.topline = math.min(
                view.topline + invisible,
                math.max(1, range.start.line - vim.wo.scrolloff + 1)
              )
              vim.fn.winrestview(view)
            end
          end,
        },
        jump = {
          ---@param win integer source window id
          ---@param range {start: {line: integer}, end: {line: integer}} 0-indexed
          reorient = function(win, range)
            local view = vim.fn.winsaveview()
            local win_height = vim.api.nvim_win_get_height(win)
            local topline = range.start.line - math.floor(win_height / 4)
            if
              topline > view.topline
              and topline + win_height < vim.fn.line('$')
            then
              view.topline = topline
              vim.fn.winrestview(view)
            end
          end,
        },
      },
      bar = {
        hover = true,
        ---@type dropbar_source_t[]|fun(buf: integer, win: integer): dropbar_source_t[]
        sources = function(buf, _)
          local sources = require('dropbar.sources')
          if vim.bo[buf].ft == 'markdown' then
            return {
              sources.path,
              sources.markdown,
            }
          end
          if vim.bo[buf].buftype == 'terminal' then
            return {
              sources.terminal,
            }
          end
          return {
            sources.path,
            utils.source.fallback({
              sources.lsp,
              sources.treesitter,
            }),
          }
        end,
        padding = {
          left = 1,
          right = 1,
        },
        pick = {
          pivots = 'abcdefghijklmnopqrstuvwxyz',
        },
        truncate = true,
      },
      menu = {
        -- When on, preview the symbol under the cursor on CursorMoved
        preview = true,
        -- When on, automatically set the cursor to the closest previous/next
        -- clickable component in the direction of cursor movement on CursorMoved
        quick_navigation = true,
        entry = {
          padding = {
            left = 1,
            right = 1,
          },
        },
        -- Menu scrollbar options
        scrollbar = {
          enable = true,
          -- The background / gutter of the scrollbar
          -- When false, only the scrollbar thumb is shown.
          background = true
        },
        ---@type table<string, string|function|table<string, string|function>>
        keymaps = {
          ['q'] = '<C-w>q',
          ['<Esc>'] = '<C-w>q',
          ['<LeftMouse>'] = function()
            local menu = utils.menu.get_current()
            if not menu then
              return
            end
            local mouse = vim.fn.getmousepos()
            local clicked_menu = utils.menu.get({ win = mouse.winid })
            -- If clicked on a menu, invoke the corresponding click action,
            -- else close all menus and set the cursor to the clicked window
            if clicked_menu then
              clicked_menu:click_at({ mouse.line, mouse.column - 1 }, nil, 1, 'l')
              return
            end
            utils.menu.exec('close')
            utils.bar.exec('update_current_context_hl')
            if vim.api.nvim_win_is_valid(mouse.winid) then
              vim.api.nvim_set_current_win(mouse.winid)
            end
          end,
          ['<CR>'] = function()
            local menu = utils.menu.get_current()
            if not menu then
              return
            end
            local cursor = vim.api.nvim_win_get_cursor(menu.win)
            local component = menu.entries[cursor[1]]:first_clickable(cursor[2])
            if component then
              menu:click_on(component, nil, 1, 'l')
            end
          end,
          ['<MouseMove>'] = function()
            local menu = utils.menu.get_current()
            if not menu then
              return
            end
            local mouse = vim.fn.getmousepos()
            utils.menu.update_hover_hl(mouse)
            if M.opts.menu.preview then
              utils.menu.update_preview(mouse)
            end
          end,
          ['i'] = function()
            local menu = utils.menu.get_current()
            if not menu then
              return
            end
            menu:fuzzy_find_open()
          end,
        },
        ---@alias dropbar_menu_win_config_opts_t any|fun(menu: dropbar_menu_t):any
        ---@type table<string, dropbar_menu_win_config_opts_t>
        ---@see vim.api.nvim_open_win
        win_configs = {
          border = 'none',
          style = 'minimal',
          row = function(menu)
            return menu.prev_menu
              and menu.prev_menu.clicked_at
              and menu.prev_menu.clicked_at[1] - vim.fn.line('w0')
              or 0
          end,
          ---@param menu dropbar_menu_t
          col = function(menu)
            if menu.prev_menu then
              return menu.prev_menu._win_configs.width
                + (
                menu.prev_menu.scrollbar
                and menu.prev_menu.scrollbar.background
                and 1
                or 0
                )
            end
            local mouse = vim.fn.getmousepos()
            local bar = utils.bar.get({ win = menu.prev_win })
            if not bar then
              return mouse.wincol
            end
            local _, range = bar:get_component_at(math.max(0, mouse.wincol - 1))
            return range and range.start or mouse.wincol
          end,
          relative = 'win',
          win = function(menu)
            return menu.prev_menu and menu.prev_menu.win
              or vim.fn.getmousepos().winid
          end,
          height = function(menu)
            return math.max(
              1,
              math.min(
                #menu.entries,
                vim.go.pumheight ~= 0 and vim.go.pumheight
                or math.ceil(vim.go.lines / 4)
              )
            )
          end,
          width = function(menu)
            local min_width = vim.go.pumwidth ~= 0 and vim.go.pumwidth or 8
            if vim.tbl_isempty(menu.entries) then
              return min_width
            end
            return math.max(
              min_width,
              math.max(unpack(vim.tbl_map(function(entry)
                return entry:displaywidth()
              end, menu.entries)))
            )
          end,
          zindex = function(menu)
            if menu.prev_menu then
              if menu.prev_menu.scrollbar and menu.prev_menu.scrollbar.thumb then
                return vim.api.nvim_win_get_config(menu.prev_menu.scrollbar.thumb).zindex
              end
              return vim.api.nvim_win_get_config(menu.prev_win).zindex
            end
          end,
        },
      },
      fzf = {
        ---@type table<string, string | fun()>
        keymaps = {
          ['<LeftMouse>'] = function()
            ---@type dropbar_menu_t
            local menu = utils.menu.get_current()
            if not menu then
              return
            end
            local mouse = vim.fn.getmousepos()
            if not mouse then
              return
            end
            if mouse.winid ~= menu.win then
              local default_func = M.opts.menu.keymaps['<LeftMouse>']
              if type(default_func) == 'function' then
                default_func()
              end
              menu:fuzzy_find_close()
              return
            elseif mouse.winrow > vim.api.nvim_buf_line_count(menu.buf) then
              return
            end
            vim.api.nvim_win_set_cursor(menu.win, { mouse.line, mouse.column - 1 })
            menu:fuzzy_find_click_on_entry(function(entry)
              return entry:get_component_at(mouse.column - 1, true)
            end)
          end,
          ['<MouseMove>'] = function()
            ---@type dropbar_menu_t
            local menu = utils.menu.get_current()
            if not menu then
              return
            end
            local mouse = vim.fn.getmousepos()
            if not mouse then
              return
            end
            -- If mouse is not in the menu window or on the border, end preview
            -- and clear hover highlights
            if
              mouse.winid ~= menu.win
              or mouse.line <= 0
              or mouse.column <= 0
              or mouse.winrow > (#menu.entries + 1)
            then
              -- Find the root menu
              while menu and menu.prev_menu do
                menu = menu.prev_menu
              end
              if menu then
                menu:finish_preview(true)
                menu:update_hover_hl()
              end
              return
            end
            if M.opts.menu.preview then
              menu:preview_symbol_at({ mouse.line, mouse.column - 1 }, true)
            end
            menu:update_hover_hl({ mouse.line, mouse.column - 1 })
          end,
          ['<Up>'] = api.fuzzy_find_prev,
          ['<Down>'] = api.fuzzy_find_next,
          ['<C-k>'] = api.fuzzy_find_prev,
          ['<C-j>'] = api.fuzzy_find_next,
          ['<C-p>'] = api.fuzzy_find_prev,
          ['<C-n>'] = api.fuzzy_find_next,
          ['<Enter>'] = api.fuzzy_find_click,
          ['<S-Enter>'] = function()
            api.fuzzy_find_click(-1)
          end,
        },
        win_configs = {
          relative = 'win',
          anchor = 'NW',
          height = 1,
          win = function(menu)
            return menu.win
          end,
          width = function(menu)
            local function border_width(border)
              if type(border) == 'string' then
                if border == 'none' or border == 'shadow' then
                  return 0
                end
                return 2 -- left and right border
              end

              local left, right = 1, 1
              if
                (#border == 1 and border[1] == '')
                or (#border == 4 and border[4] == '')
                or (#border == 8 and border[8] == '')
              then
                left = 0
              end
              if
                (#border == 1 and border[1] == '')
                or (#border == 4 and border[4] == '')
                or (#border == 8 and border[4] == '')
              then
                right = 0
              end
              return left + right
            end
            local menu_width = menu._win_configs.width
              + border_width(menu._win_configs.border)
            local self_width = menu._win_configs.width
            local self_border = border_width(
              (
              M.opts.fzf.win_configs
              and M.eval(M.opts.fzf.win_configs.border, menu)
              )
              or (menu.fzf_win_configs and M.eval(
                menu.fzf_win_configs.border,
                menu
              ))
              or menu._win_configs.border
            )

            if self_width + self_border > menu_width then
              return self_width - self_border
            else
              return menu_width - self_border
            end
          end,
          row = function(menu)
            local menu_border = menu._win_configs.border
            if
              type(menu_border) == 'string'
              and menu_border ~= 'shadow'
              and menu_border ~= 'none'
            then
              return menu._win_configs.height + 1
            elseif menu_border == 'none' then
              return menu._win_configs.height
            end
            local len_menu_border = #menu_border
            if
              len_menu_border == 1 and menu_border[1] ~= ''
              or (len_menu_border == 2 or len_menu_border == 4) and menu_border[2] ~= ''
              or len_menu_border == 8 and menu_border[8] ~= ''
            then
              return menu._win_configs.height + 1
            else
              return menu._win_configs.height
            end
          end,
          col = function(menu)
            local menu_border = menu._win_configs.border
            if
              type(menu_border) == 'string'
              and menu_border ~= 'shadow'
              and menu_border ~= 'none'
            then
              return -1
            end
            if
              type(menu_border) == 'table' and menu_border[#menu_border] ~= ''
            then
              return -1
            end
            return 0
          end,
        },
        prompt = '%#htmlTag# ',
        char_pattern = '[%w%p]',
        retain_inner_spaces = true,
        fuzzy_find_on_click = true,
      },
      sources = {
        path = {
          ---@type string|fun(buf: integer, win: integer): string
          relative_to = function(_, win)
            -- Workaround for Vim:E5002: Cannot find window number
            local ok, cwd = pcall(vim.fn.getcwd, win)
            return ok and cwd or vim.fn.getcwd()
          end,
          ---Can be used to filter out files or directories
          ---based on their name
          ---@type fun(name: string): boolean
          filter = function(_)
            return true
          end,
          ---Last symbol from path source when current buf is modified
          ---@param sym dropbar_symbol_t
          ---@return dropbar_symbol_t
          modified = function(sym)
            return sym
          end,
          ---@type boolean|fun(path: string): boolean?|nil
          preview = function(path)
            local stat = vim.uv.fs_stat(path)
            if not stat or stat.type ~= 'file' then
              return false
            end
            if stat.size > 524288 then
              vim.notify(
                string.format(
                  '[dropbar.nvim] file "%s" too large to preview',
                  path
                ),
                vim.log.levels.WARN
              )
              return false
            end
            return true
          end,
        },
        treesitter = {
          -- Lua pattern used to extract a short name from the node text
          name_pattern = '[#~%*%w%._%->!@:]+%s*'
          .. string.rep('[#~%*%w%._%->!@:]*', 3, '%s*'),
          -- The order matters! The first match is used as the type
          -- of the treesitter symbol and used to show the icon
          -- Types listed below must have corresponding icons
          -- in the `icons.kinds.symbols` table for the icon to be shown
          valid_types = {
            'array',
            'boolean',
            'break_statement',
            'call',
            'case_statement',
            'class',
            'constant',
            'constructor',
            'continue_statement',
            'delete',
            'do_statement',
            'enum',
            'enum_member',
            'event',
            'for_statement',
            'function',
            'h1_marker',
            'h2_marker',
            'h3_marker',
            'h4_marker',
            'h5_marker',
            'h6_marker',
            'if_statement',
            'interface',
            'keyword',
            'list',
            'macro',
            'method',
            'module',
            'namespace',
            'null',
            'number',
            'operator',
            'package',
            'pair',
            'property',
            'reference',
            'repeat',
            'scope',
            'specifier',
            'string',
            'struct',
            'switch_statement',
            'type',
            'type_parameter',
            'unit',
            'value',
            'variable',
            'while_statement',
            'declaration',
            'field',
            'identifier',
            'object',
            'statement',
            'text',
          },
        },
        lsp = {
          request = {
            -- Times to retry a request before giving up
            ttl_init = 60,
            interval = 1000, -- in ms
          },
        },
        markdown = {
          parse = {
            -- Number of lines to update when cursor moves out of the parsed range
            look_ahead = 200,
          },
        },
        terminal = {
          ---@type string|fun(buf: integer): string
          icon = function(buf)
            local icon = M.opts.icons.kinds.symbols.Terminal
            if M.opts.icons.kinds.use_devicons then
              icon = require('nvim-web-devicons').get_icon_by_filetype(
                vim.bo[buf].filetype
              ) or icon
            end
            return icon
          end,
          ---@type string|fun(buf: integer): string
          name = vim.api.nvim_buf_get_name,
          ---@type boolean
          ---Show the current terminal buffer in the menu
          show_current = true,
        },
      },
    }

    -- M.opts.sources.treesitter.valid_types = {
    --   'array',
    --   'boolean',
    --   'break_statement',
    --   'call',
    --   'case_statement',
    --   'class',
    --   'constant',
    --   'constructor',
    --   'continue_statement',
    --   'delete',
    --   'do_statement',
    --   'enum',
    --   'enum_member',
    --   'event',
    --   'for_statement',
    --   'function',
    --   'h1_marker',
    --   'h2_marker',
    --   'h3_marker',
    --   'h4_marker',
    --   'h5_marker',
    --   'h6_marker',
    --   'if_statement',
    --   'interface',
    --   'keyword',
    --   'list',
    --   'macro',
    --   'method',
    --   'module',
    --   'namespace',
    --   'null',
    --   'number',
    --   'operator',
    --   'package',
    --   'pair',
    --   'property',
    --   'reference',
    --   'repeat',
    --   'scope',
    --   'specifier',
    --   'string',
    --   'struct',
    --   'switch_statement',
    --   'type',
    --   'type_parameter',
    --   'unit',
    --   'value',
    --   'variable',
    --   'while_statement',
    --   'declaration',
    --   'field',
    --   'identifier',
    --   'object',
    --   'statement',
    --   'text',
    -- }
    local navic = require("nvim-navic")
    navic.setup {
      icons = {
        File          = "󰈙 ",
        Module        = " ",
        Namespace     = "󰌗 ",
        Package       = " ",
        Class         = "󰌗 ",
        Method        = "󰆧 ",
        Property      = " ",
        Field         = " ",
        Constructor   = " ",
        Enum          = "󰕘",
        Interface     = "󰕘",
        Function      = "󰊕 ",
        Variable      = "󰆧 ",
        Constant      = "󰏿 ",
        String        = "󰀬 ",
        Number        = "󰎠 ",
        Boolean       = "◩ ",
        Array         = "󰅪 ",
        Object        = "󰅩 ",
        Key           = "󰌋 ",
        Null          = "󰟢 ",
        EnumMember    = " ",
        Struct        = "󰌗 ",
        Event         = " ",
        Operator      = "󰆕 ",
        TypeParameter = "󰊄 ",
      },
      lsp = {
        auto_attach = false,
        preference = nil,
      },
      highlight = false,
      separator = " > ",
      depth_limit = 0,
      depth_limit_indicator = "..",
      safe_output = true,
      lazy_update_context = false,
      click = false,
      format_text = function(text)
        return text
      end,
    }



--lualine
require('lualine').setup {
  options = {
    icons_enabled = true,
    theme = 'auto',
    component_separators = { left = '', right = ''},
    section_separators = { left = '', right = ''},
    disabled_filetypes = {
      statusline = {},
      winbar = {},
    },
    ignore_focus = {},
    always_divide_middle = true,
    globalstatus = false,
    refresh = {
      statusline = 1000,
      tabline = 1000,
      winbar = 1000,
    }
  },
  sections = {
    lualine_a = {'mode'},
    lualine_b = {'branch', 'diff', 'diagnostics'},
    lualine_c = {'filename'},
    lualine_x = {'encoding', 'fileformat', 'filetype'},
    lualine_y = {'progress'},
    lualine_z = {'location'}
  },
  inactive_sections = {
    lualine_a = {},
    lualine_b = {},
    lualine_c = {'filename'},
    lualine_x = {'location'},
    lualine_y = {},
    lualine_z = {}
  },
  tabline = {},
  winbar = {},
  inactive_winbar = {},
  extensions = {}
}

local lualine = require("lualine")
require("lualine").setup({
  sections = {
    lualine_x = { require("action-hints").statusline },
  },
})

local navic = require("nvim-navic")

require("lualine").setup({
    sections = {
        lualine_c = {
            {
                "navic",
    
                -- Component specific options
                color_correction = nil, -- Can be nil, "static" or "dynamic". This option is useful only when you have highlights enabled.
                                        -- Many colorschemes don't define same backgroud for nvim-navic as their lualine statusline backgroud.
                                        -- Setting it to "static" will perform a adjustment once when the component is being setup. This should
                                        --   be enough when the lualine section isn't changing colors based on the mode.
                                        -- Setting it to "dynamic" will keep updating the highlights according to the current modes colors for
                                        --   the current section.
    
                navic_opts = nil  -- lua table with same format as setup's option. All options except "lsp" options take effect when set here.
            }
        }
    },
    -- OR in winbar
    winbar = {
        lualine_c = {
            {
                "navic",
                color_correction = nil,
                navic_opts = nil
            }
        }
    }
})

-- OR a more hands on approach
require("lualine").setup({
    sections = {
        lualine_c = {
            {
              function()
                  return navic.get_location()
              end,
              cond = function()
                  return navic.is_available()
              end
            },
        }
    },
    -- OR in winbar
    winbar = {
        lualine_c = {
            {
              function()
                  return navic.get_location()
              end,
              cond = function()
                  return navic.is_available()
              end
            },
        }
    }
})

require("lualine").setup({
  sections = {
    lualine_x = { "aerial" },

    -- Or you can customize it
    lualine_y = {
      {
        "aerial",
        -- The separator to be used to separate symbols in status line.
        sep = " ) ",

        -- The number of symbols to render top-down. In order to render only 'N' last
        -- symbols, negative numbers may be supplied. For instance, 'depth = -1' can
        -- be used in order to render only current symbol.
        depth = nil,

        -- When 'dense' mode is on, icons are not rendered near their symbols. Only
        -- a single icon that represents the kind of current symbol is rendered at
        -- the beginning of status line.
        dense = false,

        -- The separator to be used to separate symbols in dense mode.
        dense_sep = ".",

        -- Color the symbol icons.
        colored = true,
      },
    },
  },
})



require("lualine").setup({
  sections = {
    -- Other Status Line components
    -- lualine_a = { ... },
    -- lualine_b = { ... },

    lualine_c = {
      function()
        -- invoke `progress` here.
        return require('lsp-progress').progress()
      end,
    },
  }
})

-- listen lsp-progress event and refresh lualine
vim.api.nvim_create_augroup("lualine_augroup", { clear = true })
vim.api.nvim_create_autocmd("User", {
  group = "lualine_augroup",
  pattern = "LspProgressStatusUpdated",
  callback = require("lualine").refresh,
})


lualine.setup({
    options = {
        icons_enabled = true,
        -- theme = cozynight,
        component_separators = { left = '', right = '' },
        section_separators = { left = '', right = '' },
        disabled_filetypes = {},
        always_divide_middle = true
    },
    sections = {
        lualine_a = { 'mode' },
        lualine_b = { 'branch', 'diff',
            {
                'diagnostics',
                sources = { "nvim_diagnostic" },
                symbols = { error = ' ', warn = ' ', info = ' ', hint = ' ' }
            }
        },
        lualine_c = { 'filename' },
        lualine_x = { 'copilot' ,'encoding', 'fileformat', 'filetype' }, -- I added copilot here
        lualine_y = { 'progress' },
        lualine_z = { 'location' }
    },
    inactive_sections = {
        lualine_a = {},
        lualine_b = {},
        lualine_c = { 'filename' },
        lualine_x = { 'location' },
        lualine_y = {},
        lualine_z = {}
    },
    tabline = {},
    extensions = {}
})
require("lualine").setup({
    sections = {
        lualine_b = {
            {
                function()
                    return require("grapple").name_or_index()
                end,
                cond = function()
                    return package.loaded["grapple"] and require("grapple").exists()
                end
            }
        }
    }
})




--incline
require('incline').setup {
  debounce_threshold = {
    falling = 50,
    rising = 10
  },
  hide = {
    cursorline = false,
    focused_win = false,
    only_win = false
  },
  highlight = {
    groups = {
      InclineNormal = {
        default = true,
        group = "NormalFloat"
      },
      InclineNormalNC = {
        default = true,
        group = "NormalFloat"
      }
    }
  },
  ignore = {
    buftypes = "special",
    filetypes = {},
    floating_wins = true,
    unlisted_buffers = true,
    wintypes = "special"
  },
  render = "basic",
  window = {
    margin = {
      horizontal = 1,
      vertical = 1
    },
    options = {
      signcolumn = "no",
      wrap = false
    },
    overlap = {
      borders = true,
      statusline = false,
      tabline = false,
      winbar = false
    },
    padding = 1,
    padding_char = " ",
    placement = {
      horizontal = "right",
      vertical = "top"
    },
    width = "fit",
    winhighlight = {
      active = {
        EndOfBuffer = "None",
        Normal = "InclineNormal",
        Search = "None"
      },
      inactive = {
        EndOfBuffer = "None",
        Normal = "InclineNormalNC",
        Search = "None"
      }
    },
    zindex = 50
  }
}
local devicons = require 'nvim-web-devicons'
require('incline').setup {
  render = function(props)
    local filename = vim.fn.fnamemodify(vim.api.nvim_buf_get_name(props.buf), ':t')
    if filename == '' then
      filename = '[No Name]'
    end
    local ft_icon, ft_color = devicons.get_icon_color(filename)

    local function get_git_diff()
      local icons = { removed = '', changed = '', added = '' }
      local signs = vim.b[props.buf].gitsigns_status_dict
      local labels = {}
      if signs == nil then
        return labels
      end
      for name, icon in pairs(icons) do
        if tonumber(signs[name]) and signs[name] > 0 then
          table.insert(labels, { icon .. signs[name] .. ' ', group = 'Diff' .. name })
        end
      end
      if #labels > 0 then
        table.insert(labels, { '┊ ' })
      end
      return labels
    end

    local function get_diagnostic_label()
      local icons = { error = '', warn = '', info = '', hint = '' }
      local label = {}

      for severity, icon in pairs(icons) do
        local n = #vim.diagnostic.get(props.buf, { severity = vim.diagnostic.severity[string.upper(severity)] })
        if n > 0 then
          table.insert(label, { icon .. n .. ' ', group = 'DiagnosticSign' .. severity })
        end
      end
      if #label > 0 then
        table.insert(label, { '┊ ' })
      end
      return label
    end

    return {
      { get_diagnostic_label() },
      { get_git_diff() },
      { (ft_icon or '') .. ' ', guifg = ft_color, guibg = 'none' },
      { filename .. ' ', gui = vim.bo[props.buf].modified and 'bold,italic' or 'bold' },
      { '┊  ' .. vim.api.nvim_win_get_number(props.win), group = 'DevIconWindows' },
    }
  end,
}




--barbar
vim.g.barbar_auto_setup = false -- disable auto-setup

require("barbar").setup {
  -- WARN: do not copy everything below into your config!
  --       It is just an example of what configuration options there are.
  --       The defaults are suitable for most people.

  -- Enable/disable animations
  animation = true,

  -- Automatically hide the tabline when there are this many buffers left.
  -- Set to any value >=0 to enable.
  auto_hide = false,

  -- Enable/disable current/total tabpages indicator (top right corner)
  tabpages = true,

  -- Enables/disable clickable tabs
  --  - left-click: go to buffer
  --  - middle-click: delete buffer
  clickable = true,

  -- Excludes buffers from the tabline
  exclude_ft = {'javascript'},
  exclude_name = {'package.json'},

  -- A buffer to this direction will be focused (if it exists) when closing the current buffer.
  -- Valid options are 'left' (the default), 'previous', and 'right'
  focus_on_close = 'left',

  -- Hide inactive buffers and file extensions. Other options are `alternate`, `current`, and `visible`.
  hide = {extensions = true, inactive = true},

  -- Disable highlighting alternate buffers
  highlight_alternate = false,

  -- Disable highlighting file icons in inactive buffers
  highlight_inactive_file_icons = false,

  -- Enable highlighting visible buffers
  highlight_visible = true,

  icons = {
    -- Configure the base icons on the bufferline.
    -- Valid options to display the buffer index and -number are `true`, 'superscript' and 'subscript'
    buffer_index = false,
    buffer_number = false,
    button = '',
    -- Enables / disables diagnostic symbols
    diagnostics = {
      [vim.diagnostic.severity.ERROR] = {enabled = true, icon = 'ﬀ'},
      [vim.diagnostic.severity.WARN] = {enabled = false},
      [vim.diagnostic.severity.INFO] = {enabled = false},
      [vim.diagnostic.severity.HINT] = {enabled = true},
    },
    gitsigns = {
      added = {enabled = true, icon = '+'},
      changed = {enabled = true, icon = '~'},
      deleted = {enabled = true, icon = '-'},
    },
    filetype = {
      -- Sets the icon's highlight group.
      -- If false, will use nvim-web-devicons colors
      custom_colors = false,

      -- Requires `nvim-web-devicons` if `true`
      enabled = true,
    },
    separator = {left = '▎', right = ''},

    -- If true, add an additional separator at the end of the buffer list
    separator_at_end = true,

    -- Configure the icons on the bufferline when modified or pinned.
    -- Supports all the base icon options.
    modified = {button = '●'},
    pinned = {button = '', filename = true},

    -- Use a preconfigured buffer appearance— can be 'default', 'powerline', or 'slanted'
    preset = 'default',

    -- Configure the icons on the bufferline based on the visibility of a buffer.
    -- Supports all the base icon options, plus `modified` and `pinned`.
    alternate = {filetype = {enabled = false}},
    current = {buffer_index = true},
    inactive = {button = '×'},
    visible = {modified = {buffer_number = false}},
  },

  -- If true, new buffers will be inserted at the start/end of the list.
  -- Default is to insert after current buffer.
  insert_at_end = false,
  insert_at_start = false,

  -- Sets the maximum padding width with which to surround each tab
  maximum_padding = 1,

  -- Sets the minimum padding width with which to surround each tab
  minimum_padding = 1,

  -- Sets the maximum buffer name length.
  maximum_length = 30,

  -- Sets the minimum buffer name length.
  minimum_length = 0,

  -- If set, the letters for each buffer in buffer-pick mode will be
  -- assigned based on their name. Otherwise or in case all letters are
  -- already assigned, the behavior is to assign letters in order of
  -- usability (see order below)
  semantic_letters = true,

  -- Set the filetypes which barbar will offset itself for
  sidebar_filetypes = {
    -- Use the default values: {event = 'BufWinLeave', text = '', align = 'left'}
    NvimTree = true,
    -- Or, specify the text used for the offset:
    undotree = {
      text = 'undotree',
      align = 'center', -- *optionally* specify an alignment (either 'left', 'center', or 'right')
    },
    -- Or, specify the event which the sidebar executes when leaving:
    ['neo-tree'] = {event = 'BufWipeout'},
    -- Or, specify all three
    Outline = {event = 'BufWinLeave', text = 'symbols-outline', align = 'right'},
  },

  -- New buffer letters are assigned in this order. This order is
  -- optimal for the qwerty keyboard layout but might need adjustment
  -- for other layouts.
  letters = 'asdfjkl;ghnmxcvbziowerutyqpASDFJKLGHNMXCVBZIOWERUTYQP',

  -- Sets the name of unnamed buffers. By default format is "[Buffer X]"
  -- where X is the buffer number. But only a static string is accepted here.
  no_name_title = nil,
}
local map = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true }

-- Move to previous/next
map('n', '<A-,>', '<Cmd>BufferPrevious<CR>', opts)
map('n', '<A-.>', '<Cmd>BufferNext<CR>', opts)
-- Re-order to previous/next
map('n', '<A-<>', '<Cmd>BufferMovePrevious<CR>', opts)
map('n', '<A->>', '<Cmd>BufferMoveNext<CR>', opts)
-- Goto buffer in position...
map('n', '<A-1>', '<Cmd>BufferGoto 1<CR>', opts)
map('n', '<A-2>', '<Cmd>BufferGoto 2<CR>', opts)
map('n', '<A-3>', '<Cmd>BufferGoto 3<CR>', opts)
map('n', '<A-4>', '<Cmd>BufferGoto 4<CR>', opts)
map('n', '<A-5>', '<Cmd>BufferGoto 5<CR>', opts)
map('n', '<A-6>', '<Cmd>BufferGoto 6<CR>', opts)
map('n', '<A-7>', '<Cmd>BufferGoto 7<CR>', opts)
map('n', '<A-8>', '<Cmd>BufferGoto 8<CR>', opts)
map('n', '<A-9>', '<Cmd>BufferGoto 9<CR>', opts)
map('n', '<A-0>', '<Cmd>BufferLast<CR>', opts)
-- Pin/unpin buffer
map('n', '<A-p>', '<Cmd>BufferPin<CR>', opts)
-- Close buffer
map('n', '<A-c>', '<Cmd>BufferClose<CR>', opts)
-- Wipeout buffer
--                 :BufferWipeout
-- Close commands
--                 :BufferCloseAllButCurrent
--                 :BufferCloseAllButPinned
--                 :BufferCloseAllButCurrentOrPinned
--                 :BufferCloseBuffersLeft
--                 :BufferCloseBuffersRight
-- Magic buffer-picking mode
map('n', '<C-p>', '<Cmd>BufferPick<CR>', opts)
-- Sort automatically by...
map('n', '<Space>bb', '<Cmd>BufferOrderByBufferNumber<CR>', opts)
map('n', '<Space>bn', '<Cmd>BufferOrderByName<CR>', opts)
map('n', '<Space>bd', '<Cmd>BufferOrderByDirectory<CR>', opts)
map('n', '<Space>bl', '<Cmd>BufferOrderByLanguage<CR>', opts)
map('n', '<Space>bw', '<Cmd>BufferOrderByWindowNumber<CR>', opts)

-- Other:
-- :BarbarEnable - enables barbar (enabled by default)
-- :BarbarDisable - very bad command, should never be used




--vim-illuminate
-- default configuration
require('illuminate').configure({
    -- providers: provider used to get references in the buffer, ordered by priority
    providers = {
        'lsp',
        'treesitter',
        'regex',
    },
    -- delay: delay in milliseconds
    delay = 100,
    -- filetype_overrides: filetype specific overrides.
    -- The keys are strings to represent the filetype while the values are tables that
    -- supports the same keys passed to .configure except for filetypes_denylist and filetypes_allowlist
    filetype_overrides = {},
    -- filetypes_denylist: filetypes to not illuminate, this overrides filetypes_allowlist
    filetypes_denylist = {
        'dirbuf',
        'dirvish',
        'fugitive',
    },
    -- filetypes_allowlist: filetypes to illuminate, this is overridden by filetypes_denylist
    -- You must set filetypes_denylist = {} to override the defaults to allow filetypes_allowlist to take effect
    filetypes_allowlist = {},
    -- modes_denylist: modes to not illuminate, this overrides modes_allowlist
    -- See `:help mode()` for possible values
    modes_denylist = {},
    -- modes_allowlist: modes to illuminate, this is overridden by modes_denylist
    -- See `:help mode()` for possible values
    modes_allowlist = {},
    -- providers_regex_syntax_denylist: syntax to not illuminate, this overrides providers_regex_syntax_allowlist
    -- Only applies to the 'regex' provider
    -- Use :echom synIDattr(synIDtrans(synID(line('.'), col('.'), 1)), 'name')
    providers_regex_syntax_denylist = {},
    -- providers_regex_syntax_allowlist: syntax to illuminate, this is overridden by providers_regex_syntax_denylist
    -- Only applies to the 'regex' provider
    -- Use :echom synIDattr(synIDtrans(synID(line('.'), col('.'), 1)), 'name')
    providers_regex_syntax_allowlist = {},
    -- under_cursor: whether or not to illuminate under the cursor
    under_cursor = true,
    -- large_file_cutoff: number of lines at which to use large_file_config
    -- The `under_cursor` option is disabled when this cutoff is hit
    large_file_cutoff = nil,
    -- large_file_config: config to use for large files (based on large_file_cutoff).
    -- Supports the same keys passed to .configure
    -- If nil, vim-illuminate will be disabled for large files.
    large_file_overrides = nil,
    -- min_count_to_highlight: minimum number of matches required to perform highlighting
    min_count_to_highlight = 1,
    -- should_enable: a callback that overrides all other settings to
    -- enable/disable illumination. This will be called a lot so don't do
    -- anything expensive in it.
    should_enable = function(bufnr) return true end,
    -- case_insensitive_regex: sets regex case sensitivity
    case_insensitive_regex = false,
})


--nvim-devicons
require("nvim-web-devicons").setup {
 -- your personnal icons can go here (to override)
 -- you can specify color or cterm_color instead of specifying both of them
 -- DevIcon will be appended to `name`
 override = {
  zsh = {
    icon = "",
    color = "#428850",
    cterm_color = "65",
    name = "Zsh"
  }
 };
 -- globally enable different highlight colors per icon (default to true)
 -- if set to false all icons will have the default icon's color
 color_icons = true;
 -- globally enable default icons (default to false)
 -- will get overriden by `get_icons` option
 default = true;
 -- globally enable "strict" selection of icons - icon will be looked up in
 -- different tables, first by filename, and if not found by extension; this
 -- prevents cases when file doesn't have any extension but still gets some icon
 -- because its name happened to match some extension (default to false)
 strict = true;
 -- same as `override` but specifically for overrides by filename
 -- takes effect when `strict` is true
 override_by_filename = {
  [".gitignore"] = {
    icon = "",
    color = "#f1502f",
    name = "Gitignore"
  }
 };
 -- same as `override` but specifically for overrides by extension
 -- takes effect when `strict` is true
 override_by_extension = {
  ["log"] = {
    icon = "",
    color = "#81e043",
    name = "Log"
  }
 };
 -- same as `override` but specifically for operating system
 -- takes effect when `strict` is true
 override_by_operating_system = {
  ["apple"] = {
    icon = "",
    color = "#A2AAAD",
    cterm_color = "248",
    name = "Apple",
  },
 };
}

    require('nvim-foldsign').setup({
        offset = -2,
        foldsigns = {
            open = '-',          -- mark the beginning of a fold
            close = '+',         -- show a closed fold
            seps = { '│', '┃' }, -- open fold middle marker
        }
    })


--cinnamon
-- DEFAULT_KEYMAPS:

-- Half-window movements:
vim.keymap.set({ 'n', 'x' }, '<C-u>', "<Cmd>lua Scroll('<C-u>', 1, 1)<CR>")
vim.keymap.set({ 'n', 'x' }, '<C-d>', "<Cmd>lua Scroll('<C-d>', 1, 1)<CR>")

-- Page movements:
vim.keymap.set({ 'n', 'x' }, '<C-b>', "<Cmd>lua Scroll('<C-b>', 1, 1)<CR>")
vim.keymap.set({ 'n', 'x' }, '<C-f>', "<Cmd>lua Scroll('<C-f>', 1, 1)<CR>")
vim.keymap.set({ 'n', 'x' }, '<PageUp>', "<Cmd>lua Scroll('<C-b>', 1, 1)<CR>")
vim.keymap.set({ 'n', 'x' }, '<PageDown>', "<Cmd>lua Scroll('<C-f>', 1, 1)<CR>")

-- EXTRA_KEYMAPS:

-- Start/end of file and line number movements:
vim.keymap.set({ 'n', 'x' }, 'gg', "<Cmd>lua Scroll('gg')<CR>")
vim.keymap.set({ 'n', 'x' }, 'G', "<Cmd>lua Scroll('G', 0, 1)<CR>")

-- Start/end of line:
vim.keymap.set({ 'n', 'x' }, '0', "<Cmd>lua Scroll('0')<CR>")
vim.keymap.set({ 'n', 'x' }, '^', "<Cmd>lua Scroll('^')<CR>")
vim.keymap.set({ 'n', 'x' }, '$', "<Cmd>lua Scroll('$', 0, 1)<CR>")

-- Paragraph movements:
vim.keymap.set({ 'n', 'x' }, '{', "<Cmd>lua Scroll('{')<CR>")
vim.keymap.set({ 'n', 'x' }, '}', "<Cmd>lua Scroll('}')<CR>")

-- Previous/next search result:
vim.keymap.set('n', 'n', "<Cmd>lua Scroll('n', 1)<CR>")
vim.keymap.set('n', 'N', "<Cmd>lua Scroll('N', 1)<CR>")
vim.keymap.set('n', '*', "<Cmd>lua Scroll('*', 1)<CR>")
vim.keymap.set('n', '#', "<Cmd>lua Scroll('#', 1)<CR>")
vim.keymap.set('n', 'g*', "<Cmd>lua Scroll('g*', 1)<CR>")
vim.keymap.set('n', 'g#', "<Cmd>lua Scroll('g#', 1)<CR>")

-- Previous/next cursor location:
vim.keymap.set('n', '<C-o>', "<Cmd>lua Scroll('<C-o>', 1)<CR>")
vim.keymap.set('n', '<C-i>', "<Cmd>lua Scroll('1<C-i>', 1)<CR>")

-- Screen scrolling:
vim.keymap.set('n', 'zz', "<Cmd>lua Scroll('zz', 0, 1)<CR>")
vim.keymap.set('n', 'zt', "<Cmd>lua Scroll('zt', 0, 1)<CR>")
vim.keymap.set('n', 'zb', "<Cmd>lua Scroll('zb', 0, 1)<CR>")
vim.keymap.set('n', 'z.', "<Cmd>lua Scroll('z.', 0, 1)<CR>")
vim.keymap.set('n', 'z<CR>', "<Cmd>lua Scroll('zt^', 0, 1)<CR>")
vim.keymap.set('n', 'z-', "<Cmd>lua Scroll('z-', 0, 1)<CR>")
vim.keymap.set('n', 'z^', "<Cmd>lua Scroll('z^', 0, 1)<CR>")
vim.keymap.set('n', 'z+', "<Cmd>lua Scroll('z+', 0, 1)<CR>")
vim.keymap.set('n', '<C-y>', "<Cmd>lua Scroll('<C-y>', 0, 1)<CR>")
vim.keymap.set('n', '<C-e>', "<Cmd>lua Scroll('<C-e>', 0, 1)<CR>")

-- Horizontal screen scrolling:
vim.keymap.set('n', 'zH', "<Cmd>lua Scroll('zH')<CR>")
vim.keymap.set('n', 'zL', "<Cmd>lua Scroll('zL')<CR>")
vim.keymap.set('n', 'zs', "<Cmd>lua Scroll('zs')<CR>")
vim.keymap.set('n', 'ze', "<Cmd>lua Scroll('ze')<CR>")
vim.keymap.set('n', 'zh', "<Cmd>lua Scroll('zh', 0, 1)<CR>")
vim.keymap.set('n', 'zl', "<Cmd>lua Scroll('zl', 0, 1)<CR>")

-- EXTENDED_KEYMAPS:

-- Up/down movements:
vim.keymap.set({ 'n', 'x' }, 'k', "<Cmd>lua Scroll('k', 0, 1)<CR>")
vim.keymap.set({ 'n', 'x' }, 'j', "<Cmd>lua Scroll('j', 0, 1)<CR>")
vim.keymap.set({ 'n', 'x' }, '<Up>', "<Cmd>lua Scroll('k', 0, 1)<CR>")
vim.keymap.set({ 'n', 'x' }, '<Down>', "<Cmd>lua Scroll('j', 0, 1)<CR>")

-- Left/right movements:
vim.keymap.set({ 'n', 'x' }, 'h', "<Cmd>lua Scroll('h', 0, 1)<CR>")
vim.keymap.set({ 'n', 'x' }, 'l', "<Cmd>lua Scroll('l', 0, 1)<CR>")
vim.keymap.set({ 'n', 'x' }, '<Left>', "<Cmd>lua Scroll('h', 0, 1)<CR>")
vim.keymap.set({ 'n', 'x' }, '<Right>', "<Cmd>lua Scroll('l', 0, 1)<CR>")

-- SCROLL_WHEEL_KEYMAPS:

vim.keymap.set({ 'n', 'x' }, '<ScrollWheelUp>', "<Cmd>lua Scroll('<ScrollWheelUp>')<CR>")
vim.keymap.set({ 'n', 'x' }, '<ScrollWheelDown>', "<Cmd>lua Scroll('<ScrollWheelDown>')<CR>")

-- LSP_KEYMAPS:

-- LSP go-to-definition:
vim.keymap.set('n', 'gd', "<Cmd>lua Scroll('definition')<CR>")

-- LSP go-to-declaration:
vim.keymap.set('n', 'gD', "<Cmd>lua Scroll('declaration')<CR>")
require('cinnamon').setup { extra_keymaps = true }



--indentation
require("ibl").setup()
local highlight = {
    "RainbowRed",
    "RainbowYellow",
    "RainbowBlue",
    "RainbowOrange",
    "RainbowGreen",
    "RainbowViolet",
    "RainbowCyan",
}

local hooks = require "ibl.hooks"
-- create the highlight groups in the highlight setup hook, so they are reset
-- every time the colorscheme changes
hooks.register(hooks.type.HIGHLIGHT_SETUP, function()
    vim.api.nvim_set_hl(0, "RainbowRed", { fg = "#E06C75" })
    vim.api.nvim_set_hl(0, "RainbowYellow", { fg = "#E5C07B" })
    vim.api.nvim_set_hl(0, "RainbowBlue", { fg = "#61AFEF" })
    vim.api.nvim_set_hl(0, "RainbowOrange", { fg = "#D19A66" })
    vim.api.nvim_set_hl(0, "RainbowGreen", { fg = "#98C379" })
    vim.api.nvim_set_hl(0, "RainbowViolet", { fg = "#C678DD" })
    vim.api.nvim_set_hl(0, "RainbowCyan", { fg = "#56B6C2" })
end)

require("ibl").setup { indent = { highlight = highlight } }
local highlight = {
    "CursorColumn",
    "Whitespace",
}
require("ibl").setup {
    indent = { highlight = highlight, char = "" },
    whitespace = {
        highlight = highlight,
        remove_blankline_trail = false,
    },
    scope = { enabled = false },
}
require("auto-indent").setup({
  lightmode = true,        -- Lightmode assumes tabstop and indentexpr not change within buffer's lifetime
  indentexpr = nil,        -- Use vim.bo.indentexpr by default, see 'Custom Indent Evaluate Method'
  ignore_filetype = {},    -- Disable plugin for specific filetypes, e.g. ignore_filetype = { 'javascript' }
})




--focus
require("focus").setup({
    enable = true, -- Enable module
    commands = true, -- Create Focus commands
    autoresize = {
        enable = true, -- Enable or disable auto-resizing of splits
        width = 0, -- Force width for the focused window
        height = 0, -- Force height for the focused window
        minwidth = 0, -- Force minimum width for the unfocused window
        minheight = 0, -- Force minimum height for the unfocused window
        height_quickfix = 10, -- Set the height of quickfix panel
    },
    split = {
        bufnew = false, -- Create blank buffer for new split windows
        tmux = false, -- Create tmux splits instead of neovim splits
    },
    ui = {
        number = false, -- Display line numbers in the focussed window only
        relativenumber = false, -- Display relative line numbers in the focussed window only
        hybridnumber = false, -- Display hybrid line numbers in the focussed window only
        absolutenumber_unfocussed = false, -- Preserve absolute numbers in the unfocussed windows

        cursorline = true, -- Display a cursorline in the focussed window only
        cursorcolumn = false, -- Display cursorcolumn in the focussed window only
        colorcolumn = {
            enable = false, -- Display colorcolumn in the foccused window only
            list = '+1', -- Set the comma-saperated list for the colorcolumn
        },
        signcolumn = true, -- Display signcolumn in the focussed window only
        winhighlight = false, -- Auto highlighting for focussed/unfocussed windows
    }
})
local focusmap = function(direction)
    vim.keymap.set('n', '<Leader>'..direction, function()
        require('focus').split_command(direction)
    end, { desc = string.format('Create or move to split (%s)', direction) })
end

-- Use `<Leader>h` to split the screen to the left, same as command FocusSplitLeft etc
focusmap('h')
focusmap('j')
focusmap('k')
focusmap('l')




--tmux
require('tmux-awesome-manager').setup({
  per_project_commands = { -- Configure your per project servers with
  -- project name = { { cmd, name } }
    api = { { cmd = 'rails server', name = 'Rails Server' } },
    front = { { cmd = 'yarn dev', name = 'react server' } },
  },
  session_name = 'Neovim Terminals',
  use_icon = false, -- use prefix icon
  icon = ' ', -- Prefix icon to use
  -- project_open_as = 'window', -- Open per_project_commands as.  Default: separated_session
  -- default_size = '30%', -- on panes, the default size
  -- open_new_as = 'window', -- open new command as.  options: pane, window, separated_session.
  -- default_orientation = 'vertical' -- Can also be horizontal
})
local tmux_term = require('tmux-awesome-manager.src.term')
local wk = require("which-key")

wk.register({
  r = {
    name = "+rails",
    R = tmux_term.run_wk({ cmd = 'rails s', name = 'Rails Server', visit_first_call = false, open_as = 'separated_session', session_name = 'My Terms' }),
    r = tmux_term.run_wk({ cmd = 'rails s', name = 'Rails Console', open_as = 'window' }),
    b = tmux_term.run_wk({ cmd = 'bundle install', name = 'Bundle Install', open_as = 'pane', close_on_timer = 2, visit_first_call = false, focus_when_call = false }),
    g = tmux_term.run_wk({ cmd = 'rails generate %1', name = 'Rails Generate',
      questions = { { question = "Rails generate: ", required = true, open_as = 'pane', close_on_timer = 4,
        visit_first_call = false, focus_when_call = false } } }),
    d = tmux_term.run_wk({ cmd = 'rails destroy %1', name = 'Rails Destroy',
      questions = { { question = "Rails destroy: ", required = true, open_as = 'pane', close_on_timer = 4,
        visit_first_call = false, focus_when_call = false } } }),
  },
}, { prefix = "<leader>", silent = true })
require('tmux-awesome-manager.src.integrations.status').status_with_icons()




--pineapple
require('telescope').load_extension('pineapple')
require('telescope').extensions.pineapple.colorschemes()

--colorscheme
vim.opt.background = 'dark'
local c = require('vscode.colors').get_colors()
require('vscode').setup({
    -- Alternatively set style in setup
    -- style = 'light'

    -- Enable transparent background
    transparent = true,

    -- Enable italic comment
    italic_comments = true,

    -- Underline `@markup.link.*` variants
    underline_links = true,

    -- Disable nvim-tree background color
    disable_nvimtree_bg = true,

    -- Override colors (see ./lua/vscode/colors.lua)
    color_overrides = {
        vscLineNumber = '#FFFFFF',
    },

    -- Override highlight groups (see ./lua/vscode/theme.lua)
    group_overrides = {
        -- this supports the same val table as vim.api.nvim_set_hl
        -- use colors from this colorscheme by requiring vscode.colors!
        Cursor = { fg=c.vscDarkBlue, bg=c.vscLightGreen, bold=true },
    }
})
-- require('vscode').load()

-- load the theme without affecting devicon colors.
vim.cmd.colorscheme="vscode"


-- file: colors/my-colorscheme-name.lua

local colorbuddy = require('colorbuddy')

-- Set up your custom colorscheme if you want
colorbuddy.colorscheme("vscode")

-- And then modify as you like
local Color = colorbuddy.Color
local colors = colorbuddy.colors
local Group = colorbuddy.Group
local groups = colorbuddy.groups
local styles = colorbuddy.styles

-- Use Color.new(<name>, <#rrggbb>) to create new colors
-- They can be accessed through colors.<name>
Color.new('background',  '#282c34')
Color.new('red',         '#cc6666')
Color.new('green',       '#99cc99')
Color.new('yellow',      '#f0c674')

-- Define highlights in terms of `colors` and `groups`
Group.new('Function'        , colors.yellow      , colors.background , styles.bold)
Group.new('luaFunctionCall' , groups.Function    , groups.Function   , groups.Function)

-- Define highlights in relative terms of other colors
Group.new('Error'           , colors.red:light() , nil               , styles.bold)

-- If you want multiple styles, just add them!
Group.new('italicBoldFunction', colors.green, groups.Function, styles.bold + styles.italic)

-- If you want the same style as a different group, but without a style: just subtract it!
Group.new('boldFunction', colors.yellow, colors.background, groups.italicBoldFunction - styles.italic)
  end
}





