return {
  'VonHeikemen/lsp-zero.nvim',
  dependencies  = {
    -- LSP Support
    {'neovim/nvim-lspconfig'},
    {'williamboman/mason.nvim'},
    {'williamboman/mason-lspconfig.nvim'},

    -- Autocompletion
    {'hrsh7th/nvim-cmp'},
    {'hrsh7th/cmp-buffer'},
    {'hrsh7th/cmp-path'},
    {'saadparwaiz1/cmp_luasnip'},
    {'hrsh7th/cmp-nvim-lsp'},
    {'hrsh7th/cmp-nvim-lua'},

    -- Snippets
    {'L3MON4D3/LuaSnip'},
    {'rafamadriz/friendly-snippets'},
    'nvim-lua/lsp-status.nvim',
    'RishabhRD/popfix',
    'RishabhRD/nvim-lsputils',
    'nvimdev/lspsaga.nvim',
    'kosayoda/nvim-lightbulb',
    'roobert/action-hints.nvim',
    'saadparwaiz1/cmp_luasnip',
    'onsails/lspkind.nvim',
    'ojroques/nvim-lspfuzzy',
    'gfanto/fzf-lsp.nvim',
    'ray-x/lsp_signature.nvim',
    'smjonas/inc-rename.nvim',
    'rmagatti/goto-preview',
    'ray-x/navigator.lua',
    'simrat39/symbols-outline.nvim',
    'stevearc/aerial.nvim',
    "neovim/nvim-lspconfig",
    "SmiteshP/nvim-navic",
    "MunifTanjim/nui.nvim",
    "numToStr/Comment.nvim",
    "nvim-telescope/telescope.nvim" ,
    "SmiteshP/nvim-navbuddy",
    "aznhe21/actions-preview.nvim",
    'mfussenegger/nvim-lint',
    "j-hui/fidget.nvim",
    'dnlhc/glance.nvim',
    'linrongbin16/lsp-progress.nvim',
    "jinzhongjia/LspUI.nvim",
    "hinell/lsp-timeout.nvim",
    "williamboman/mason.nvim",
    "folke/trouble.nvim",
    'folke/lsp-colors.nvim',
    'neovim/nvim-lspconfig',
    'hrsh7th/cmp-nvim-lsp',
    'hrsh7th/cmp-buffer',
    'hrsh7th/cmp-path',
    'hrsh7th/cmp-cmdline',
    'hrsh7th/nvim-cmp',
    'hrsh7th/cmp-vsnip',
    'hrsh7th/vim-vsnip',
    'SirVer/ultisnips',
    'quangnguyen30192/cmp-nvim-ultisnips',
    'dcampos/nvim-snippy',
    'dcampos/cmp-snippy',
    "zbirenbaum/copilot.lua",
    "zbirenbaum/copilot-cmp",
    'AndreM222/copilot-lualine',
    { "rafamadriz/friendly-snippets" },
    'dcampos/cmp-snippy',
    'windwp/nvim-autopairs',
    'monaqa/dial.nvim',
    'windwp/nvim-ts-autotag',
    'willothy/moveline.nvim',
    'numToStr/Comment.nvim',
    'lukas-reineke/lsp-format.nvim',
    "https://git.sr.ht/~nedia/auto-format.nvim",
    "https://git.sr.ht/~nedia/auto-save.nvim",
    'stevearc/conform.nvim',
    'nvim-treesitter/nvim-treesitter',
      "nvim-treesitter/nvim-treesitter-textobjects"
  },
  build = {"make install_jsregexp", "make", "TSUpdate"},
  config = function()



--lsp-zero
local lsp_zero = require('lsp-zero')

lsp_zero.on_attach(function(client, bufnr)
  -- see :help lsp-zero-keybindings
  -- to learn the available actions
  lsp_zero.default_keymaps({buffer = bufnr})
end)

-- to learn how to use mason.nvim
-- read this: https://github.com/VonHeikemen/lsp-zero.nvim/blob/v3.x/doc/md/guide/integrate-with-mason-nvim.md
require('mason').setup({})
require('mason-lspconfig').setup({
  ensure_installed = {},
  handlers = {
    function(server_name)
      require('lspconfig')[server_name].setup({})
    end,
  },
})

local lsp_zero = require('lsp-zero')

lsp_zero.on_attach(function(client, bufnr)
  lsp_zero.default_keymaps({buffer = bufnr})
end)

-- don't add this function in the `on_attach` callback.
-- `format_on_save` should run only once, before the language servers are active.
lsp_zero.format_on_save({
  format_opts = {
    async = false,
    timeout_ms = 10000,
  },
  servers = {
    ['tsserver'] = {'javascript', 'typescript'},
    ['rust_analyzer'] = {'rust'},
  }
})
vim.g.lsp_zero_extend_cmp = 0
vim.g.lsp_zero_extend_lspconfig = 0
vim.g.lsp_zero_extend_capabilities = 0
vim.g.lsp_zero_ui_float_border = 'rounded'
vim.g.lsp_zero_ui_signcolumn = 0
vim.g.lsp_zero_api_warnings = 0
vim.b.lsp_zero_enable_autoformat = 0
local lsp_zero = require('lsp-zero')

lsp_zero.set_server_config({
  single_file_support = false,
  capabilities = {
    textDocument = {
      foldingRange = {
        dynamicRegistration = false,
        lineFoldingOnly = true
      }
    }
  }
})

lsp_zero.on_attach(function(client, bufnr)
  lsp_zero.default_keymaps({buffer = bufnr})
  lsp_zero.buffer_autoformat()
end)
require('lspconfig').tsserver.setup({
  on_attach = function(client, bufnr)
    lsp_zero.async_autoformat(client, bufnr)
  end
})
lsp_zero.set_sign_icons({
  error = '✘',
  warn = '▲',
  hint = '⚑',
  info = '»'
})
lsp_zero.on_attach(function(client, bufnr)
  lsp_zero.highlight_symbol(client, bufnr)
end)
require('lsp-zero').extend_cmp()
local cmp_action = require('lsp-zero').cmp_action()
local cmp = require('cmp')
cmp.setup({
  mapping = cmp.mapping.preset.insert({
    ['<C-Space>'] = cmp.mapping.complete(),
    ['<C-f>'] = cmp_action.luasnip_jump_forward(),
    ['<C-b>'] = cmp_action.luasnip_jump_backward(),
  }),
  snippet = {
    expand = function(args)
      require('luasnip').lsp_expand(args.body)
    end,
  },
})
lsp_zero.omnifunc.setup({
  tabcomplete = true,
  use_fallback = true,
  update_on_delete = true,
})
lsp_zero.omnifunc.setup({
  autocomplete = true,
  use_fallback = true,
  update_on_delete = true,
  trigger = '<C-Space>',
})






    --lspconfig
    local on_windows = vim.loop.os_uname().version:match 'Windows'

    local function join_paths(...)
      local path_sep = on_windows and '\\' or '/'
      local result = table.concat({ ... }, path_sep)
      return result
    end

    vim.cmd [[set runtimepath=$VIMRUNTIME]]

    local temp_dir = vim.loop.os_getenv 'TEMP' or '/tmp'

    vim.cmd('set packpath=' .. join_paths(temp_dir, 'nvim', 'site'))

    local package_root = join_paths(temp_dir, 'nvim', 'site', 'pack')
    local lspconfig_path = join_paths(package_root, 'test', 'start', 'nvim-lspconfig')

    if vim.fn.isdirectory(lspconfig_path) ~= 1 then
      vim.fn.system { 'git', 'clone', 'https://github.com/neovim/nvim-lspconfig', lspconfig_path }
    end

    vim.lsp.set_log_level 'trace'
    require('vim.lsp.log').set_format_func(vim.inspect)
    local nvim_lsp = require 'lspconfig'
    local on_attach = function(_, bufnr)
      local function buf_set_option(...)
        vim.api.nvim_buf_set_option(bufnr, ...)
      end

      buf_set_option('omnifunc', 'v:lua.vim.lsp.omnifunc')

      -- Mappings.
      local opts = { buffer = bufnr, noremap = true, silent = true }
      vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, opts)
      vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
      vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)
      vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, opts)
      vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, opts)
      vim.keymap.set('n', '<space>wa', vim.lsp.buf.add_workspace_folder, opts)
      vim.keymap.set('n', '<space>wr', vim.lsp.buf.remove_workspace_folder, opts)
      vim.keymap.set('n', '<space>wl', function()
        print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
      end, opts)
      vim.keymap.set('n', '<space>D', vim.lsp.buf.type_definition, opts)
      vim.keymap.set('n', '<space>rn', vim.lsp.buf.rename, opts)
      vim.keymap.set('n', 'gr', vim.lsp.buf.references, opts)
      vim.keymap.set('n', '<space>e', vim.diagnostic.open_float, opts)
      vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, opts)
      vim.keymap.set('n', ']d', vim.diagnostic.goto_next, opts)
      vim.keymap.set('n', '<space>q', vim.diagnostic.setloclist, opts)
    end

    -- Add the server that troubles you here
    local name = 'pyright'
    local cmd = { 'pyright-langserver', '--stdio' } -- needed for elixirls, lua_ls, omnisharp
    if not name then
      print 'You have not defined a server name, please edit minimal_init.lua'
    end
    if not nvim_lsp[name].document_config.default_config.cmd and not cmd then
      print [[You have not defined a server default cmd for a server



    that requires it please edit minimal_init.lua]]
    end

    nvim_lsp[name].setup {
      cmd = cmd,
      on_attach = on_attach,
    }






    --nvim-cmp
    -- Set up nvim-cmp.
    local cmp = require("cmp")

    cmp.setup({
      snippet = {
        -- REQUIRED - you must specify a snippet engine
        expand = function(args)
          vim.fn["vsnip#anonymous"](args.body) -- For `vsnip` users.
          -- require('luasnip').lsp_expand(args.body) -- For `luasnip` users.
          -- require('snippy').expand_snippet(args.body) -- For `snippy` users.
          -- vim.fn["UltiSnips#Anon"](args.body) -- For `ultisnips` users.
          -- vim.snippet.expand(args.body) -- For native neovim snippets (Neovim v0.10+)
        end,
      },
      window = {
      -- completion = cmp.config.window.bordered(),
      -- documentation = cmp.config.window.bordered(),
      },
      mapping = cmp.mapping.preset.insert({
        ['<C-b>'] = cmp.mapping.scroll_docs(-4),
        ['<C-f>'] = cmp.mapping.scroll_docs(4),
        ['<C-Space>'] = cmp.mapping.complete(),
        ['<C-e>'] = cmp.mapping.abort(),
        ['<CR>'] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
      }),
      sources = cmp.config.sources({
        { name = 'nvim_lsp' },
        -- { name = 'vsnip' }, -- For vsnip users.
        { name = 'luasnip' }, -- For luasnip users.
        -- { name = 'ultisnips' }, -- For ultisnips users.
        { name = 'snippy' }, -- For snippy users.
      }, {
        { name = 'buffer' },
      })
    })

    -- To use git you need to install the plugin petertriho/cmp-git and uncomment lines below
    -- Set configuration for specific filetype.
    --[[ cmp.setup.filetype('gitcommit', {
    sources = cmp.config.sources({
      { name = 'git' },
    }, {
      { name = 'buffer' },
    })
 })
 require("cmp_git").setup() ]]-- 

    -- Use buffer source for `/` and `?` (if you enabled `native_menu`, this won't work anymore).
    cmp.setup.cmdline({ '/', '?' }, {
      mapping = cmp.mapping.preset.cmdline(),
      sources = {
        { name = 'buffer' }
      }
    })

    -- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
    cmp.setup.cmdline(':', {
      mapping = cmp.mapping.preset.cmdline(),
      sources = cmp.config.sources({
        { name = 'path' }
      }, {
        { name = 'cmdline' }
      }),
      matching = { disallow_symbol_nonprefix_matching = false }
    })

    -- cmp.lua
    cmp.setup {
      formatting = {
        format = lspkind.cmp_format({
          mode = "symbol",
          max_width = 50,
          symbol_map = { Copilot = "" }
        })
      }
    }
    -- -- Set up lspconfig.
    -- local capabilities = require('cmp_nvim_lsp').default_capabilities()
    -- -- Replace <YOUR_LSP_SERVER> with each lsp server you've enabled.
    -- require('lspconfig')['<YOUR_LSP_SERVER>'].setup {
    --   capabilities = capabilities
    -- }





    --lsp-status
    local lsp_status = require('lsp-status')
    lsp_status.register_progress()

    local lspconfig = require('lspconfig')

    -- Some arbitrary servers
    lspconfig.clangd.setup({
      handlers = lsp_status.extensions.clangd.setup(),
      init_options = {
        clangdFileStatus = true
      },
      on_attach = lsp_status.on_attach,
      capabilities = lsp_status.capabilities
    })

    lspconfig.pyls_ms.setup({
      handlers = lsp_status.extensions.pyls_ms.setup(),
      settings = { python = { workspaceSymbols = { enabled = true }}},
      on_attach = lsp_status.on_attach,
      capabilities = lsp_status.capabilities
    })

    lspconfig.ghcide.setup({
      on_attach = lsp_status.on_attach,
      capabilities = lsp_status.capabilities
    })
    lspconfig.rust_analyzer.setup({
      on_attach = lsp_status.on_attach,
      capabilities = lsp_status.capabilities
    })


    --copilot
    require('copilot').setup({
      panel = {
        enabled = true,
        auto_refresh = false,
        keymap = {
          jump_prev = "[[",
          jump_next = "]]",
          accept = "<CR>",
          refresh = "gr",
          open = "<M-CR>"
        },
        layout = {
          position = "bottom", -- | top | left | right
          ratio = 0.4
        },
      },
      suggestion = {
        enabled = true,
        auto_trigger = false,
        debounce = 75,
        keymap = {
          accept = "<M-l>",
          accept_word = false,
          accept_line = false,
          next = "<M-]>",
          prev = "<M-[>",
          dismiss = "<C-]>",
        },
      },
      filetypes = {
        yaml = false,
        markdown = false,
        help = false,
        gitcommit = false,
        gitrebase = false,
        hgcommit = false,
        svn = false,
        cvs = false,
        ["."] = false,
      },
      copilot_node_command = 'node', -- Node.js version must be > 18.x
      server_opts_overrides = {},
    })
    lspkind.init({
      symbol_map = {
        Copilot = "",
      },
    })

    vim.api.nvim_set_hl(0, "CmpItemKindCopilot", {fg ="#6CC644"})

    local has_words_before = function()
      if vim.api.nvim_buf_get_option(0, "buftype") == "prompt" then return false end
      local line, col = unpack(vim.api.nvim_win_get_cursor(0))
      return col ~= 0 and vim.api.nvim_buf_get_text(0, line-1, 0, line-1, col, {})[1]:match("^%s*$") == nil
    end
    cmp.setup({
      mapping = {
        ["<Tab>"] = vim.schedule_wrap(function(fallback)
          if cmp.visible() and has_words_before() then
            cmp.select_next_item({ behavior = cmp.SelectBehavior.Select })
          else
            fallback()
          end
        end),
      },
    })





    --lsputils
    if vim.fn.has('nvim-0.10.0') == 1 then
      vim.lsp.handlers['textDocument/codeAction'] = require'lsputil.codeAction'.code_action_handler
      vim.lsp.handlers['textDocument/references'] = require'lsputil.locations'.references_handler
      vim.lsp.handlers['textDocument/definition'] = require'lsputil.locations'.definition_handler
      vim.lsp.handlers['textDocument/declaration'] = require'lsputil.locations'.declaration_handler
      vim.lsp.handlers['textDocument/typeDefinition'] = require'lsputil.locations'.typeDefinition_handler
      vim.lsp.handlers['textDocument/implementation'] = require'lsputil.locations'.implementation_handler
      vim.lsp.handlers['textDocument/documentSymbol'] = require'lsputil.symbols'.document_handler
      vim.lsp.handlers['workspace/symbol'] = require'lsputil.symbols'.workspace_handler
    else
      local bufnr = vim.api.nvim_buf_get_number(0)

      vim.lsp.handlers['textDocument/codeAction'] = function(_, _, actions)
        require('lsputil.codeAction').code_action_handler(nil, actions, nil, nil, nil)
      end

      vim.lsp.handlers['textDocument/references'] = function(_, _, result)
        require('lsputil.locations').references_handler(nil, result, { bufnr = bufnr }, nil)
      end

      vim.lsp.handlers['textDocument/definition'] = function(_, method, result)
        require('lsputil.locations').definition_handler(nil, result, { bufnr = bufnr, method = method }, nil)
      end

      vim.lsp.handlers['textDocument/declaration'] = function(_, method, result)
        require('lsputil.locations').declaration_handler(nil, result, { bufnr = bufnr, method = method }, nil)
      end

      vim.lsp.handlers['textDocument/typeDefinition'] = function(_, method, result)
        require('lsputil.locations').typeDefinition_handler(nil, result, { bufnr = bufnr, method = method }, nil)
      end

      vim.lsp.handlers['textDocument/implementation'] = function(_, method, result)
        require('lsputil.locations').implementation_handler(nil, result, { bufnr = bufnr, method = method }, nil)
      end

      vim.lsp.handlers['textDocument/documentSymbol'] = function(_, _, result, _, bufn)
        require('lsputil.symbols').document_handler(nil, result, { bufnr = bufn }, nil)
      end

      vim.lsp.handlers['textDocument/symbol'] = function(_, _, result, _, bufn)
        require('lsputil.symbols').workspace_handler(nil, result, { bufnr = bufn }, nil)
      end
    end
    local border_chars = {
      TOP_LEFT = '┌',
      TOP_RIGHT = '┐',
      MID_HORIZONTAL = '─',
      MID_VERTICAL = '│',
      BOTTOM_LEFT = '└',
      BOTTOM_RIGHT = '┘',
    }
    vim.g.lsp_utils_location_opts = {
      height = 24,
      mode = 'editor',
      preview = {
        title = 'Location Preview',
        border = true,
        border_chars = border_chars
      },
      keymaps = {
        n = {
          ['<C-n>'] = 'j',
          ['<C-p>'] = 'k',
        }
      }
    }
    vim.g.lsp_utils_symbols_opts = {
      height = 24,
      mode = 'editor',
      preview = {
        title = 'Symbols Preview',
        border = true,
        border_chars = border_chars
      },
      prompt = {},
    }




    --lspsaga
    local saga = require 'lspsaga'

    saga.init_lsp_saga {
      error_sign = '',
      warn_sign = '',
      hint_sign = '',
      infor_sign = '',
      border_style = "round",
    }





    --nvim-lightbulb
    require("nvim-lightbulb").setup({
      autocmd = { enabled = true }
    })

    local default_config = {
      -- Priority of the lightbulb for all handlers except float.
      priority = 10,

      -- Whether or not to hide the lightbulb when the buffer is not focused.
      -- Only works if configured during NvimLightbulb.setup
      hide_in_unfocused_buffer = true,

      -- Whether or not to link the highlight groups automatically.
      -- Default highlight group links:
      --   LightBulbSign -> DiagnosticSignInfo
      --   LightBulbFloatWin -> DiagnosticFloatingInfo
      --   LightBulbVirtualText -> DiagnosticVirtualTextInfo
      --   LightBulbNumber -> DiagnosticSignInfo
      --   LightBulbLine -> CursorLine
      -- Only works if configured during NvimLightbulb.setup
      link_highlights = true,

      -- Perform full validation of configuration.
      -- Available options: "auto", "always", "never"
      --   "auto" only performs full validation in NvimLightbulb.setup.
      --   "always" performs full validation in NvimLightbulb.update_lightbulb as well.
      --   "never" disables config validation.
      validate_config = "auto",

      -- Code action kinds to observe.
      -- To match all code actions, set to `nil`.
      -- Otherwise, set to a table of kinds.
      -- Example: { "quickfix", "refactor.rewrite" }
      -- See: https://microsoft.github.io/language-server-protocol/specifications/lsp/3.17/specification/#codeActionKind
      action_kinds = nil,

      -- Configuration for various handlers:
      -- 1. Sign column.
      sign = {
        enabled = true,
        -- Text to show in the sign column.
        -- Must be between 1-2 characters.
        text = "💡",
        -- Highlight group to highlight the sign column text.
        hl = "LightBulbSign",
      },

      -- 2. Virtual text.
      virtual_text = {
        enabled = false,
        -- Text to show in the virt_text.
        text = "💡",
        -- Position of virtual text given to |nvim_buf_set_extmark|.
        -- Can be a number representing a fixed column (see `virt_text_pos`).
        -- Can be a string representing a position (see `virt_text_win_col`).
        pos = "eol",
        -- Highlight group to highlight the virtual text.
        hl = "LightBulbVirtualText",
        -- How to combine other highlights with text highlight.
        -- See `hl_mode` of |nvim_buf_set_extmark|.
        hl_mode = "combine",
      },

      -- 3. Floating window.
      float = {
        enabled = false,
        -- Text to show in the floating window.
        text = "💡",
        -- Highlight group to highlight the floating window.
        hl = "LightBulbFloatWin",
        -- Window options.
        -- See |vim.lsp.util.open_floating_preview| and |nvim_open_win|.
        -- Note that some options may be overridden by |open_floating_preview|.
        win_opts = {
          focusable = false,
        },
      },

      -- 4. Status text.
      -- When enabled, will allow using |NvimLightbulb.get_status_text|
      -- to retrieve the configured text.
      status_text = {
        enabled = false,
        -- Text to set if a lightbulb is available.
        text = "💡",
        -- Text to set if a lightbulb is unavailable.
        text_unavailable = "",
      },

      -- 5. Number column.
      number = {
        enabled = false,
        -- Highlight group to highlight the number column if there is a lightbulb.
        hl = "LightBulbNumber",
      },

      -- 6. Content line.
      line = {
        enabled = false,
        -- Highlight group to highlight the line if there is a lightbulb.
        hl = "LightBulbLine",
      },

      -- Autocmd configuration.
      -- If enabled, automatically defines an autocmd to show the lightbulb.
      -- If disabled, you will have to manually call |NvimLightbulb.update_lightbulb|.
      -- Only works if configured during NvimLightbulb.setup
      autocmd = {
        -- Whether or not to enable autocmd creation.
        enabled = false,
        -- See |updatetime|.
        -- Set to a negative value to avoid setting the updatetime.
        updatetime = 200,
        -- See |nvim_create_autocmd|.
        events = { "CursorHold", "CursorHoldI" },
        -- See |nvim_create_autocmd| and |autocmd-pattern|.
        pattern = { "*" },
      },

      -- Scenarios to not show a lightbulb.
      ignore = {
        -- LSP client names to ignore.
        -- Example: {"null-ls", "lua_ls"}
        clients = {},
        -- Filetypes to ignore.
        -- Example: {"neo-tree", "lua"}
        ft = {},
        -- Ignore code actions without a `kind` like refactor.rewrite, quickfix.
        actions_without_kind = false,
      },
    }





    --action-hints
    require("action-hints").setup({
      template = {
        definition = { text = " ⊛", color = "#add8e6" },
        references = { text = " ↱%s", color = "#ff6666" },
      },
      use_virtual_text = true,
    })




    --lspkind
    require('lspkind').init({
      -- DEPRECATED (use mode instead): enables text annotations
      --
      -- default: true
      -- with_text = true,

      -- defines how annotations are shown
      -- default: symbol
      -- options: 'text', 'text_symbol', 'symbol_text', 'symbol'
      mode = 'symbol_text',

      -- default symbol map
      -- can be either 'default' (requires nerd-fonts font) or
      -- 'codicons' for codicon preset (requires vscode-codicons font)
      --
      -- default: 'default'
      preset = 'codicons',

      -- override preset symbols
      --
      -- default: {}
      symbol_map = {
        Text = "󰉿",
        Method = "󰆧",
        Function = "󰊕",
        Constructor = "",
        Field = "󰜢",
        Variable = "󰀫",
        Class = "󰠱",
        Interface = "",
        Module = "",
        Property = "󰜢",
        Unit = "󰑭",
        Value = "󰎠",
        Enum = "",
        Keyword = "󰌋",
        Snippet = "",
        Color = "󰏘",
        File = "󰈙",
        Reference = "󰈇",
        Folder = "󰉋",
        EnumMember = "",
        Constant = "󰏿",
        Struct = "󰙅",
        Event = "",
        Operator = "󰆕",
        TypeParameter = "",
      },
    })

    local lspkind = require('lspkind')
    cmp.setup {
      formatting = {
        format = lspkind.cmp_format({
          mode = 'symbol', -- show only symbol annotations
          maxwidth = 50, -- prevent the popup from showing more than provided characters (e.g 50 will not show more than 50 characters)
          -- can also be a function to dynamically calculate max width such as
          -- maxwidth = function() return math.floor(0.45 * vim.o.columns) end,
          ellipsis_char = '...', -- when popup menu exceed maxwidth, the truncated part would show ellipsis_char instead (must define maxwidth first)
          show_labelDetails = true, -- show labelDetails in menu. Disabled by default

          -- The function below will be called before any actual modifications from lspkind
          -- so that you can provide more controls on popup customization. (See [#30](https://github.com/onsails/lspkind-nvim/pull/30))
          before = function (entry, vim_item)
            return vim_item
          end
        })
      }
    }





    --lspfuzzy
    require('lspfuzzy').setup {
      methods = 'all',         -- either 'all' or a list of LSP methods (see below)
      jump_one = true,         -- jump immediately if there is only one location
      save_last = false,       -- save last location results for the :LspFuzzyLast command
      callback = nil,          -- callback called after jumping to a location
      fzf_preview = {          -- arguments to the FZF '--preview-window' option
        'right:+{2}-/2'          -- preview on the right and centered on entry
      },
      fzf_action = {               -- FZF actions
        ['ctrl-t'] = 'tab split',  -- go to location in a new tab
        ['ctrl-v'] = 'vsplit',     -- go to location in a vertical split
        ['ctrl-x'] = 'split',      -- go to location in a horizontal split
      },
      fzf_modifier = ':~:.',   -- format FZF entries, see |filename-modifiers|
      fzf_trim = true,         -- trim FZF entries
    }

    vim.lsp.handlers["textDocument/codeAction"] = require'fzf_lsp'.code_action_handler
    vim.lsp.handlers["textDocument/definition"] = require'fzf_lsp'.definition_handler
    vim.lsp.handlers["textDocument/declaration"] = require'fzf_lsp'.declaration_handler
    vim.lsp.handlers["textDocument/typeDefinition"] = require'fzf_lsp'.type_definition_handler
    vim.lsp.handlers["textDocument/implementation"] = require'fzf_lsp'.implementation_handler
    vim.lsp.handlers["textDocument/references"] = require'fzf_lsp'.references_handler
    vim.lsp.handlers["textDocument/documentSymbol"] = require'fzf_lsp'.document_symbol_handler
    vim.lsp.handlers["workspace/symbol"] = require'fzf_lsp'.workspace_symbol_handler
    vim.lsp.handlers["callHierarchy/incomingCalls"] = require'fzf_lsp'.incoming_calls_handler
    vim.lsp.handlers["callHierarchy/outgoingCalls"] = require'fzf_lsp'.outgoing_calls_handler



    --lsp-signature
    local  cfg = {
      debug = false, -- set to true to enable debug logging
      log_path = vim.fn.stdpath("cache") .. "/lsp_signature.log", -- log dir when debug is on
      -- default is  ~/.cache/nvim/lsp_signature.log
      verbose = false, -- show debug line number

      bind = true, -- This is mandatory, otherwise border config won't get registered.
      -- If you want to hook lspsaga or other signature handler, pls set to false
      doc_lines = 10, -- will show two lines of comment/doc(if there are more than two lines in doc, will be truncated);
      -- set to 0 if you DO NOT want any API comments be shown
      -- This setting only take effect in insert mode, it does not affect signature help in normal
      -- mode, 10 by default

      max_height = 12, -- max height of signature floating_window
      max_width = 80, -- max_width of signature floating_window, line will be wrapped if exceed max_width
      -- the value need >= 40
      wrap = true, -- allow doc/signature text wrap inside floating_window, useful if your lsp return doc/sig is too long
      floating_window = true, -- show hint in a floating window, set to false for virtual text only mode

      floating_window_above_cur_line = true, -- try to place the floating above the current line when possible Note:
      -- will set to true when fully tested, set to false will use whichever side has more space
      -- this setting will be helpful if you do not want the PUM and floating win overlap

      floating_window_off_x = 5, -- adjust float windows x position.
      -- can be either a number or function
      floating_window_off_y = function() -- adjust float windows y position. e.g. set to -2 can make floating window move up 2 lines
        local linenr = vim.api.nvim_win_get_cursor(0)[1] -- buf line number
        local pumheight = vim.o.pumheight
        local winline = vim.fn.winline() -- line number in the window
        local winheight = vim.fn.winheight(0)

        -- window top
        if winline - 1 < pumheight then
          return pumheight
        end

        -- window bottom
        if winheight - winline < pumheight then
          return -pumheight
        end
        return 0
      end, -- adjust float windows y position. e.g -2 move window up 2 lines; 2 move down 2 lines
      -- can be either number or function, see examples
      close_timeout = 4000, -- close floating window after ms when laster parameter is entered
      fix_pos = false,  -- set to true, the floating window will not auto-close until finish all parameters
      hint_enable = true, -- virtual hint enable
      hint_prefix = "🐼 ",  -- Panda for parameter, NOTE: for the terminal not support emoji, might crash
      hint_scheme = "String",
      hint_inline = function() return false end,  -- should the hint be inline(nvim 0.10 only)?  default false
      -- return true | 'inline' to show hint inline, return 'eol' to show hint at end of line, return false to disable
      -- return 'right_align' to display hint right aligned in the current line
      hi_parameter = "LspSignatureActiveParameter", -- how your parameter will be highlight
      handler_opts = {
        border = "rounded"   -- double, rounded, single, shadow, none, or a table of borders
      },

      always_trigger = false, -- sometime show signature on new line or in middle of parameter can be confusing, set it to false for #58

      auto_close_after = nil, -- autoclose signature float win after x sec, disabled if nil.
      extra_trigger_chars = {}, -- Array of extra characters that will trigger signature completion, e.g., {"(", ","}
      zindex = 200, -- by default it will be on top of all floating windows, set to <= 50 send it to bottom

      padding = '', -- character to pad on left and right of signature can be ' ', or '|'  etc

      transparency = nil, -- disabled by default, allow floating win transparent value 1~100
      shadow_blend = 36, -- if you using shadow as border use this set the opacity
      shadow_guibg = 'Black', -- if you using shadow as border use this set the color e.g. 'Green' or '#121315'
      timer_interval = 200, -- default timer check interval set to lower value if you want to reduce latency
      toggle_key = nil, -- toggle signature on and off in insert mode,  e.g. toggle_key = '<M-x>'
      toggle_key_flip_floatwin_setting = false, -- true: toggle floating_windows: true|false setting after toggle key pressed
      -- false: floating_windows setup will not change, toggle_key will pop up signature helper, but signature
      -- may not popup when typing depends on floating_window setting

      select_signature_key = nil, -- cycle to next signature, e.g. '<M-n>' function overloading
      move_cursor_key = nil, -- imap, use nvim_set_current_win to move cursor between current win and floating window
      -- e.g. move_cursor_key = '<M-p>',
      -- once moved to floating window, you can use <M-d>, <M-u> to move cursor up and down
      keymaps = {}  -- relate to move_cursor_key; the keymaps inside floating window
    -- e.g. keymaps = { 'j', '<C-o>j' } this map j to <C-o>j in floating window
    -- <M-d> and <M-u> are default keymaps to move cursor up and down
    }

    -- recommended:
    require'lsp_signature'.setup(cfg) -- no need to specify bufnr if you don't use toggle_key

    -- You can also do this inside lsp on_attach
    -- note: on_attach deprecated
    require'lsp_signature'.on_attach(cfg, bufnr) -- no need to specify bufnr if you don't use toggle_key
    require("lsp_signature").status_line(max_width)





    --increname
    require("inc_rename").setup {
      -- the name of the command
      cmd_name = "IncRename",
      -- the highlight group used for highlighting the identifier's new name
      hl_group = "Substitute",
      -- whether an empty new name should be previewed; if false the command preview will be cancelled instead
      preview_empty_name = false,
      -- whether to display a `Renamed m instances in n files` message after a rename operation
      show_message = true,
      -- whether to save the "IncRename" command in the commandline history (set to false to prevent issues with
      -- navigating to older entries that may arise due to the behavior of command preview)
      save_in_cmdline_history = true,
      -- the type of the external input buffer to use (the only supported value is currently "dressing")
      input_buffer_type = nil,
      -- callback to run after renaming, receives the result table (from LSP handler) as an argument
      post_hook = nil,
    }

    vim.keymap.set("n", "<leader>rn", ":IncRename ")

    -- require("noice").setup {
    --   presets = { inc_rename = true }
    -- }

    -- require("inc_rename").setup {
    --   input_buffer_type = "dressing",
    -- }



    --goto-preview
    require('goto-preview').setup {
      width = 120; -- Width of the floating window
      height = 15; -- Height of the floating window
      border = {"↖", "─" ,"┐", "│", "┘", "─", "└", "│"}; -- Border characters of the floating window
      default_mappings = false; -- Bind default mappings
      debug = false; -- Print debug information
      opacity = nil; -- 0-100 opacity level of the floating window where 100 is fully transparent.
      resizing_mappings = false; -- Binds arrow keys to resizing the floating window.
      post_open_hook = nil; -- A function taking two arguments, a buffer and a window to be ran as a hook.
      post_close_hook = nil; -- A function taking two arguments, a buffer and a window to be ran as a hook.
      references = { -- Configure the telescope UI for slowing the references cycling window.
        telescope = require("telescope.themes").get_dropdown({ hide_preview = false })
      };
      -- These two configs can also be passed down to the goto-preview definition and implementation calls for one off "peak" functionality.
      focus_on_open = true; -- Focus the floating window when opening it.
      dismiss_on_move = false; -- Dismiss the floating window when moving the cursor.
      force_close = true, -- passed into vim.api.nvim_win_close's second argument. See :h nvim_win_close
      bufhidden = "wipe", -- the bufhidden option to set on the floating window. See :h bufhidden
      stack_floating_preview_windows = true, -- Whether to nest floating windows
      preview_window_title = { enable = true, position = "left" }, -- Whether to set the preview window title as the filename
    }
    vim.api.nvim_set_keymap('n', 'gpd', '<cmd>lua require("goto-preview").goto_preview_definition()<CR>', { noremap = true, silent = true })
    vim.api.nvim_set_keymap('n', 'gpt', '<cmd>lua require("goto-preview").goto_preview_type_definition()<CR>', { noremap = true, silent = true })
    vim.api.nvim_set_keymap('n', 'gpi', '<cmd>lua require("goto-preview").goto_preview_implementation()<CR>', { noremap = true, silent = true })
    vim.api.nvim_set_keymap('n', 'gpD', '<cmd>lua require("goto-preview").goto_preview_declaration()<CR>', { noremap = true, silent = true })
    vim.api.nvim_set_keymap('n', 'gP', '<cmd>lua require("goto-preview").close_all_win()<CR>', { noremap = true, silent = true })
    vim.api.nvim_set_keymap('n', 'gpr', '<cmd>lua require("goto-preview").goto_preview_references()<CR>', { noremap = true, silent = true })





    --navigator

    require'navigator'.setup({
      debug = false, -- log output, set to true and log path: ~/.cache/nvim/gh.log
      -- slowdownd startup and some actions
      width = 0.75, -- max width ratio (number of cols for the floating window) / (window width)
      height = 0.3, -- max list window height, 0.3 by default
      preview_height = 0.35, -- max height of preview windows
      border = {"╭", "─", "╮", "│", "╯", "─", "╰", "│"}, -- border style, can be one of 'none', 'single', 'double',
      -- 'shadow', or a list of chars which defines the border
      on_attach = function(client, bufnr)
      -- your hook
      end,
      -- put a on_attach of your own here, e.g
      -- function(client, bufnr)
      --   -- the on_attach will be called at end of navigator on_attach
      -- end,
      -- The attach code will apply to all LSP clients

      ts_fold = {
        enable = false,
        comment_fold = true, -- fold with comment string
        max_lines_scan_comments = 20, -- only fold when the fold level higher than this value
        disable_filetypes = {'help', 'guihua', 'text'}, -- list of filetypes which doesn't fold using treesitter
      },  -- modified version of treesitter folding
      default_mapping = true,  -- set to false if you will remap every key
      keymaps = {{key = "gK", func = vim.lsp.declaration, desc = 'declaration'}}, -- a list of key maps
      -- this kepmap gK will override "gD" mapping function declaration()  in default kepmap
      -- please check mapping.lua for all keymaps
      -- rule of overriding: if func and mode ('n' by default) is same
      -- the key will be overridden
      treesitter_analysis = true, -- treesitter variable context
      treesitter_navigation = true, -- bool|table false: use lsp to navigate between symbol ']r/[r', table: a list of
      --lang using TS navigation
      treesitter_analysis_max_num = 100, -- how many items to run treesitter analysis
      treesitter_analysis_condense = true, -- condense form for treesitter analysis
      -- this value prevent slow in large projects, e.g. found 100000 reference in a project
      transparency = 50, -- 0 ~ 100 blur the main window, 100: fully transparent, 0: opaque,  set to nil or 100 to disable it

      lsp_signature_help = true, -- if you would like to hook ray-x/lsp_signature plugin in navigator
      -- setup here. if it is nil, navigator will not init signature help
      signature_help_cfg = nil, -- if you would like to init ray-x/lsp_signature plugin in navigator, and pass in your own config to signature help
      icons = { -- refer to lua/navigator.lua for more icons config
        -- requires nerd fonts or nvim-web-devicons
        icons = true,
        -- Code action
        code_action_icon = "🏏", -- note: need terminal support, for those not support unicode, might crash
        -- Diagnostics
        diagnostic_head = '🐛',
        diagnostic_head_severity_1 = "🈲",
        fold = {
          prefix = '⚡',  -- icon to show before the folding need to be 2 spaces in display width
          separator = '',  -- e.g. shows   3 lines 
        },
      },
      mason = false, -- set to true if you would like use the lsp installed by williamboman/mason
      lsp = {
        enable = true,  -- skip lsp setup, and only use treesitter in navigator.
        -- Use this if you are not using LSP servers, and only want to enable treesitter support.
        -- If you only want to prevent navigator from touching your LSP server configs,
        -- use `disable_lsp = "all"` instead.
        -- If disabled, make sure add require('navigator.lspclient.mapping').setup({bufnr=bufnr, client=client}) in your
        -- own on_attach
        code_action = {enable = true, sign = true, sign_priority = 40, virtual_text = true},
        code_lens_action = {enable = true, sign = true, sign_priority = 40, virtual_text = true},
        document_highlight = true, -- LSP reference highlight,
        -- it might already supported by you setup, e.g. LunarVim
        format_on_save = true, -- {true|false} set to false to disasble lsp code format on save (if you are using prettier/efm/formater etc)
        -- table: {enable = {'lua', 'go'}, disable = {'javascript', 'typescript'}} to enable/disable specific language
        -- enable: a whitelist of language that will be formatted on save
        -- disable: a blacklist of language that will not be formatted on save
        -- function: function(bufnr) return true end to enable/disable lsp format on save
        format_options = {async=false}, -- async: disable by default, the option used in vim.lsp.buf.format({async={true|false}, name = 'xxx'})
        disable_format_cap = {"sqlls", "lua_ls", "gopls"},  -- a list of lsp disable format capacity (e.g. if you using efm or vim-codeformat etc), empty {} by default
        -- If you using null-ls and want null-ls format your code
        -- you should disable all other lsp and allow only null-ls.
        -- disable_lsp = {'pylsd', 'sqlls'},  -- prevents navigator from setting up this list of servers.
        -- if you use your own LSP setup, and don't want navigator to setup
        -- any LSP server for you, use `disable_lsp = "all"`.
        -- you may need to add this to your own on_attach hook:
        -- require('navigator.lspclient.mapping').setup({bufnr=bufnr, client=client})
        -- for e.g. denols and tsserver you may want to enable one lsp server at a time.
        -- default value: {}
        diagnostic = {
          underline = true,
          virtual_text = true, -- show virtual for diagnostic message
          update_in_insert = false, -- update diagnostic message in insert mode
          float = {                 -- setup for floating windows style
            focusable = false,
            sytle = 'minimal',
            border = 'rounded',
            source = 'always',
            header = '',
            prefix = '',
          },
        },

        hover = {
          enable = true,
          keymap = {
            ['<C-k>'] = {
              go = function()
                local w = vim.fn.expand('<cWORD>')
                vim.cmd('GoDoc ' .. w)
              end,
              default = function()
                local w = vim.fn.expand('<cWORD>')
                vim.lsp.buf.workspace_symbol(w)
              end,
            },
          },

          diagnostic_scrollbar_sign = {'▃', '▆', '█'}, -- experimental:  diagnostic status in scroll bar area; set to false to disable the diagnostic sign,
          --                for other style, set to {'╍', 'ﮆ'} or {'-', '='}
          diagnostic_virtual_text = true,  -- show virtual for diagnostic message
          diagnostic_update_in_insert = false, -- update diagnostic message in insert mode
          display_diagnostic_qf = true, -- always show quickfix if there are diagnostic errors, set to false if you want to ignore it
          -- set to 'trouble' to show diagnostcs in Trouble
          tsserver = {
            filetypes = {'typescript'} -- disable javascript etc,
          -- set to {} to disable the lspclient for all filetypes
          },
          ctags ={
            cmd = 'ctags',
            tagfile = 'tags',
            options = '-R --exclude=.git --exclude=node_modules --exclude=test --exclude=vendor --excmd=number',
          },
          -- gopls = {   -- gopls setting
          --   on_attach = function(client, bufnr)  -- on_attach for gopls
          --     -- your special on attach here
          --     -- e.g. disable gopls format because a known issue https://github.com/golang/go/issues/45732
          --     print("i am a hook, I will disable document format")
          --     client.resolved_capabilities.document_formatting = false
          --   end,
          --   settings = {
          --     gopls = {gofumpt = false} -- disable gofumpt etc,
          --   }
          -- },
          -- the lsp setup can be a function, .e.g
          gopls = function()
            local go = pcall(require, "go")
            if go then
              local cfg = require("go.lsp").config()
              cfg.on_attach = function(client)
                client.server_capabilities.documentFormattingProvider = false -- efm/null-ls
              end
              return cfg
            end
          end,

          lua_ls = {
            sumneko_root_path = vim.fn.expand("$HOME") .. "/github/sumneko/lua-language-server",
            sumneko_binary = vim.fn.expand("$HOME") .. "/github/sumneko/lua-language-server/bin/macOS/lua-language-server",
          },
          servers = {'cmake', 'ltex'}, -- by default empty, and it should load all LSP clients available based on filetype
        -- but if you want navigator load  e.g. `cmake` and `ltex` for you , you
        -- can put them in the `servers` list and navigator will auto load them.
        -- you could still specify the custom config  like this
        -- cmake = {filetypes = {'cmake', 'makefile'}, single_file_support = false},
        }
      }
    })






    --symbols-outline
    local opts = {
      highlight_hovered_item = true,
      show_guides = true,
      auto_preview = false,
      position = 'right',
      relative_width = true,
      width = 25,
      auto_close = false,
      show_numbers = false,
      show_relative_numbers = false,
      show_symbol_details = true,
      preview_bg_highlight = 'Pmenu',
      autofold_depth = nil,
      auto_unfold_hover = true,
      fold_markers = { '', '' },
      wrap = false,
      keymaps = { -- These keymaps can be a string or a table for multiple keys
        close = {"<Esc>", "q"},
        goto_location = "<Cr>",
        focus_location = "o",
        hover_symbol = "<C-space>",
        toggle_preview = "K",
        rename_symbol = "r",
        code_actions = "a",
        fold = "h",
        unfold = "l",
        fold_all = "W",
        unfold_all = "E",
        fold_reset = "R",
      },
      lsp_blacklist = {},
      symbol_blacklist = {},
      symbols = {
        File = { icon = "", hl = "@text.uri" },
        Module = { icon = "", hl = "@namespace" },
        Namespace = { icon = "", hl = "@namespace" },
        Package = { icon = "", hl = "@namespace" },
        Class = { icon = "𝓒", hl = "@type" },
        Method = { icon = "ƒ", hl = "@method" },
        Property = { icon = "", hl = "@method" },
        Field = { icon = "", hl = "@field" },
        Constructor = { icon = "", hl = "@constructor" },
        Enum = { icon = "ℰ", hl = "@type" },
        Interface = { icon = "ﰮ", hl = "@type" },
        Function = { icon = "", hl = "@function" },
        Variable = { icon = "", hl = "@constant" },
        Constant = { icon = "", hl = "@constant" },
        String = { icon = "𝓐", hl = "@string" },
        Number = { icon = "#", hl = "@number" },
        Boolean = { icon = "⊨", hl = "@boolean" },
        Array = { icon = "", hl = "@constant" },
        Object = { icon = "⦿", hl = "@type" },
        Key = { icon = "🔐", hl = "@type" },
        Null = { icon = "NULL", hl = "@type" },
        EnumMember = { icon = "", hl = "@field" },
        Struct = { icon = "𝓢", hl = "@type" },
        Event = { icon = "🗲", hl = "@type" },
        Operator = { icon = "+", hl = "@operator" },
        TypeParameter = { icon = "𝙏", hl = "@parameter" },
        Component = { icon = "", hl = "@function" },
        Fragment = { icon = "", hl = "@constant" },
      },
    }
    require("symbols-outline").setup(opts)



    -- aerial
    require("aerial").setup({
      -- optionally use on_attach to set keymaps when aerial has attached to a buffer
      on_attach = function(bufnr)
        -- Jump forwards/backwards with '{' and '}'
        vim.keymap.set("n", "{", "<cmd>AerialPrev<CR>", { buffer = bufnr })
        vim.keymap.set("n", "}", "<cmd>AerialNext<CR>", { buffer = bufnr })
      end,
    })
    -- You probably also want to set a keymap to toggle aerial
    vim.keymap.set("n", "<leader>a", "<cmd>AerialToggle!<CR>")


    -- Call the setup function to change the default behavior
    require("aerial").setup({
      -- Priority list of preferred backends for aerial.
      -- This can be a filetype map (see :help aerial-filetype-map)
      backends = { "treesitter", "lsp", "markdown", "asciidoc", "man" },

      layout = {
        -- These control the width of the aerial window.
        -- They can be integers or a float between 0 and 1 (e.g. 0.4 for 40%)
        -- min_width and max_width can be a list of mixed types.
        -- max_width = {40, 0.2} means "the lesser of 40 columns or 20% of total"
        max_width = { 40, 0.2 },
        width = nil,
        min_width = 10,

        -- key-value pairs of window-local options for aerial window (e.g. winhl)
        win_opts = {},

        -- Determines the default direction to open the aerial window. The 'prefer'
        -- options will open the window in the other direction *if* there is a
        -- different buffer in the way of the preferred direction
        -- Enum: prefer_right, prefer_left, right, left, float
        default_direction = "prefer_right",

        -- Determines where the aerial window will be opened
        --   edge   - open aerial at the far right/left of the editor
        --   window - open aerial to the right/left of the current window
        placement = "window",

        -- When the symbols change, resize the aerial window (within min/max constraints) to fit
        resize_to_content = true,

        -- Preserve window size equality with (:help CTRL-W_=)
        preserve_equality = false,
      },

      -- Determines how the aerial window decides which buffer to display symbols for
      --   window - aerial window will display symbols for the buffer in the window from which it was opened
      --   global - aerial window will display symbols for the current window
      attach_mode = "window",

      -- List of enum values that configure when to auto-close the aerial window
      --   unfocus       - close aerial when you leave the original source window
      --   switch_buffer - close aerial when you change buffers in the source window
      --   unsupported   - close aerial when attaching to a buffer that has no symbol source
      close_automatic_events = {},

      -- Keymaps in aerial window. Can be any value that `vim.keymap.set` accepts OR a table of keymap
      -- options with a `callback` (e.g. { callback = function() ... end, desc = "", nowait = true })
      -- Additionally, if it is a string that matches "actions.<name>",
      -- it will use the mapping at require("aerial.actions").<name>
      -- Set to `false` to remove a keymap
      keymaps = {
        ["?"] = "actions.show_help",
        ["g?"] = "actions.show_help",
        ["<CR>"] = "actions.jump",
        ["<2-LeftMouse>"] = "actions.jump",
        ["<C-v>"] = "actions.jump_vsplit",
        ["<C-s>"] = "actions.jump_split",
        ["p"] = "actions.scroll",
        ["<C-j>"] = "actions.down_and_scroll",
        ["<C-k>"] = "actions.up_and_scroll",
        ["{"] = "actions.prev",
        ["}"] = "actions.next",
        ["[["] = "actions.prev_up",
        ["]]"] = "actions.next_up",
        ["q"] = "actions.close",
        ["o"] = "actions.tree_toggle",
        ["za"] = "actions.tree_toggle",
        ["O"] = "actions.tree_toggle_recursive",
        ["zA"] = "actions.tree_toggle_recursive",
        ["l"] = "actions.tree_open",
        ["zo"] = "actions.tree_open",
        ["L"] = "actions.tree_open_recursive",
        ["zO"] = "actions.tree_open_recursive",
        ["h"] = "actions.tree_close",
        ["zc"] = "actions.tree_close",
        ["H"] = "actions.tree_close_recursive",
        ["zC"] = "actions.tree_close_recursive",
        ["zr"] = "actions.tree_increase_fold_level",
        ["zR"] = "actions.tree_open_all",
        ["zm"] = "actions.tree_decrease_fold_level",
        ["zM"] = "actions.tree_close_all",
        ["zx"] = "actions.tree_sync_folds",
        ["zX"] = "actions.tree_sync_folds",
      },

      -- When true, don't load aerial until a command or function is called
      -- Defaults to true, unless `on_attach` is provided, then it defaults to false
      lazy_load = true,

      -- Disable aerial on files with this many lines
      disable_max_lines = 10000,

      -- Disable aerial on files this size or larger (in bytes)
      disable_max_size = 2000000, -- Default 2MB

      -- A list of all symbols to display. Set to false to display all symbols.
      -- This can be a filetype map (see :help aerial-filetype-map)
      -- To see all available values, see :help SymbolKind
      filter_kind = {
        "Class",
        "Constructor",
        "Enum",
        "Function",
        "Interface",
        "Module",
        "Method",
        "Struct",
      },

      -- Determines line highlighting mode when multiple splits are visible.
      -- split_width   Each open window will have its cursor location marked in the
      --               aerial buffer. Each line will only be partially highlighted
      --               to indicate which window is at that location.
      -- full_width    Each open window will have its cursor location marked as a
      --               full-width highlight in the aerial buffer.
      -- last          Only the most-recently focused window will have its location
      --               marked in the aerial buffer.
      -- none          Do not show the cursor locations in the aerial window.
      highlight_mode = "split_width",

      -- Highlight the closest symbol if the cursor is not exactly on one.
      highlight_closest = true,

      -- Highlight the symbol in the source buffer when cursor is in the aerial win
      highlight_on_hover = false,

      -- When jumping to a symbol, highlight the line for this many ms.
      -- Set to false to disable
      highlight_on_jump = 300,

      -- Jump to symbol in source window when the cursor moves
      autojump = false,

      -- Define symbol icons. You can also specify "<Symbol>Collapsed" to change the
      -- icon when the tree is collapsed at that symbol, or "Collapsed" to specify a
      -- default collapsed icon. The default icon set is determined by the
      -- "nerd_font" option below.
      -- If you have lspkind-nvim installed, it will be the default icon set.
      -- This can be a filetype map (see :help aerial-filetype-map)
      icons = {},

      -- Control which windows and buffers aerial should ignore.
      -- Aerial will not open when these are focused, and existing aerial windows will not be updated
      ignore = {
        -- Ignore unlisted buffers. See :help buflisted
        unlisted_buffers = false,

        -- Ignore diff windows (setting to false will allow aerial in diff windows)
        diff_windows = true,

        -- List of filetypes to ignore.
        filetypes = {},

        -- Ignored buftypes.
        -- Can be one of the following:
        -- false or nil - No buftypes are ignored.
        -- "special"    - All buffers other than normal, help and man page buffers are ignored.
        -- table        - A list of buftypes to ignore. See :help buftype for the
        --                possible values.
        -- function     - A function that returns true if the buffer should be
        --                ignored or false if it should not be ignored.
        --                Takes two arguments, `bufnr` and `buftype`.
        buftypes = "special",

        -- Ignored wintypes.
        -- Can be one of the following:
        -- false or nil - No wintypes are ignored.
        -- "special"    - All windows other than normal windows are ignored.
        -- table        - A list of wintypes to ignore. See :help win_gettype() for the
        --                possible values.
        -- function     - A function that returns true if the window should be
        --                ignored or false if it should not be ignored.
        --                Takes two arguments, `winid` and `wintype`.
        wintypes = "special",
      },

      -- Use symbol tree for folding. Set to true or false to enable/disable
      -- Set to "auto" to manage folds if your previous foldmethod was 'manual'
      -- This can be a filetype map (see :help aerial-filetype-map)
      manage_folds = false,

      -- When you fold code with za, zo, or zc, update the aerial tree as well.
      -- Only works when manage_folds = true
      link_folds_to_tree = false,

      -- Fold code when you open/collapse symbols in the tree.
      -- Only works when manage_folds = true
      link_tree_to_folds = true,

      -- Set default symbol icons to use patched font icons (see https://www.nerdfonts.com/)
      -- "auto" will set it to true if nvim-web-devicons or lspkind-nvim is installed.
      nerd_font = "auto",

      -- Call this function when aerial attaches to a buffer.
      on_attach = function(bufnr) end,

      -- Call this function when aerial first sets symbols on a buffer.
      on_first_symbols = function(bufnr) end,

      -- Automatically open aerial when entering supported buffers.
      -- This can be a function (see :help aerial-open-automatic)
      open_automatic = false,

      -- Run this command after jumping to a symbol (false will disable)
      post_jump_cmd = "normal! zz",

      -- Invoked after each symbol is parsed, can be used to modify the parsed item,
      -- or to filter it by returning false.
      --
      -- bufnr: a neovim buffer number
      -- item: of type aerial.Symbol
      -- ctx: a record containing the following fields:
      --   * backend_name: treesitter, lsp, man...
      --   * lang: info about the language
      --   * symbols?: specific to the lsp backend
      --   * symbol?: specific to the lsp backend
      --   * syntax_tree?: specific to the treesitter backend
      --   * match?: specific to the treesitter backend, TS query match
      post_parse_symbol = function(bufnr, item, ctx)
        return true
      end,

      -- Invoked after all symbols have been parsed and post-processed,
      -- allows to modify the symbol structure before final display
      --
      -- bufnr: a neovim buffer number
      -- items: a collection of aerial.Symbol items, organized in a tree,
      --        with 'parent' and 'children' fields
      -- ctx: a record containing the following fields:
      --   * backend_name: treesitter, lsp, man...
      --   * lang: info about the language
      --   * symbols?: specific to the lsp backend
      --   * syntax_tree?: specific to the treesitter backend
      post_add_all_symbols = function(bufnr, items, ctx)
        return items
      end,

      -- When true, aerial will automatically close after jumping to a symbol
      close_on_select = false,

      -- The autocmds that trigger symbols update (not used for LSP backend)
      update_events = "TextChanged,InsertLeave",

      -- Show box drawing characters for the tree hierarchy
      show_guides = false,

      -- Customize the characters used when show_guides = true
      guides = {
        -- When the child item has a sibling below it
        mid_item = "├─",
        -- When the child item is the last in the list
        last_item = "└─",
        -- When there are nested child guides to the right
        nested_top = "│ ",
        -- Raw indentation
        whitespace = "  ",
      },

      -- Set this function to override the highlight groups for certain symbols
      get_highlight = function(symbol, is_icon, is_collapsed)
      -- return "MyHighlight" .. symbol.kind
      end,

      -- Options for opening aerial in a floating win
      float = {
        -- Controls border appearance. Passed to nvim_open_win
        border = "rounded",

        -- Determines location of floating window
        --   cursor - Opens float on top of the cursor
        --   editor - Opens float centered in the editor
        --   win    - Opens float centered in the window
        relative = "cursor",

        -- These control the height of the floating window.
        -- They can be integers or a float between 0 and 1 (e.g. 0.4 for 40%)
        -- min_height and max_height can be a list of mixed types.
        -- min_height = {8, 0.1} means "the greater of 8 rows or 10% of total"
        max_height = 0.9,
        height = nil,
        min_height = { 8, 0.1 },

        override = function(conf, source_winid)
          -- This is the config that will be passed to nvim_open_win.
          -- Change values here to customize the layout
          return conf
        end,
      },

      -- Options for the floating nav windows
      nav = {
        border = "rounded",
        max_height = 0.9,
        min_height = { 10, 0.1 },
        max_width = 0.5,
        min_width = { 0.2, 20 },
        win_opts = {
          cursorline = true,
          winblend = 10,
        },
        -- Jump to symbol in source window when the cursor moves
        autojump = false,
        -- Show a preview of the code in the right column, when there are no child symbols
        preview = false,
        -- Keymaps in the nav window
        keymaps = {
          ["<CR>"] = "actions.jump",
          ["<2-LeftMouse>"] = "actions.jump",
          ["<C-v>"] = "actions.jump_vsplit",
          ["<C-s>"] = "actions.jump_split",
          ["h"] = "actions.left",
          ["l"] = "actions.right",
          ["<C-c>"] = "actions.close",
        },
      },

      lsp = {
        -- If true, fetch document symbols when LSP diagnostics update.
        diagnostics_trigger_update = false,

        -- Set to false to not update the symbols when there are LSP errors
        update_when_errors = true,

        -- How long to wait (in ms) after a buffer change before updating
        -- Only used when diagnostics_trigger_update = false
        update_delay = 300,

        -- Map of LSP client name to priority. Default value is 10.
        -- Clients with higher (larger) priority will be used before those with lower priority.
        -- Set to -1 to never use the client.
        priority = {
        -- pyright = 10,
        },
      },

      treesitter = {
        -- How long to wait (in ms) after a buffer change before updating
        update_delay = 300,
      },

      markdown = {
        -- How long to wait (in ms) after a buffer change before updating
        update_delay = 300,
      },

      asciidoc = {
        -- How long to wait (in ms) after a buffer change before updating
        update_delay = 300,
      },

      man = {
        -- How long to wait (in ms) after a buffer change before updating
        update_delay = 300,
      },
    })





    --nvim-navbuddy
    local navbuddy = require("nvim-navbuddy")
    local actions = require("nvim-navbuddy.actions")

    navbuddy.setup {
      window = {
        border = "single",  -- "rounded", "double", "solid", "none"
        -- or an array with eight chars building up the border in a clockwise fashion
        -- starting with the top-left corner. eg: { "╔", "═" ,"╗", "║", "╝", "═", "╚", "║" }.
        size = "60%",       -- Or table format example: { height = "40%", width = "100%"}
        position = "50%",   -- Or table format example: { row = "100%", col = "0%"}
        scrolloff = nil,    -- scrolloff value within navbuddy window
        sections = {
          left = {
            size = "20%",
            border = nil, -- You can set border style for each section individually as well.
          },
          mid = {
            size = "40%",
            border = nil,
          },
          right = {
            -- No size option for right most section. It fills to
            -- remaining area.
            border = nil,
            preview = "leaf",  -- Right section can show previews too.
          -- Options: "leaf", "always" or "never"
          }
        },
      },
      node_markers = {
        enabled = true,
        icons = {
          leaf = "  ",
          leaf_selected = " → ",
          branch = " ",
        },
      },
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
        String        = " ",
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
      use_default_mappings = true,            -- If set to false, only mappings set
      -- by user are set. Else default
      -- mappings are used for keys
      -- that are not set by user
      mappings = {
        ["<esc>"] = actions.close(),        -- Close and cursor to original location
        ["q"] = actions.close(),

        ["j"] = actions.next_sibling(),     -- down
        ["k"] = actions.previous_sibling(), -- up

        ["h"] = actions.parent(),           -- Move to left panel
        ["l"] = actions.children(),         -- Move to right panel
        ["0"] = actions.root(),             -- Move to first panel

        ["v"] = actions.visual_name(),      -- Visual selection of name
        ["V"] = actions.visual_scope(),     -- Visual selection of scope

        ["y"] = actions.yank_name(),        -- Yank the name to system clipboard "+
        ["Y"] = actions.yank_scope(),       -- Yank the scope to system clipboard "+

        ["i"] = actions.insert_name(),      -- Insert at start of name
        ["I"] = actions.insert_scope(),     -- Insert at start of scope

        ["a"] = actions.append_name(),      -- Insert at end of name
        ["A"] = actions.append_scope(),     -- Insert at end of scope

        ["r"] = actions.rename(),           -- Rename currently focused symbol

        ["d"] = actions.delete(),           -- Delete scope

        ["f"] = actions.fold_create(),      -- Create fold of current scope
        ["F"] = actions.fold_delete(),      -- Delete fold of current scope

        ["c"] = actions.comment(),          -- Comment out current scope

        ["<enter>"] = actions.select(),     -- Goto selected symbol
        ["o"] = actions.select(),

        ["J"] = actions.move_down(),        -- Move focused node down
        ["K"] = actions.move_up(),          -- Move focused node up

        ["s"] = actions.toggle_preview(),   -- Show preview of current node

        ["<C-v>"] = actions.vsplit(),       -- Open selected node in a vertical split
        ["<C-s>"] = actions.hsplit(),       -- Open selected node in a horizontal split

        ["t"] = actions.telescope({         -- Fuzzy finder at current level.
          layout_config = {               -- All options that can be
            height = 0.60,              -- passed to telescope.nvim's
            width = 0.60,               -- default can be passed here.
            prompt_position = "top",
            preview_width = 0.50
          },
          layout_strategy = "horizontal"
        }),

        ["g?"] = actions.help(),            -- Open mappings help window
      },
      lsp = {
        auto_attach = false,   -- If set to true, you don't need to manually use attach function
        preference = nil,      -- list of lsp server names in order of preference
      },
      source_buffer = {
        follow_node = true,    -- Keep the current node in focus on the source buffer
        highlight = true,      -- Highlight the currently focused node
        reorient = "smart",    -- "smart", "top", "mid" or "none"
        scrolloff = nil        -- scrolloff value when navbuddy is open
      },
      custom_hl_group = nil,     -- "Visual" or any other hl group to use instead of inverted colors
    }






    --actions-preview
    require("actions-preview").setup {
      -- options for vim.diff(): https://neovim.io/doc/user/lua.html#vim.diff()
      diff = {
        ctxlen = 3,
      },

      -- priority list of external command to highlight diff
      -- disabled by defalt, must be set by yourself
      highlight_command = {
      -- require("actions-preview.highlight").delta(),
      -- require("actions-preview.highlight").diff_so_fancy(),
      -- require("actions-preview.highlight").diff_highlight(),
      },

      -- priority list of preferred backend
      backend = { "telescope", "nui" },

      -- options related to telescope.nvim
      telescope = vim.tbl_extend(
        "force",
        -- telescope theme: https://github.com/nvim-telescope/telescope.nvim#themes
        require("telescope.themes").get_dropdown(),
        -- a table for customizing content
        {
          -- a function to make a table containing the values to be displayed.
          -- fun(action: Action): { title: string, client_name: string|nil }
          make_value = nil,

          -- a function to make a function to be used in `display` of a entry.
          -- see also `:h telescope.make_entry` and `:h telescope.pickers.entry_display`.
          -- fun(values: { index: integer, action: Action, title: string, client_name: string }[]): function
          make_make_display = nil,
        }
      ),

      -- options for nui.nvim components
      nui = {
        -- component direction. "col" or "row"
        dir = "col",
        -- keymap for selection component: https://github.com/MunifTanjim/nui.nvim/tree/main/lua/nui/menu#keymap
        keymap = nil,
        -- options for nui Layout component: https://github.com/MunifTanjim/nui.nvim/tree/main/lua/nui/layout
        layout = {
          position = "50%",
          size = {
            width = "60%",
            height = "90%",
          },
          min_width = 40,
          min_height = 10,
          relative = "editor",
        },
        -- options for preview area: https://github.com/MunifTanjim/nui.nvim/tree/main/lua/nui/popup
        preview = {
          size = "60%",
          border = {
            style = "rounded",
            padding = { 0, 1 },
          },
        },
        -- options for selection area: https://github.com/MunifTanjim/nui.nvim/tree/main/lua/nui/menu
        select = {
          size = "40%",
          border = {
            style = "rounded",
            padding = { 0, 1 },
          },
        },
      },
    }
    require("actions-preview").setup {
      diff = {
        algorithm = "patience",
        ignore_whitespace = true,
      },
      telescope = require("telescope.themes").get_dropdown { winblend = 10 },
    }
    local hl = require("actions-preview.highlight")
    require("actions-preview").setup {
      highlight_command = {
        -- Highlight diff using delta: https://github.com/dandavison/delta
        -- The argument is optional, in which case "delta" is assumed to be
        -- specified.
        hl.delta("path/to/delta --option1 --option2"),
        -- You may need to specify "--no-gitconfig" since it is dependent on
        -- the gitconfig of the project by default.
        -- hl.delta("delta --no-gitconfig --side-by-side"),

        -- Highlight diff using diff-so-fancy: https://github.com/so-fancy/diff-so-fancy
        -- The arguments are optional, in which case ("diff-so-fancy", "less -R")
        -- is assumed to be specified. The existence of less is optional.
        hl.diff_so_fancy("path/to/diff-so-fancy --option1 --option2"),

        -- Highlight diff using diff-highlight included in git-contrib.
        -- The arguments are optional; the first argument is assumed to be
        -- "diff-highlight" and the second argument is assumed to be
        -- `{ colordiff = "colordiff", pager = "less -R" }`. The existence of
        -- colordiff and less is optional.
        hl.diff_highlight(
          "path/to/diff-highlight",
          { colordiff = "path/to/colordiff" }
        ),

        -- And, you can use any command to highlight diff.
        -- Define the pipeline by `hl.commands`.
        hl.commands({
          { cmd = "command-to-diff-highlight" },
          -- `optional` can be used to define that the command is optional.
          { cmd = "less -R", optional = true },
        }),
        -- If you use optional `less -R` (or similar command), you can also use `hl.with_pager`.
        hl.with_pager("command-to-diff-highlight"),
      -- hl.with_pager("command-to-diff-highlight", "custom-pager"),
      },
    }
    require("actions-preview").setup {
      telescope = {
        sorting_strategy = "ascending",
        layout_strategy = "vertical",
        layout_config = {
          width = 0.8,
          height = 0.9,
          prompt_position = "top",
          preview_cutoff = 20,
          preview_height = function(_, _, max_lines)
            return max_lines - 15
          end,
        },
      },
    }




    --fidget
    require("fidget").setup(
      {
        -- Options related to LSP progress subsystem
        progress = {
          poll_rate = 0,                -- How and when to poll for progress messages
          suppress_on_insert = false,   -- Suppress new messages while in insert mode
          ignore_done_already = false,  -- Ignore new tasks that are already complete
          ignore_empty_message = false, -- Ignore new tasks that don't contain a message
          clear_on_detach =             -- Clear notification group when LSP server detaches
          function(client_id)
            local client = vim.lsp.get_client_by_id(client_id)
            return client and client.name or nil
          end,
          notification_group =          -- How to get a progress message's notification group key
          function(msg) return msg.lsp_client.name end,
          ignore = {},                  -- List of LSP servers to ignore

          -- Options related to how LSP progress messages are displayed as notifications
          display = {
            render_limit = 16,          -- How many LSP messages to show at once
            done_ttl = 3,               -- How long a message should persist after completion
            done_icon = "✔",            -- Icon shown when all LSP progress tasks are complete
            done_style = "Constant",    -- Highlight group for completed LSP tasks
            progress_ttl = math.huge,   -- How long a message should persist when in progress
            progress_icon =             -- Icon shown when LSP progress tasks are in progress
            { pattern = "dots", period = 1 },
            progress_style =            -- Highlight group for in-progress LSP tasks
            "WarningMsg",
            group_style = "Title",      -- Highlight group for group name (LSP server name)
            icon_style = "Question",    -- Highlight group for group icons
            priority = 30,              -- Ordering priority for LSP notification group
            skip_history = true,        -- Whether progress notifications should be omitted from history
            format_message =            -- How to format a progress message
            require("fidget.progress.display").default_format_message,
            format_annote =             -- How to format a progress annotation
            function(msg) return msg.title end,
            format_group_name =         -- How to format a progress notification group's name
            function(group) return tostring(group) end,
            overrides = {               -- Override options from the default notification config
              rust_analyzer = { name = "rust-analyzer" },
            },
          },

          -- Options related to Neovim's built-in LSP client
          lsp = {
            progress_ringbuf_size = 0,  -- Configure the nvim's LSP progress ring buffer size
            log_handler = false,        -- Log `$/progress` handler invocations (for debugging)
          },
        },

        -- Options related to notification subsystem
        notification = {
          poll_rate = 10,               -- How frequently to update and render notifications
          filter = vim.log.levels.INFO, -- Minimum notifications level
          history_size = 128,           -- Number of removed messages to retain in history
          override_vim_notify = false,  -- Automatically override vim.notify() with Fidget
          configs =                     -- How to configure notification groups when instantiated
          { default = require("fidget.notification").default_config },
          redirect =                    -- Conditionally redirect notifications to another backend
          function(msg, level, opts)
            if opts and opts.on_open then
              return require("fidget.integration.nvim-notify").delegate(msg, level, opts)
            end
          end,

          -- Options related to how notifications are rendered as text
          view = {
            stack_upwards = true,       -- Display notification items from bottom to top
            icon_separator = " ",       -- Separator between group name and icon
            group_separator = "---",    -- Separator between notification groups
            group_separator_hl =        -- Highlight group used for group separator
            "Comment",
            render_message =            -- How to render notification messages
            function(msg, cnt)
              return cnt == 1 and msg or string.format("(%dx) %s", cnt, msg)
            end,
          },

          -- Options related to the notification window and buffer
          window = {
            normal_hl = "Comment",      -- Base highlight group in the notification window
            winblend = 100,             -- Background color opacity in the notification window
            border = "none",            -- Border around the notification window
            zindex = 45,                -- Stacking priority of the notification window
            max_width = 0,              -- Maximum width of the notification window
            max_height = 0,             -- Maximum height of the notification window
            x_padding = 1,              -- Padding from right edge of window boundary
            y_padding = 0,              -- Padding from bottom edge of window boundary
            align = "bottom",           -- How to align the notification window
            relative = "editor",        -- What the notification window position is relative to
          },
        },

        -- Options related to integrating with other plugins
        integration = {
          ["nvim-tree"] = {
            enable = true,              -- Integrate with nvim-tree/nvim-tree.lua (if installed)
          },
          ["xcodebuild-nvim"] = {
            enable = true,              -- Integrate with wojciech-kulik/xcodebuild.nvim (if installed)
          },
        },

        -- Options related to logging
        logger = {
          level = vim.log.levels.WARN,  -- Minimum logging level
          max_size = 10000,             -- Maximum log file size, in KB
          float_precision = 0.01,       -- Limit the number of decimals displayed for floats
          path =                        -- Where Fidget writes its logs to
          string.format("%s/fidget.nvim.log", vim.fn.stdpath("cache")),
        },
      }
    )





    -- Lua configuration
    local glance = require('glance')
    local actions = glance.actions

    glance.setup({
      height = 18, -- Height of the window
      zindex = 45,

      -- By default glance will open preview "embedded" within your active window
      -- when `detached` is enabled, glance will render above all existing windows
      -- and won't be restiricted by the width of your active window
      -- detached = true,

      -- Or use a function to enable `detached` only when the active window is too small
      -- (default behavior)
      detached = function(winid)
        return vim.api.nvim_win_get_width(winid) < 100
      end,

      preview_win_opts = { -- Configure preview window options
        cursorline = true,
        number = true,
        wrap = true,
      },
      border = {
        enable = false, -- Show window borders. Only horizontal borders allowed
        top_char = '―',
        bottom_char = '―',
      },
      list = {
        position = 'right', -- Position of the list window 'left'|'right'
        width = 0.33, -- 33% width relative to the active window, min 0.1, max 0.5
      },
      theme = { -- This feature might not work properly in nvim-0.7.2
        enable = true, -- Will generate colors for the plugin based on your current colorscheme
        mode = 'auto', -- 'brighten'|'darken'|'auto', 'auto' will set mode based on the brightness of your colorscheme
      },
      mappings = {
        list = {
          ['j'] = actions.next, -- Bring the cursor to the next item in the list
          ['k'] = actions.previous, -- Bring the cursor to the previous item in the list
          ['<Down>'] = actions.next,
          ['<Up>'] = actions.previous,
          ['<Tab>'] = actions.next_location, -- Bring the cursor to the next location skipping groups in the list
          ['<S-Tab>'] = actions.previous_location, -- Bring the cursor to the previous location skipping groups in the list
          ['<C-u>'] = actions.preview_scroll_win(5),
          ['<C-d>'] = actions.preview_scroll_win(-5),
          ['v'] = actions.jump_vsplit,
          ['s'] = actions.jump_split,
          ['t'] = actions.jump_tab,
          ['<CR>'] = actions.jump,
          ['o'] = actions.jump,
          ['l'] = actions.open_fold,
          ['h'] = actions.close_fold,
          ['<leader>l'] = actions.enter_win('preview'), -- Focus preview window
          ['q'] = actions.close,
          ['Q'] = actions.close,
          ['<Esc>'] = actions.close,
          ['<C-q>'] = actions.quickfix,
        -- ['<Esc>'] = false -- disable a mapping
        },
        preview = {
          ['Q'] = actions.close,
          ['<Tab>'] = actions.next_location,
          ['<S-Tab>'] = actions.previous_location,
          ['<leader>l'] = actions.enter_win('list'), -- Focus list window
        },
      },
      hooks = {},
      folds = {
        fold_closed = '',
        fold_open = '',
        folded = true, -- Automatically fold list on startup
      },
      indent_lines = {
        enable = true,
        icon = '│',
      },
      winbar = {
        enable = true, -- Available strating from nvim-0.8+
      },
      use_trouble_qf = false -- Quickfix action will open trouble.nvim instead of built-in quickfix list window
    })
    -- Lua
    vim.keymap.set('n', 'GD', '<CMD>Glance definitions<CR>')
    vim.keymap.set('n', 'GR', '<CMD>Glance references<CR>')
    vim.keymap.set('n', 'GY', '<CMD>Glance type_definitions<CR>')
    vim.keymap.set('n', 'GM', '<CMD>Glance implementations<CR>')






    --lsp-progress
    require("lsp-progress").setup({
      client_format = function(client_name, spinner, series_messages)
        if #series_messages == 0 then
          return nil
        end
        return {
          name = client_name,
          body = spinner .. " " .. table.concat(series_messages, ", "),
        }
      end,
      format = function(client_messages)
        --- @param name string
        --- @param msg string?
        --- @return string
        local function stringify(name, msg)
          return msg and string.format("%s %s", name, msg) or name
        end

        local sign = "" -- nf-fa-gear \uf013
        local lsp_clients = vim.lsp.get_active_clients()
        local messages_map = {}
        for _, climsg in ipairs(client_messages) do
          messages_map[climsg.name] = climsg.body
        end

        if #lsp_clients > 0 then
          table.sort(lsp_clients, function(a, b)
            return a.name < b.name
          end)
          local builder = {}
          for _, cli in ipairs(lsp_clients) do
            if
              type(cli) == "table"
              and type(cli.name) == "string"
              and string.len(cli.name) > 0
            then
              if messages_map[cli.name] then
                table.insert(builder, stringify(cli.name, messages_map[cli.name]))
              else
                table.insert(builder, stringify(cli.name))
              end
            end
          end
          if #builder > 0 then
            return sign .. " " .. table.concat(builder, ", ")
          end
        end
        return ""
      end,
    })






    --LSPUI
    local LspUI = require("LspUI")
    LspUI.setup()





    --mason
    require("mason").setup({
      ui = {
        icons = {
          package_installed = "✓",
          package_pending = "➜",
          package_uninstalled = "✗"
        }
      }
    })

    ---@class MasonSettings
    local DEFAULT_SETTINGS = {
      ---@since 1.0.0
      -- The directory in which to install packages.
      install_root_dir = path.concat { vim.fn.stdpath "data", "mason" },

      ---@since 1.0.0
      -- Where Mason should put its bin location in your PATH. Can be one of:
      -- - "prepend" (default, Mason's bin location is put first in PATH)
      -- - "append" (Mason's bin location is put at the end of PATH)
      -- - "skip" (doesn't modify PATH)
      ---@type '"prepend"' | '"append"' | '"skip"'
      PATH = "prepend",

      ---@since 1.0.0
      -- Controls to which degree logs are written to the log file. It's useful to set this to vim.log.levels.DEBUG when
      -- debugging issues with package installations.
      log_level = vim.log.levels.INFO,

      ---@since 1.0.0
      -- Limit for the maximum amount of packages to be installed at the same time. Once this limit is reached, any further
      -- packages that are requested to be installed will be put in a queue.
      max_concurrent_installers = 4,

      ---@since 1.0.0
      -- [Advanced setting]
      -- The registries to source packages from. Accepts multiple entries. Should a package with the same name exist in
      -- multiple registries, the registry listed first will be used.
      registries = {
        "github:mason-org/mason-registry",
      },

      ---@since 1.0.0
      -- The provider implementations to use for resolving supplementary package metadata (e.g., all available versions).
      -- Accepts multiple entries, where later entries will be used as fallback should prior providers fail.
      -- Builtin providers are:
      --   - mason.providers.registry-api  - uses the https://api.mason-registry.dev API
      --   - mason.providers.client        - uses only client-side tooling to resolve metadata
      providers = {
        "mason.providers.registry-api",
        "mason.providers.client",
      },

      github = {
        ---@since 1.0.0
        -- The template URL to use when downloading assets from GitHub.
        -- The placeholders are the following (in order):
        -- 1. The repository (e.g. "rust-lang/rust-analyzer")
        -- 2. The release version (e.g. "v0.3.0")
        -- 3. The asset name (e.g. "rust-analyzer-v0.3.0-x86_64-unknown-linux-gnu.tar.gz")
        download_url_template = "https://github.com/%s/releases/download/%s/%s",
      },

      pip = {
        ---@since 1.0.0
        -- Whether to upgrade pip to the latest version in the virtual environment before installing packages.
        upgrade_pip = false,

        ---@since 1.0.0
        -- These args will be added to `pip install` calls. Note that setting extra args might impact intended behavior
        -- and is not recommended.
        --
        -- Example: { "--proxy", "https://proxyserver" }
        install_args = {},
      },

      ui = {
        ---@since 1.0.0
        -- Whether to automatically check for new versions when opening the :Mason window.
        check_outdated_packages_on_open = true,

        ---@since 1.0.0
        -- The border to use for the UI window. Accepts same border values as |nvim_open_win()|.
        border = "none",

        ---@since 1.0.0
        -- Width of the window. Accepts:
        -- - Integer greater than 1 for fixed width.
        -- - Float in the range of 0-1 for a percentage of screen width.
        width = 0.8,

        ---@since 1.0.0
        -- Height of the window. Accepts:
        -- - Integer greater than 1 for fixed height.
        -- - Float in the range of 0-1 for a percentage of screen height.
        height = 0.9,

        icons = {
          ---@since 1.0.0
          -- The list icon to use for installed packages.
          package_installed = "◍",
          ---@since 1.0.0
          -- The list icon to use for packages that are installing, or queued for installation.
          package_pending = "◍",
          ---@since 1.0.0
          -- The list icon to use for packages that are not installed.
          package_uninstalled = "◍",
        },

        keymaps = {
          ---@since 1.0.0
          -- Keymap to expand a package
          toggle_package_expand = "<CR>",
          ---@since 1.0.0
          -- Keymap to install the package under the current cursor position
          install_package = "i",
          ---@since 1.0.0
          -- Keymap to reinstall/update the package under the current cursor position
          update_package = "u",
          ---@since 1.0.0
          -- Keymap to check for new version for the package under the current cursor position
          check_package_version = "c",
          ---@since 1.0.0
          -- Keymap to update all installed packages
          update_all_packages = "U",
          ---@since 1.0.0
          -- Keymap to check which installed packages are outdated
          check_outdated_packages = "C",
          ---@since 1.0.0
          -- Keymap to uninstall a package
          uninstall_package = "X",
          ---@since 1.0.0
          -- Keymap to cancel a package installation
          cancel_installation = "<C-c>",
          ---@since 1.0.0
          -- Keymap to apply language filter
          apply_language_filter = "<C-f>",
          ---@since 1.1.0
          -- Keymap to toggle viewing package installation log
          toggle_package_install_log = "<CR>",
          ---@since 1.8.0
          -- Keymap to toggle the help view
          toggle_help = "g?",
        },
      },
    }

    require("mason").setup({DEFAULT_SETTINGS})




    --trouble
    require("trouble").setup({
      position = "bottom", -- position of the list can be: bottom, top, left, right
      height = 10, -- height of the trouble list when position is top or bottom
      width = 50, -- width of the list when position is left or right
      icons = true, -- use devicons for filenames
      mode = "workspace_diagnostics", -- "workspace_diagnostics", "document_diagnostics", "quickfix", "lsp_references", "loclist"
      severity = nil, -- nil (ALL) or vim.diagnostic.severity.ERROR | WARN | INFO | HINT
      fold_open = "", -- icon used for open folds
      fold_closed = "", -- icon used for closed folds
      group = true, -- group results by file
      padding = true, -- add an extra new line on top of the list
      cycle_results = true, -- cycle item list when reaching beginning or end of list
      action_keys = { -- key mappings for actions in the trouble list
        -- map to {} to remove a mapping, for example:
        -- close = {},
        close = "q", -- close the list
        cancel = "<esc>", -- cancel the preview and get back to your last window / buffer / cursor
        refresh = "r", -- manually refresh
        jump = { "<cr>", "<tab>", "<2-leftmouse>" }, -- jump to the diagnostic or open / close folds
        open_split = { "<c-x>" }, -- open buffer in new split
        open_vsplit = { "<c-v>" }, -- open buffer in new vsplit
        open_tab = { "<c-t>" }, -- open buffer in new tab
        jump_close = {"o"}, -- jump to the diagnostic and close the list
        toggle_mode = "m", -- toggle between "workspace" and "document" diagnostics mode
        switch_severity = "s", -- switch "diagnostics" severity filter level to HINT / INFO / WARN / ERROR
        toggle_preview = "P", -- toggle auto_preview
        hover = "K", -- opens a small popup with the full multiline message
        preview = "p", -- preview the diagnostic location
        open_code_href = "c", -- if present, open a URI with more information about the diagnostic error
        close_folds = {"zM", "zm"}, -- close all folds
        open_folds = {"zR", "zr"}, -- open all folds
        toggle_fold = {"zA", "za"}, -- toggle fold of current file
        previous = "k", -- previous item
        next = "j", -- next item
        help = "?", -- help menu
      },
      multiline = true, -- render multi-line messages
      indent_lines = true, -- add an indent guide below the fold icons
      win_config = { border = "single" }, -- window configuration for floating windows. See |nvim_open_win()|.
      auto_open = false, -- automatically open the list when you have diagnostics
      auto_close = false, -- automatically close the list when you have no diagnostics
      auto_preview = true, -- automatically preview the location of the diagnostic. <esc> to close preview and go back to last window
      auto_fold = false, -- automatically fold a file trouble list at creation
      auto_jump = {"lsp_definitions"}, -- for the given modes, automatically jump if there is only a single result
      include_declaration = { "lsp_references", "lsp_implementations", "lsp_definitions"  }, -- for the given modes, include the declaration of the current symbol in the results
      signs = {
        -- icons / text used for a diagnostic
        error = "",
        warning = "",
        hint = "",
        information = "",
        other = "",
      },
      use_diagnostic_signs = false -- enabling this will use the signs defined in your lsp client
    })
    -- Lua
    vim.keymap.set("n", "<leader>xx", function() require("trouble").toggle() end)
    vim.keymap.set("n", "<leader>xw", function() require("trouble").toggle("workspace_diagnostics") end)
    vim.keymap.set("n", "<leader>xd", function() require("trouble").toggle("document_diagnostics") end)
    vim.keymap.set("n", "<leader>xq", function() require("trouble").toggle("quickfix") end)
    vim.keymap.set("n", "<leader>xl", function() require("trouble").toggle("loclist") end)
    vim.keymap.set("n", "gR", function() require("trouble").toggle("lsp_references") end)




    --lsp-colors
    require("lsp-colors").setup({
      Error = "#db4b4b",
      Warning = "#e0af68",
      Information = "#0db9d7",
      Hint = "#10B981"
    })




    --snippets
    require("luasnip.loaders.from_vscode").lazy_load()
    require('snippy').setup({
      mappings = {
        is = {
          ['<Tab>'] = 'expand_or_advance',
          ['<S-Tab>'] = 'previous',
        },
        nx = {
          ['<leader>x'] = 'cut_text',
        },
      },
    })



    --nvim-autopairs

    require("nvim-autopairs").setup {
      disable_filetype = { "TelescopePrompt", "spectre_panel" },
      disable_in_macro = true , -- disable when recording or executing a macro
      disable_in_visualblock = false ,-- disable when insert after visual block mode
      disable_in_replace_mode = true,
      ignored_next_char = [=[[%w%%%'%[%"%.%`%$]]=],
      enable_moveright = true,
      enable_afterquote = true ,-- add bracket pairs after quote
      enable_check_bracket_line = true , --- check bracket in same line
      enable_bracket_in_quote = true ,--
      enable_abbr = false, -- trigger abbreviation
      break_undo = true, -- switch for basic rule break undo sequence
      check_ts = false,
      map_cr = true,
      map_bs = true ,-- map the <BS> key
      map_c_h = false ,-- Map the <C-h> key to delete a pair
      map_c_w = false -- map <c-w> to delete a pair if possible
    }
    local handlers = require('nvim-autopairs.completion.handlers')

    cmp.event:on(
      'confirm_done',
      cmp_autopairs.on_confirm_done({
        filetypes = {
          -- "*" is a alias to all filetypes
          ["*"] = {
            ["("] = {
              kind = {
                cmp.lsp.CompletionItemKind.Function,
                cmp.lsp.CompletionItemKind.Method,
              },
              handler = handlers["*"]
            }
          },
          lua = {
            ["("] = {
              kind = {
                cmp.lsp.CompletionItemKind.Function,
                cmp.lsp.CompletionItemKind.Method
              },
              ---@param char string
              ---@param item table item completion
              ---@param bufnr number buffer number
              ---@param rules table
              ---@param commit_character table<string>
              handler = function(char, item, bufnr, rules, commit_character)
              -- Your handler function. Inspect with print(vim.inspect{char, item, bufnr, rules, commit_character})
              end
            }
          },
          -- Disable for tex
          tex = false
        }
      })
    )

    local Rule = require('nvim-autopairs.rule')
    local npairs = require('nvim-autopairs')

    npairs.add_rule(Rule("$$","$$","tex"))

    -- you can use some built-in conditions

    local cond = require('nvim-autopairs.conds')
    print(vim.inspect(cond))

    npairs.add_rules({
      Rule("$", "$",{"tex", "latex"})
        -- don't add a pair if the next character is %
        :with_pair(cond.not_after_regex("%%"))
        -- don't add a pair if  the previous character is xxx
        :with_pair(cond.not_before_regex("xxx", 3))
        -- don't move right when repeat character
        :with_move(cond.none())
        -- don't delete if the next character is xx
        :with_del(cond.not_after_regex("xx"))
        -- disable adding a newline when you press <cr>
        :with_cr(cond.none())
    },
    -- disable for .vim files, but it work for another filetypes
    Rule("a","a","-vim")
    )

    npairs.add_rules({
      Rule("$$","$$","tex")
        :with_pair(function(opts)
          print(vim.inspect(opts))
          if opts.line=="aa $$" then
            -- don't add pair on that line
            return false
          end
        end)
    }
    )

    -- you can use regex
    -- press u1234 => u1234number
    npairs.add_rules({
      Rule("u%d%d%d%d$", "number", "lua")
        :use_regex(true)
    })



    -- press x1234 => x12341234
    npairs.add_rules({
      Rule("x%d%d%d%d$", "number", "lua")
        :use_regex(true)
        :replace_endpair(function(opts)
          -- print(vim.inspect(opts))
          return opts.prev_char:sub(#opts.prev_char - 3,#opts.prev_char)
        end)
    })


    -- you can do anything with regex +special key
    -- example press tab to uppercase text:
    -- press b1234s<tab> => B1234S1234S

    npairs.add_rules({
      Rule("b%d%d%d%d%w$", "", "vim")
        :use_regex(true,"<tab>")
        :replace_endpair(function(opts)
          return
            opts.prev_char:sub(#opts.prev_char - 4,#opts.prev_char)
            .."<esc>viwU"
        end)
    })

    -- you can exclude filetypes
    npairs.add_rule(
      Rule("$$","$$")
        :with_pair(cond.not_filetypes({"lua"}))
    )
    --- check ./lua/nvim-autopairs/rules/basic.lua


    --dial
    vim.keymap.set("n", "<C-a>", function()
      require("dial.map").manipulate("increment", "normal")
    end)
    vim.keymap.set("n", "<C-x>", function()
      require("dial.map").manipulate("decrement", "normal")
    end)
    vim.keymap.set("n", "g<C-a>", function()
      require("dial.map").manipulate("increment", "gnormal")
    end)
    vim.keymap.set("n", "g<C-x>", function()
      require("dial.map").manipulate("decrement", "gnormal")
    end)
    vim.keymap.set("v", "<C-a>", function()
      require("dial.map").manipulate("increment", "visual")
    end)
    vim.keymap.set("v", "<C-x>", function()
      require("dial.map").manipulate("decrement", "visual")
    end)
    vim.keymap.set("v", "g<C-a>", function()
      require("dial.map").manipulate("increment", "gvisual")
    end)
    vim.keymap.set("v", "g<C-x>", function()
      require("dial.map").manipulate("decrement", "gvisual")
    end)
    local augend = require("dial.augend")
    require("dial.config").augends:register_group{
      default = {
        augend.integer.alias.decimal,
        augend.integer.alias.hex,
        augend.date.alias["%Y/%m/%d"],
      },
      typescript = {
        augend.integer.alias.decimal,
        augend.integer.alias.hex,
        augend.constant.new{ elements = {"let", "const"} },
      },
      visual = {
        augend.integer.alias.decimal,
        augend.integer.alias.hex,
        augend.date.alias["%Y/%m/%d"],
        augend.constant.alias.alpha,
        augend.constant.alias.Alpha,
      },
    }

    -- change augends in VISUAL mode
    vim.keymap.set("v", "<C-a>", require("dial.map").inc_visual("visual"), {noremap = true})
    vim.keymap.set("v", "<C-x>", require("dial.map").dec_visual("visual"), {noremap = true})

    require("dial.config").augends:register_group{
      default = {
        -- uppercase hex number (0x1A1A, 0xEEFE, etc.)
        augend.integer.new{
          radix = 16,
          prefix = "0x",
          natural = true,
          case = "upper",
        },
      },
    }

    require("dial.config").augends:register_group{
      default = {
        -- date with format `yyyy/mm/dd`
        augend.date.new{
          pattern = "%Y/%m/%d",
          default_kind = "day",
          -- if true, it does not match dates which does not exist, such as 2022/05/32
          only_valid = true,
          -- if true, it only matches dates with word boundary
          word = false,
        },
      },
    }

    require("dial.config").augends:register_group{
      default = {
        -- uppercase hex number (0x1A1A, 0xEEFE, etc.)
        augend.hexcolor.new{
          case = "lower",
        },
      },
    }


    require("dial.config").augends:register_group{
      default = {
        -- uppercase hex number (0x1A1A, 0xEEFE, etc.)
        augend.constant.new{
          elements = {"and", "or"},
          word = true, -- if false, "sand" is incremented into "sor", "doctor" into "doctand", etc.
          cyclic = true,  -- "or" is incremented into "and".
        },
        augend.constant.new{
          elements = {"&&", "||"},
          word = false,
          cyclic = true,
        },
      },
    }





    require('nvim-ts-autotag').setup({
      opts = {
        -- Defaults
        enable_close = true, -- Auto close tags
        enable_rename = true, -- Auto rename pairs of tags
        enable_close_on_slash = false -- Auto close on trailing </
      },
      -- Also override individual filetype configs, these take priority.
      -- Empty by default, useful if one of the "opts" global settings
      -- doesn't work well in a specific filetype
      per_filetype = {
        ["html"] = {
          enable_close = false
        }
      }
    })

    vim.lsp.handlers['textDocument/publishDiagnostics'] = vim.lsp.with(
      vim.lsp.diagnostic.on_publish_diagnostics,
      {
        underline = true,
        virtual_text = {
          spacing = 5,
          severity_limit = 'Warning',
        },
        update_in_insert = true,
      }
    )

    local moveline = require('moveline')
    vim.keymap.set('n', '<M-k>', moveline.up)
    vim.keymap.set('n', '<M-j>', moveline.down)
    vim.keymap.set('v', '<M-k>', moveline.block_up)
    vim.keymap.set('v', '<M-j>', moveline.block_down)


    --Comment
    require('Comment').setup()



    --lsp-format
    require("lsp-format").setup {}


    --auto-save and auto-format
    require("auto-save").setup({
      -- The name of the augroup.
      augroup_name = "AutoSavePlug",

      -- The events in which to trigger an auto save.
      events = { "InsertLeave", "TextChanged" },

      -- If you'd prefer to silence the output of `save_fn`.
      silent = true,

      -- If you'd prefer to write a vim command.
      save_cmd = nil,

      -- What to do after checking if auto save conditions have been met.
      save_fn = function()
        local config = require("auto-save.config")
        if config.save_cmd ~= nil then
          vim.cmd(config.save_cmd)
        elseif config.silent then
          vim.cmd("silent! w")
        else
          vim.cmd("w")
        end
      end,

      -- May define a timeout, or a duration to defer the save for - this allows
      -- for formatters to run, for example if they're configured via an autocmd
      -- that listens for `BufWritePre` event.
      timeout = nil,

      -- Define some filetypes to explicitly not save, in case our existing conditions
      -- don't quite catch all the buffers we'd prefer not to write to.
      exclude_ft = {},
    })

    require("auto-format").setup({
      -- The name of the augroup.
      augroup_name = "AutoFormat",

      -- If formatting takes longer than this amount of time, it will fail. Having no
      -- timeout at all tends to be ugly - larger files, complex or poor formatters
      -- will struggle to format within whatever the default timeout
      -- `vim.lsp.buf.format` uses.
      timeout = 2000,

      -- These filetypes will not be formatted automatically.
      exclude_ft = {},

      -- Prefer formatting via LSP for these filetypes.
      prefer_lsp = {},
    })




--conform
require("conform").setup({
  -- Map of filetype to formatters
  formatters_by_ft = {
    lua = { "stylua" },
    -- Conform will run multiple formatters sequentially
    go = { "goimports", "gofmt" },
    -- Use a sub-list to run only the first available formatter
    javascript = { { "prettierd", "prettier" } },
    -- You can use a function here to determine the formatters dynamically
    python = function(bufnr)
      if require("conform").get_formatter_info("ruff_format", bufnr).available then
        return { "ruff_format" }
      else
        return { "isort", "black" }
      end
    end,
    -- Use the "*" filetype to run formatters on all filetypes.
    ["*"] = { "codespell" },
    -- Use the "_" filetype to run formatters on filetypes that don't
    -- have other formatters configured.
    ["_"] = { "trim_whitespace" },
  },
  -- If this is set, Conform will run the formatter on save.
  -- It will pass the table to conform.format().
  -- This can also be a function that returns the table.
  format_on_save = {
    -- I recommend these options. See :help conform.format for details.
    lsp_fallback = true,
    timeout_ms = 500,
  },
  -- If this is set, Conform will run the formatter asynchronously after save.
  -- It will pass the table to conform.format().
  -- This can also be a function that returns the table.
  format_after_save = {
    lsp_fallback = true,
  },
  -- Set the log level. Use `:ConformInfo` to see the location of the log file.
  log_level = vim.log.levels.ERROR,
  -- Conform will notify you when a formatter errors
  notify_on_error = true,
  -- Custom formatters and overrides for built-in formatters
  formatters = {
    my_formatter = {
      -- This can be a string or a function that returns a string.
      -- When defining a new formatter, this is the only field that is required
      command = "my_cmd",
      -- A list of strings, or a function that returns a list of strings
      -- Return a single string instead of a list to run the command in a shell
      args = { "--stdin-from-filename", "$FILENAME" },
      -- If the formatter supports range formatting, create the range arguments here
      range_args = function(self, ctx)
        return { "--line-start", ctx.range.start[1], "--line-end", ctx.range["end"][1] }
      end,
      -- Send file contents to stdin, read new contents from stdout (default true)
      -- When false, will create a temp file (will appear in "$FILENAME" args). The temp
      -- file is assumed to be modified in-place by the format command.
      stdin = true,
      -- A function that calculates the directory to run the command in
      cwd = require("conform.util").root_file({ ".editorconfig", "package.json" }),
      -- When cwd is not found, don't run the formatter (default false)
      require_cwd = true,
      -- When stdin=false, use this template to generate the temporary file that gets formatted
      tmpfile_format = ".conform.$RANDOM.$FILENAME",
      -- When returns false, the formatter will not be used
      condition = function(self, ctx)
        return vim.fs.basename(ctx.filename) ~= "README.md"
      end,
      -- Exit codes that indicate success (default { 0 })
      exit_codes = { 0, 1 },
      -- Environment variables. This can also be a function that returns a table.
      env = {
        VAR = "value",
      },
      -- Set to false to disable merging the config with the base definition
      inherit = true,
      -- When inherit = true, add these additional arguments to the command.
      -- This can also be a function, like args
      prepend_args = { "--use-tabs" },
    },
    -- These can also be a function that returns the formatter
    other_formatter = function(bufnr)
      return {
        command = "my_cmd",
      }
    end,
  },
})

-- You can set formatters_by_ft and formatters directly
require("conform").formatters_by_ft.lua = { "stylua" }
require("conform").formatters.my_formatter = {
  command = "my_cmd",
}
require("conform").setup({
  formatters_by_ft = {
    lua = { "stylua" },
    -- Conform will run multiple formatters sequentially
    python = { "isort", "black" },
    -- Use a sub-list to run only the first available formatter
    javascript = { { "prettierd", "prettier" } },
  },
})

--treesitter
require'nvim-treesitter.configs'.setup {
  -- A list of parser names, or "all" (the five listed parsers should always be installed)
  ensure_installed = "community",

  -- Install parsers synchronously (only applied to `ensure_installed`)
  sync_install = true,

  -- Automatically install missing parsers when entering buffer
  -- Recommendation: set to false if you don't have `tree-sitter` CLI installed locally
  auto_install = true,

  -- List of parsers to ignore installing (or "all")
  -- ignore_install = { "javascript" },

  ---- If you need to change the installation directory of the parsers (see -> Advanced Setup)
  -- parser_install_dir = "/some/path/to/store/parsers", -- Remember to run vim.opt.runtimepath:append("/some/path/to/store/parsers")!

  highlight = {
    enable = true,

    -- NOTE: these are the names of the parsers and not the filetype. (for example if you want to
    -- disable highlighting for the `tex` filetype, you need to include `latex` in this list as this is
    -- the name of the parser)
    -- list of language that will be disabled
    -- Or use a function for more flexibility, e.g. to disable slow treesitter highlight for large files
    disable = function(lang, buf)
        local max_filesize = 100 * 1024 -- 100 KB
        local ok, stats = pcall(vim.loop.fs_stat, vim.api.nvim_buf_get_name(buf))
        if ok and stats and stats.size > max_filesize then
            return true
        end
    end,

    -- Setting this to true will run `:h syntax` and tree-sitter at the same time.
    -- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
    -- Using this option may slow down your editor, and you may see some duplicate highlights.
    -- Instead of true it can also be a list of languages
    additional_vim_regex_highlighting = false,
  },
}

require'nvim-treesitter.configs'.setup {
  textobjects = {
    select = {
      enable = true,

      -- Automatically jump forward to textobj, similar to targets.vim
      lookahead = true,

      keymaps = {
        -- You can use the capture groups defined in textobjects.scm
        ["af"] = "@function.outer",
        ["if"] = "@function.inner",
        ["ac"] = "@class.outer",
        -- You can optionally set descriptions to the mappings (used in the desc parameter of
        -- nvim_buf_set_keymap) which plugins like which-key display
        ["ic"] = { query = "@class.inner", desc = "Select inner part of a class region" },
        -- You can also use captures from other query groups like `locals.scm`
        ["as"] = { query = "@scope", query_group = "locals", desc = "Select language scope" },
      },
      -- You can choose the select mode (default is charwise 'v')
      --
      -- Can also be a function which gets passed a table with the keys
      -- * query_string: eg '@function.inner'
      -- * method: eg 'v' or 'o'
      -- and should return the mode ('v', 'V', or '<c-v>') or a table
      -- mapping query_strings to modes.
      selection_modes = {
        ['@parameter.outer'] = 'v', -- charwise
        ['@function.outer'] = 'V', -- linewise
        ['@class.outer'] = '<c-v>', -- blockwise
      },
      -- If you set this to `true` (default is `false`) then any textobject is
      -- extended to include preceding or succeeding whitespace. Succeeding
      -- whitespace has priority in order to act similarly to eg the built-in
      -- `ap`.
      --
      -- Can also be a function which gets passed a table with the keys
      -- * query_string: eg '@function.inner'
      -- * selection_mode: eg 'v'
      -- and should return true or false
      include_surrounding_whitespace = true,
    },
  },
}
require'nvim-treesitter.configs'.setup {
  textobjects = {
    swap = {
      enable = true,
      swap_next = {
        ["<leader>a"] = "@parameter.inner",
      },
      swap_previous = {
        ["<leader>A"] = "@parameter.inner",
      },
    },
  },
}
require'nvim-treesitter.configs'.setup {
  textobjects = {
    move = {
      enable = true,
      set_jumps = true, -- whether to set jumps in the jumplist
      goto_next_start = {
        ["]m"] = "@function.outer",
        ["]]"] = { query = "@class.outer", desc = "Next class start" },
        --
        -- You can use regex matching (i.e. lua pattern) and/or pass a list in a "query" key to group multiple queires.
        ["]o"] = "@loop.*",
        -- ["]o"] = { query = { "@loop.inner", "@loop.outer" } }
        --
        -- You can pass a query group to use query from `queries/<lang>/<query_group>.scm file in your runtime path.
        -- Below example nvim-treesitter's `locals.scm` and `folds.scm`. They also provide highlights.scm and indent.scm.
        ["]s"] = { query = "@scope", query_group = "locals", desc = "Next scope" },
        ["]z"] = { query = "@fold", query_group = "folds", desc = "Next fold" },
      },
      goto_next_end = {
        ["]M"] = "@function.outer",
        ["]["] = "@class.outer",
      },
      goto_previous_start = {
        ["[m"] = "@function.outer",
        ["[["] = "@class.outer",
      },
      goto_previous_end = {
        ["[M"] = "@function.outer",
        ["[]"] = "@class.outer",
      },
      -- Below will go to either the start or the end, whichever is closer.
      -- Use if you want more granular movements
      -- Make it even more gradual by adding multiple queries and regex.
      goto_next = {
        ["]d"] = "@conditional.outer",
      },
      goto_previous = {
        ["[d"] = "@conditional.outer",
      }
    },
  },
}

  end,

}
