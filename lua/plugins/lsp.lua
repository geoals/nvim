return {
  "neovim/nvim-lspconfig",
  opts = {
    servers = {
      -- Explicitly disable marksman
      marksman = false,
    },
  },
}
