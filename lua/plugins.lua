vim.pack.add({
	--	{src = "https://github.com/folke/tokyonight.nvim"},
	--	{src = "https://github.com/Aejkatappaja/sora"},
	--	{src = "https://github.com/vague-theme/vague.nvim"},
	{ src = "https://github.com/rebelot/kanagawa.nvim" },
})
require("kanagawa").setup({})

vim.pack.add({
	{ src = "https://github.com/mason-org/mason.nvim" },
})
require("mason").setup({})

vim.pack.add({
	{ src = "https://github.com/nvim-lualine/lualine.nvim" },
})
require("lualine").setup({})

vim.pack.add({
	{ src = "https://github.com/ibhagwan/fzf-lua" },
})

local actions = require("fzf-lua.actions")
require("fzf-lua").setup({
	winopts = { backdrop = 85 },
	keymap = {
		builtin = {
			["<C-f>"] = "preview-page-down",
			["<C-b>"] = "preview-page-up",
			["<C-p>"] = "toggle-preview",
		},
		fzf = {
			["ctrl-a"] = "toggle-all",
			["ctrl-t"] = "first",
			["ctrl-g"] = "last",
			["ctrl-d"] = "half-page-down",
			["ctrl-u"] = "half-page-up",
		}
	},
	actions = {
		files = {
			["ctrl-q"] = actions.file_sel_to_qf,
			["ctrl-n"] = actions.toggle_ignore,
			["ctrl-h"] = actions.toggle_hidden,
			["enter"] = actions.file_edit_or_qf,
		}
	}
})

vim.pack.add({
	{ src = "https://github.com/saghen/blink.cmp", version = vim.version.range("^1") },
})
require('blink.cmp').setup({
	fuzzy = { implementation = 'prefer_rust_with_warning' },
	signature = { enabled = true },
	keymap = {
		preset = "default",
		["<C-space>"] = {},
		["<C-p>"] = {},
		["<C-Tab>"] = {},
		["<S-Tab>"] = {},
		["<C-y>"] = { "show", "show_documentation", "hide_documentation" },
		["<Tab>"] = { "select_and_accept", "fallback" },
		["<C-k>"] = { "select_prev", "fallback" },
		["<C-j>"] = { "select_next", "fallback" },
		["<C-b>"] = { "scroll_documentation_down", "fallback" },
		["<C-f>"] = { "scroll_documentation_up", "fallback" },
		["<C-l>"] = { "snippet_forward", "fallback" },
		["<C-h>"] = { "snippet_backward", "fallback" },
	},
	appearance = {
		use_nvim_cmp_as_default = true,
		nerd_font_variant = "normal",
	},
	completion = {
		documentation = {
			auto_show = true,
			auto_show_delay_ms = 200,
		}
	},
	cmdline = {
		keymap = {
			preset = 'inherit',
			['<CR>'] = { "accept_and_enter", "fallback" },
		}
	},
	sources = { default = { "lsp" } }
})

vim.pack.add({
	{ src = "https://github.com/stevearc/oil.nvim" },
})
require("oil").setup({
	view_options = {
		show_hidden = true,
	},
})

vim.pack.add({
	{ src = "https://github.com/nvim-treesitter/nvim-treesitter" },
})
require("nvim-treesitter.config").setup({
	ensure_installed = { "lua", "rust", "go", "python", "bash", "sql", "markdown", "toml", "yaml", "json" },
})

vim.pack.add({
	{ src = "https://github.com/lewis6991/gitsigns.nvim" },
})
require("gitsigns").setup({
	signs = {
		add = { text = "│" },
		change = { text = "│" },
		delete = { text = "_" },
		topdelete = { text = "‾" },
		changedelete = { text = "~" },
	},
})

vim.pack.add({
	{ src = "https://github.com/stevearc/conform.nvim" },
})
require("conform").setup({
	formatters_by_ft = {
		lua = { "stylua" },
		rust = { "rustfmt" },
		python = { "ruff_format" },
		go = { "gofmt" },
		sh = { "shfmt" },
		bash = { "shfmt" },
	},
	format_on_save = function(bufnr)
		local ft = vim.bo[bufnr].filetype
		if ft == "go" or ft == "rust" then
			return { timeout_ms = 500, lsp_format = "fallback" }
		end
	end,
})

vim.pack.add({
	{ src = "https://github.com/windwp/nvim-autopairs" },
})
require("nvim-autopairs").setup({})

vim.pack.add({
	{ src = "https://github.com/folke/todo-comments.nvim" },
})
require("todo-comments").setup({})

vim.pack.add({
	{ src = "https://github.com/folke/which-key.nvim" },
})
require("which-key").setup({})

vim.pack.add({
	{ src = "https://github.com/mrcjkb/rustaceanvim" },
})

vim.pack.add({
	{ src = "https://github.com/karb94/neoscroll.nvim" },
})
require("neoscroll").setup({
	mappings = { "<C-u>", "<C-d>", "<C-b>", "<C-f>", "zt", "zz", "zb" },
	hide_cursor = true,
	stop_eof = true,
	easing = "quadratic",
})
