-- Set <space> as the leader key
-- See `:help mapleader`
--  NOTE: Must happen before plugins are loaded (otherwise wrong leader will be used)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Set to true if you have a Nerd Font installed and selected in the terminal
vim.g.have_nerd_font = true

vim.g.expandtab = true -- Convert tabs to spaces
vim.g.tabstop = 4 -- A tab counts as 4 spaces
vim.g.shiftwidth = 4 -- Indent by 4 spaces
vim.g.softtabstop = 4 -- Pressing <Tab> inserts 4 spaces
