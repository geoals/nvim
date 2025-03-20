-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

vim.keymap.set("x", "<leader>p", [["_dP]], { desc = "Paste without overwriting the default register" })
vim.keymap.set({ "n", "v" }, "<leader>d", [["_d]], { desc = "Delete without overwriting the default register" })
vim.keymap.set({ "n", "v" }, "<leader>wc", [[:lcd %:p:h<CR>]], { desc = "Set CWD to here" })
vim.keymap.set("n", "<leader>fs", ":w<CR>", { desc = "Save buffer" })

vim.keymap.set("n", "<leader>ghr", function()
  local buf_id = vim.api.nvim_get_current_buf()
  local cursor_line = vim.api.nvim_win_get_cursor(0)[1]
  require("mini.diff").do_hunks(buf_id, "reset", {
    line_start = cursor_line,
    line_end = cursor_line,
  })
end, { desc = "Reset git hunk at cursor" })

vim.keymap.set("n", "<leader>fp", function()
  require("custom.projects").list_projects()
end, { desc = "Custom Projects" })

vim.keymap.set("n", "<leader>fP", function()
  require("custom.projects").add_project()
end, { desc = "Add Project" })

-- Swap cwd and root dir
vim.keymap.set("n", "<leader>ff", LazyVim.pick("files", { root = false }), { desc = "Find Files (cwd)" })
vim.keymap.set("n", "<leader>fF", LazyVim.pick("files"), { desc = "Find Files (Root Dir)" })
vim.keymap.set("n", "<leader>sg", LazyVim.pick("live_grep", { root = false }), { desc = "Grep (cwd)" })
vim.keymap.set("n", "<leader>sG", LazyVim.pick("live_grep"), { desc = "Grep (Root Dir)" })

vim.keymap.set("n", "<leader>fT", function()
  Snacks.terminal(nil, { cwd = LazyVim.root() })
end, { desc = "Terminal (Root Dir)" })

vim.keymap.set("n", "<leader>ft", function()
  Snacks.terminal()
end, { desc = "Terminal (cwd)" })

vim.keymap.set("n", "<c-/>", function()
  Snacks.terminal()
end, { desc = "Terminal (cwd)" })

-- TODO: add keymap for yanking currect working directory or the directory of current buffer

-- TODO: continuation comment stop it pls
--
-- TODO: change leader s g to continue sarch (also file)
