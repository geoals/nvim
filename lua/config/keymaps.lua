-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

vim.keymap.set("x", "<leader>p", [["_dP]], { desc = "Paste without overwriting the default register" })
vim.keymap.set({ "n", "v" }, "<leader>d", [["_d]], { desc = "Delete without overwriting the default register" })
vim.keymap.set({ "n", "v" }, "<leader>wc", [[:lcd %:p:h<CR>]], { desc = "Set CWD to here" })
vim.keymap.set("n", "<leader>fs", ":w<CR>", { desc = "Save buffer" })
