--------------------------------------------------
-- Basic settings
--------------------------------------------------

vim.opt.clipboard:append("unnamedplus")
vim.opt.formatoptions:append("a")

vim.opt.expandtab = true
vim.opt.tabstop = 2
vim.opt.softtabstop = 2
vim.opt.shiftwidth = 2

vim.opt.termguicolors = true
vim.opt.background = "dark"

vim.opt.showcmd = true
vim.opt.showmatch = true

vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.incsearch = true

vim.opt.autowrite = true

vim.opt.number = true
vim.opt.mouse = "a"
vim.opt.wrap = true

vim.opt.modelines = 0

vim.cmd("syntax enable")
vim.cmd("filetype plugin indent on")

--------------------------------------------------
-- Bootstrap lazy.nvim
--------------------------------------------------

local lazypath =
vim.fn.stdpath("data") ..
"/lazy/lazy.nvim"

if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    lazypath
  })
end

vim.opt.rtp:prepend(lazypath)

--------------------------------------------------
-- Plugins
--------------------------------------------------

require("lazy").setup({

  {
    "tpope/vim-sensible",
    lazy = false,
  },

  {
    "ellisonleao/gruvbox.nvim",
    priority = 1000,
    config = function()
      vim.o.background = "dark"
      vim.cmd.colorscheme("gruvbox")
    end,
  },

  {
    "preservim/nerdtree",
  },

  {
    "hashivim/vim-terraform",
  },

  {
    "rodjek/vim-puppet",
  },

  {
    "pearofducks/ansible-vim",
  },

  {
    "stephpy/vim-yaml",
  },

  {
    "tpope/vim-fugitive",
  },

})

--------------------------------------------------
-- Better YAML detection for Ansible
--------------------------------------------------

vim.api.nvim_create_autocmd(
{
  "BufRead",
  "BufNewFile"
},
{
  pattern = {
    "*.yml",
    "*.yaml"
  },
  callback = function()
    vim.bo.filetype =
    "yaml.ansible"
  end
})

--------------------------------------------------
-- NERDTree mappings
--------------------------------------------------

vim.keymap.set(
"n",
"<leader>n",
"<cmd>NERDTreeFocus<CR>"
)

vim.keymap.set(
"n",
"<C-n>",
"<cmd>NERDTree<CR>"
)

vim.keymap.set(
"n",
"<C-t>",
"<cmd>NERDTreeToggle<CR>"
)

vim.keymap.set(
"n",
"<C-f>",
"<cmd>NERDTreeFind<CR>"
)

--------------------------------------------------
-- Open NERDTree if opening a directory
--------------------------------------------------

vim.api.nvim_create_autocmd(
"VimEnter",
{
callback =
function()

local dir =
vim.fn.argv(0)

if vim.fn.argc() == 1
and
vim.fn.isdirectory(dir)
== 1 then

vim.cmd(
"NERDTree "
..
dir
)

vim.cmd(
"wincmd p"
)

end
end
}
)

--------------------------------------------------
-- Close NERDTree automatically
--------------------------------------------------

vim.api.nvim_create_autocmd(
"BufEnter",
{
callback =
function()

if
vim.fn.tabpagenr(
"$"
)
==
1
and
vim.fn.winnr(
"$"
)
==
1
and
vim.b.NERDTree
then

vim.cmd(
"quit"
)

end
end
}
)

--------------------------------------------------
-- Clipboard mappings
--------------------------------------------------

vim.keymap.set(
{"n","v"},
"<C-c>",
'"+y'
)

--------------------------------------------------
-- Paste toggle (Neovim compatible)
--------------------------------------------------

vim.keymap.set(
"n",
"<F2>",
function()

vim.o.paste =
not
vim.o.paste

print(
"paste: "
..
tostring(
vim.o.paste
)
)

end
)

--------------------------------------------------
-- Statusline
--------------------------------------------------

vim.opt.statusline =
"%<%f %h%m%r"
..
"%{FugitiveStatusline()}"
..
"%=%-14.(%l,%c%V%) %P"
