return {
  "nvim-neo-tree/neo-tree.nvim",
  opts = {
    filesystem = {
      filtered_items = {
        visible = true, -- Show hidden files by default
        hide_dotfiles = false, -- Show dotfiles
        hide_gitignored = false, -- Show gitignored files
        hide_by_name = { -- Optionally exclude specific files/folders
          "node_modules",
          "thumbs.db",
        },
        never_show = { -- Always hide these
          ".git",
          ".DS_Store",
          ".history",
        },
      },
    },
  },
}
