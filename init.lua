require("plugins")
require("autoclose").setup()
require("onedark").load()
require("mason").setup()
-- vim.opt.termguicolors = true

require("mason-lspconfig").setup({
	ensure_installed = { "lua_ls", "tsserver", "java_language_server", "pyright" },
})
require("lspconfig").lua_ls.setup({})
require("lspconfig").tsserver.setup({})
require("lspconfig").java_language_server.setup({})
require("lspconfig").pyright.setup({})

require("mason-tool-installer").setup({
	ensure_installed = {
		"prettier",
		"prettierd",
		"ktlint",
		"eslint_d",
		"google-java-format",
		"stylua",
		"phpcbf",
		"black",
	},
})

require("conform").setup({
	formatters_by_ft = {
		lua = { "stylua" },
		javascript = { { "prettierd", "prettier" } },
		typescript = { { "prettierd", "prettier" } },
		javascriptreact = { { "prettierd", "prettier" } },
		typescriptreact = { { "prettierd", "prettier" } },
		json = { { "prettierd", "prettier" } },
		java = { "google-java-format" },
		kotlin = { "ktlint" },
		html = { "prettier" },
		css = { { "prettierd", "prettier" } },
		scss = { { "prettierd", "prettier" } },
		php = { "phpcbf" },
		pthon = { "black" },
	},
	format_on_save = {
		-- These options will be passed to conform.format()
		timeout_ms = 500,
		lsp_fallback = true,
	},
})

vim.api.nvim_create_autocmd("BufWritePre", {
	pattern = "*",
	callback = function(args)
		require("conform").format({ bufnr = args.buf })
	end,
})

require("transparent").setup({ -- Optional, you don't have to run setup.
	groups = { -- table: default groups
		"Normal",
		"NormalNC",
		"Comment",
		"Constant",
		"Special",
		"Identifier",
		"Statement",
		"PreProc",
		"Type",
		"Underlined",
		"Todo",
		"String",
		"Function",
		"Conditional",
		"Repeat",
		"Operator",
		"Structure",
		"LineNr",
		"NonText",
		"SignColumn",
		"CursorLine",
		"CursorLineNr",
		"StatusLine",
		"StatusLineNC",
		"EndOfBuffer",
	},
	extra_groups = {}, -- table: additional groups that should be cleared
	exclude_groups = {}, -- table: groups you don't want to clear
})
require("transparent").clear_prefix("NeoTree")

-- Toggle NvimTree with Ctrl + n
vim.keymap.set("n", "<C-n>", "<Cmd>Neotree toggle<CR>")

--vim.o.termguicolors = true -- True color support
vim.o.tabstop = 4 -- Number of spaces tabs count for
vim.o.shiftwidth = 4 -- Number of spaces to use for autoindent
vim.o.expandtab = true -- Use spaces instead of tabs
-- Display settings
vim.o.number = true -- Show line numbers
--vim.o.cursorline = true -- Highlight the current line

local builtin = require("telescope.builtin")
vim.keymap.set("n", "<leader>ff", builtin.find_files, {})
vim.keymap.set("n", "<leader>fg", builtin.live_grep, {})
vim.keymap.set("n", "<leader>fb", builtin.buffers, {})
vim.keymap.set("n", "<leader>fh", builtin.help_tags, {})

-- vim.cmd('autocmd VimEnter * colorscheme tokyonight')

require("nvim-treesitter.configs").setup({
	highlight = {
		enable = true,
		additional_vim_regex_highlighting = false,
	},
})

--nvim-cmp
local has_words_before = function()
	unpack = unpack or table.unpack
	local line, col = unpack(vim.api.nvim_win_get_cursor(0))
	return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
end

local feedkey = function(key, mode)
	vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes(key, true, true, true), mode, true)
end

local cmp = require("cmp")
cmp.setup({
	snippet = {
		-- REQUIRED - you must specify a snippet engine
		expand = function(args)
			vim.fn["vsnip#anonymous"](args.body)
		end,
	},
	window = {
		completion = cmp.config.window.bordered(),
		documentation = cmp.config.window.bordered(),
	},
	mapping = cmp.mapping.preset.insert({
		["<C-b>"] = cmp.mapping.scroll_docs(-4),
		["<C-f>"] = cmp.mapping.scroll_docs(4),
		["<C-Space>"] = cmp.mapping.complete(),
		["<C-e>"] = cmp.mapping.abort(),
		["<CR>"] = cmp.mapping.confirm({ select = false }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
		-- Super-Tab like mappings
		-- https://github.com/hrsh7th/nvim-cmp/wiki/Example-mappings#vim-vsnip
		["<Tab>"] = cmp.mapping(function(fallback)
			if cmp.visible() then
				cmp.select_next_item()
			elseif vim.fn["vsnip#available"](1) == 1 then
				feedkey("<Plug>(vsnip-expand-or-jump)", "")
			elseif has_words_before() then
				cmp.complete()
			else
				fallback() -- The fallback function sends a already mapped key. In this case, it's probably `<Tab>`.
			end
		end, { "i", "s" }),

		["<S-Tab>"] = cmp.mapping(function()
			if cmp.visible() then
				cmp.select_prev_item()
			elseif vim.fn["vsnip#jumpable"](-1) == 1 then
				feedkey("<Plug>(vsnip-jump-prev)", "")
			end
		end, { "i", "s" }),
	}),
	sources = cmp.config.sources({
		{ name = "vsnip" }, -- For ultisnips users.
		{ name = "nvim_lsp" },
	}, {
		{ name = "buffer" },
	}),
})

--
-- Use buffer source for `/` and `?` (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline({ "/", "?" }, {
	mapping = cmp.mapping.preset.cmdline(),
	sources = {
		{ name = "buffer" },
	},
})
--
-- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline(":", {
	mapping = cmp.mapping.preset.cmdline(),
	sources = cmp.config.sources({
		{ name = "path" },
	}, {
		{ name = "cmdline" },
	}),
})
