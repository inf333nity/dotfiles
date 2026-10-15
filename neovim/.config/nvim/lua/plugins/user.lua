---@type LazySpec
return {
  {
    
    "nvim-neo-tree/neo-tree.nvim",
    opts = {
      filesystem = {
        filtered_items = {
          visible = true,
          hide_dotfiles = false,
          hide_gitignored = false,
        },
      },
    },
  },

  {
    "nvim-neo-tree/neo-tree.nvim",
    opts = {
      source_selector = {
        winbar = false,
        statusline = false,
      },
    },
  },

  -- Перенос длинных строк только в Markdown
  {
    "AstroNvim/astrocore",
    opts = {
      autocmds = {
        markdown_wrap = {
          {
            event = "FileType",
            pattern = "markdown",
            callback = function()
              vim.opt_local.wrap = true
              vim.opt_local.linebreak = true
              vim.opt_local.breakindent = true
            end,
          },
        },
      },
    },
  },
}
