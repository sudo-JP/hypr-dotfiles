require "lazy_setup"
require "classic_vim"
require "polish"


-- In your init.lua or relevant config file:

require("neo-tree").setup({
  filesystem = {
    filtered_items = {
      visible = true, -- This is what you want: If you set this to `true`, all "hide" just mean "dimmed out"
      hide_dotfiles = false,
      hide_gitignored = true,
    }
  },
  -- Set Neo-tree to use the Sorbet theme
  window = {
    position = "left",  -- Customize position if needed
    width = 40,         -- Adjust window width if desired
    theme = "catppuccin",   
  },
  -- Other Neo-tree settings...
})

-- Apply the highlight and theme change after opening Neo-tree
vim.api.nvim_create_autocmd("BufWinEnter", {
  pattern = "*",  -- Applies to all buffers
  callback = function()
    -- Check if the current buffer is a Neo-tree buffer
    if vim.bo.filetype == "neo-tree" then
      -- Set Neo-tree to use the sorbet theme
      vim.cmd("colorscheme catppuccin")
      
      -- Set Normal highlight to transparent background
      vim.cmd("hi Normal guibg=NONE ctermbg=NONE")
    end
  end,
})





