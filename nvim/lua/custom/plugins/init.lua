-- TODO:
--  - train.nvim
--  - streamer.nvim
--  - { "AndrewRadev/splitjoin.vim", keys = { "gJ", "gS" }, }
--  - "pwntester/octo.nvim"
--  - neogit
--  - neorg
--  - which-key.nvim
--  - nvim-treesitter-context
--  - danymat/neogen
--  -     use "monaqa/dial.nvim"
--  -     use "gyim/vim-boxdraw"
--  -     use { "tjdevries/vim-inyoface", config = function() vim.api.nvim_set_keymap("n", "<leader>cc", "<Plug>(InYoFace_Toggle)", {}) end, }
--  - /home/tjdevries/plugins/stackmap.nvim

return {
  { dir = "~/plugins/plenary.nvim" },
  { dir = "~/plugins/streamer-tools" },

  { dir = "~/plugins/monkey.nvim" },
  { dir = "~/plugins/vim9jit" },
  { dir = "~/plugins/colorbuddy.nvim" },
  { dir = "~/plugins/gruvbuddy.nvim" },
  { dir = "~/plugins/cyclist.vim" },
  { dir = "~/plugins/express_line.nvim" },
  { dir = "~/plugins/overlength.vim" },
  { dir = "~/plugins/complextras.nvim" },
  { dir = "~/plugins/sg.nvim" },

  -- "~/plugins/diff-therapy.nvim",
  -- "~/plugins/pastery.vim",

  { dir = "~/plugins/green_light.nvim" },

  "milisims/nvim-luaref",
  "tpope/vim-surround",
  "godlygeek/tabular", -- Quickly align text by pattern
  "tpope/vim-repeat", -- Repeat actions better
  "tpope/vim-abolish", -- Cool things with words!
  "tpope/vim-characterize", -- ?
  "tpope/vim-scriptease",
  "romainl/vim-qf",

  "mkitt/tabline.vim",
  "monaqa/dial.nvim",

  {
    "luukvbaal/statuscol.nvim",
    config = function()
      require("statuscol").setup {
        setopt = true,
      }
    end,
  },

  {
    "glacambre/firenvim",
    build = function()
      vim.fn["firenvim#install"](0)
    end,
  },

  "Eandrju/cellular-automaton.nvim",
}
