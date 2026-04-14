vim.keymap.set("n", "<leader>e", "<Cmd>Oil<CR>")


local fzf = require("fzf-lua")

vim.keymap.set("n", "<leader><leader>", fzf.files)
vim.keymap.set("n", "<leader>/", fzf.live_grep)
vim.keymap.set("n", "<leader>b", fzf.buffers)


local opts = {noremap = true, silent = true}

vim.keymap.set("n", "gd", "<cmd>lua vim.lsp.buf.definition()<CR>", opts)
vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
vim.keymap.set("n", "<leader>o", "<C-o>", opts)
vim.keymap.set("n", "<leader>fo", function() require("conform").format({ lsp_format = "fallback" }) end, opts)

-- gitsigns
vim.keymap.set("n", "<leader>gb", "<Cmd>Gitsigns blame_line<CR>", opts)
vim.keymap.set("n", "<leader>gp", "<Cmd>Gitsigns preview_hunk<CR>", opts)
vim.keymap.set("n", "<leader>gr", "<Cmd>Gitsigns reset_hunk<CR>", opts)
vim.keymap.set("n", "]h", "<Cmd>Gitsigns next_hunk<CR>", opts)
vim.keymap.set("n", "[h", "<Cmd>Gitsigns prev_hunk<CR>", opts)

-- todo-comments
vim.keymap.set("n", "<leader>ft", "<Cmd>TodoFzfLua<CR>", opts)
