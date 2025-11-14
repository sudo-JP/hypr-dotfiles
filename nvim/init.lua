require "lazy_setup"
require "classic_vim"
require "polish"


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

vim.api.nvim_create_autocmd("BufWritePre", {
  callback = function()
    -- Clear all LSP formatting autocmds for the current buffer
    pcall(function()
      vim.api.nvim_clear_autocmds({ group = "lsp_auto_format", buffer = 0 })
    end)
    -- Cancel any format-on-save action
    vim.b.disable_autoformat = true
  end,
})

-- Intercept AstroLSP's format function and make it do nothing if disabled
vim.api.nvim_create_autocmd("LspAttach", {
  callback = function(args)
    local bufnr = args.buf
    vim.lsp.buf.format = function()
      if vim.b.disable_autoformat then
        return
      end
      pcall(vim.lsp.buf.format)
    end
  end,
})

return {
  formatting = {
    format_on_save = false,
  },
}
