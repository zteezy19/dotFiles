return {
  "nvim-neo-tree/neo-tree.nvim",
  opts = function(_, opts)
    opts.window.position = "right"
    -- Add any other customizations you had in the original editor.lua
    return opts
  end,
}
