local o = vim.o
o.number = true
o.relativenumber = true 
o.tabstop = 4 
vim.g.swapfile = false
o.expandtab = true
o.shiftwidth = 4
o.softtabstop = 4
o.autoindent = true
vim.cmd("set clipboard=unnamedplus")
vim.cmd("colorscheme catppuccin")
vim.cmd("hi Normal guibg=NONE ctermbg=NONE ")
