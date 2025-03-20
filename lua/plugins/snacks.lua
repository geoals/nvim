return {
  "folke/snacks.nvim",
  opts = {
    scroll = {
      enabled = true,
      animate = {
        duration = { step = 10, total = 100 },
        easing = "linear",
      },
    },
    explorer = {},
  },
  keys = {
    {
      "<leader>fE",
      function()
        Snacks.explorer({ cwd = LazyVim.root(), hidden = true, ignored = true })
      end,
      desc = "Explorer Snacks (root dir)",
    },
    {
      "<leader>fe",
      function()
        Snacks.explorer({ hidden = true, ignored = true })
      end,
      desc = "Explorer Snacks (cwd)",
    },
    { "<leader>e", "<leader>fe", desc = "Explorer Snacks (cwd)", remap = true },
    { "<leader>E", "<leader>fE", desc = "Explorer Snacks (root dir)", remap = true },
  },
}
