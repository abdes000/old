local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)
vim.g.mapleader = " "
-- local opts = {}

require("lazy").setup({
  -- need to make import a string
  import = "plugins",
}, {
  import = {
    -- lazy-load lua files under "plugins" directory (see below)
    -- this will make it so you don't have to write require("plugins")
    -- when specifying a plugin
    -- this also supports glob patterns, for example to only load
    -- plugins in "plugins/ui", use "plugins.ui.*"
    -- you can also use this to lazy-load specs from other files
    -- e.g. import = "core.plugins", to load plugins from `lua/core/plugins.lua`
    lazy = true,
  },
  -- defaults for specs
  defaults = { lazy = true}  -- every spec is lazy-loaded by default (unless the spec says `lazy = false`)
},
{
  "folke/which-key.nvim",
  { "folke/neoconf.nvim", cmd = "Neoconf" },
  "folke/neodev.nvim",
})