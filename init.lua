-- Load required plugins
require("plugins")

-- OneDark theme setup
require("onedark").load()

-- Auto-close and Transparent settings
require("autoclose").setup()
require("transparent").setup({
	groups = {
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
	extra_groups = {},
	exclude_groups = {},
})
require("transparent").clear_prefix("NeoTree")

-- Mason setup for LSP and tools
require("mason").setup()
require("mason-lspconfig").setup({
	ensure_installed = { "lua_ls", "ts_ls", "jdtls", "pyright", "omnisharp", "kotlin_language_server" },
})
require("mason-tool-installer").setup({
	ensure_installed = {
		"prettier",
		"prettierd",
		"ktlint",
		"google-java-format",
		"stylua",
		"phpcbf",
	},
})
vim.o.tabstop = 4 -- Number of spaces tabs count for
vim.o.shiftwidth = 4 -- Number of spaces to use for autoindent
vim.o.expandtab = true -- Use spaces instead of tabs
-- Display settings
vim.o.number = true -- Show line numbers

-- LSP Setup for lua, typescript, python, java, csharp, kotlin
local lspconfig = require("lspconfig")
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true -- Enable snippet support

-- Lua LSP
lspconfig.lua_ls.setup({
	capabilities = capabilities,
})

-- TypeScript/JavaScript LSP (ts_ls)
lspconfig.ts_ls.setup({
	capabilities = capabilities,
})

-- Python LSP (pyright)
lspconfig.pyright.setup({
	capabilities = capabilities,
	on_attach = function(client, bufnr)
		local map = function(mode, lhs, rhs)
			vim.api.nvim_buf_set_keymap(bufnr, mode, lhs, rhs, { noremap = true, silent = true })
		end

		map("n", "gd", "<cmd>lua vim.lsp.buf.definition()<CR>")
		map("n", "K", "<cmd>lua vim.lsp.buf.hover()<CR>")
		map("n", "gr", "<cmd>lua vim.lsp.buf.references()<CR>")
	end,
})

-- Java LSP (jdtls)
lspconfig.jdtls.setup({
	capabilities = capabilities,
	on_attach = function(client, bufnr)
		local map = function(mode, lhs, rhs)
			vim.api.nvim_buf_set_keymap(bufnr, mode, lhs, rhs, { noremap = true, silent = true })
		end

		-- Keymaps for Java LSP
		map("n", "gd", "<cmd>lua vim.lsp.buf.definition()<CR>")
		map("n", "K", "<cmd>lua vim.lsp.buf.hover()<CR>")
		map("n", "gr", "<cmd>lua vim.lsp.buf.references()<CR>")
	end,
	init_options = {
		extendedClientCapabilities = {
			documentFormattingProvider = true,
			hoverProvider = true,
			workspaceSymbolProvider = true,
		},
	},
})

-- C# LSP (omnisharp)
lspconfig.omnisharp.setup({
	capabilities = capabilities,
	on_attach = function(client, bufnr)
		local map = function(mode, lhs, rhs)
			vim.api.nvim_buf_set_keymap(bufnr, mode, lhs, rhs, { noremap = true, silent = true })
		end

		map("n", "gd", "<cmd>lua vim.lsp.buf.definition()<CR>")
		map("n", "K", "<cmd>lua vim.lsp.buf.hover()<CR>")
		map("n", "gr", "<cmd>lua vim.lsp.buf.references()<CR>")
	end,
})

-- Kotlin LSP (kotlin-language-server)
lspconfig.kotlin_language_server.setup({
	capabilities = capabilities,
	on_attach = function(client, bufnr)
		local map = function(mode, lhs, rhs)
			vim.api.nvim_buf_set_keymap(bufnr, mode, lhs, rhs, { noremap = true, silent = true })
		end

		map("n", "gd", "<cmd>lua vim.lsp.buf.definition()<CR>")
		map("n", "K", "<cmd>lua vim.lsp.buf.hover()<CR>")
		map("n", "gr", "<cmd>lua vim.lsp.buf.references()<CR>")
	end,
})

-- nvim-cmp setup
local cmp = require("cmp")

cmp.setup({
	snippet = {
		expand = function(args)
			require("luasnip").lsp_expand(args.body)
		end,
	},
	mapping = {
		["<C-p>"] = cmp.mapping.select_prev_item(),
		["<C-n>"] = cmp.mapping.select_next_item(),
		["<C-d>"] = cmp.mapping.scroll_docs(-4),
		["<C-u>"] = cmp.mapping.scroll_docs(4),
		["<C-Space>"] = cmp.mapping.complete(),
		["<C-e>"] = cmp.mapping.close(),
		["<CR>"] = cmp.mapping.confirm({ select = true }),
	},
	sources = {
		{ name = "nvim_lsp" }, -- Ensure LSP completions are available
		{ name = "buffer" },
		{ name = "path" },
		{ name = "luasnip" },
	},
})

vim.api.nvim_create_autocmd("VimEnter", {
	callback = function()
		vim.cmd("Neotree") -- Toggles the NeoTree window
	end,
})

-- nvim-cmp setup for command line
cmp.setup.cmdline({ "/", "?" }, {
	mapping = cmp.mapping.preset.cmdline(),
	sources = {
		{ name = "buffer" },
	},
})

cmp.setup.cmdline(":", {
	mapping = cmp.mapping.preset.cmdline(),
	sources = cmp.config.sources({
		{ name = "path" },
	}, {
		{ name = "cmdline" },
	}),
})

-- Conform setup for auto-formatting
require("conform").setup({
	formatters_by_ft = {
		lua = { "stylua" },
		javascript = { "prettierd", "prettier" },
		typescript = { "prettierd", "prettier" },
		javascriptreact = { "prettierd", "prettier" },
		typescriptreact = { "prettierd", "prettier" },
		json = { "prettierd", "prettier" },
		java = { "google-java-format" },
		kotlin = { "ktlint" },
		html = { "prettier" },
		css = { "prettierd", "prettier" },
		scss = { "prettierd", "prettier" },
		php = { "phpcbf" },
	},
	format_on_save = {
		timeout_ms = 500,
		lsp_fallback = true,
	},
})

require("code_runner").setup({
	filetype = {
		java = {
			"cd $dir &&",
			"javac $fileName &&",
			"java $fileNameWithoutExt",
		},
		python = "python3 -u",
		typescript = "deno run",
		rust = {
			"cd $dir &&",
			"rustc $fileName &&",
			"$dir/$fileNameWithoutExt",
		},
		c = function(...)
			c_base = {
				"cd $dir &&",
				"gcc $fileName -o",
				"/tmp/$fileNameWithoutExt",
			}
			local c_exec = {
				"&& /tmp/$fileNameWithoutExt &&",
				"rm /tmp/$fileNameWithoutExt",
			}
			vim.ui.input({ prompt = "Add more args:" }, function(input)
				c_base[4] = input
				vim.print(vim.tbl_extend("force", c_base, c_exec))
				require("code_runner.commands").run_from_fn(vim.list_extend(c_base, c_exec))
			end)
		end,
	},
})

-- Autocmd to format on save
vim.api.nvim_create_autocmd("BufWritePre", {
	pattern = "*",
	callback = function(args)
		require("conform").format({ bufnr = args.buf })
	end,
})

-- Key mappings
vim.api.nvim_set_keymap("v", "<C-c>", '"+y', { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<C-v>", '"+p', { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<Esc><Esc>", ":noh<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<Leader>n", ":enew<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("v", "<C-c>", ":w !xclip -selection clipboard<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<C-v>", ":r !xclip -o -selection clipboard<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "<C-n>", "<Cmd>Neotree toggle<CR>")

-- JDTLS LSP keymaps (for Java development)
vim.api.nvim_set_keymap("n", "gd", "<Cmd>lua vim.lsp.buf.definition()<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "gr", "<Cmd>lua vim.lsp.buf.references()<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "K", "<Cmd>lua vim.lsp.buf.hover()<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<leader>rn", "<Cmd>lua vim.lsp.buf.rename()<CR>", { noremap = true, silent = true })

-- Telescope key mappings
local builtin = require("telescope.builtin")
vim.keymap.set("n", "<leader>ff", builtin.find_files, {})
vim.keymap.set("n", "<leader>fg", builtin.live_grep, {})
vim.keymap.set("n", "<leader>fb", builtin.buffers, {})
vim.keymap.set("n", "<leader>fh", builtin.help_tags, {})

-- Resize windows using leader + arrow keys
vim.api.nvim_set_keymap("n", "<leader><Left>", ":vertical resize -2<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<leader><Right>", ":vertical resize +2<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<leader><Up>", ":resize -2<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<leader><Down>", ":resize +2<CR>", { noremap = true, silent = true })

vim.api.nvim_set_keymap(
	"n",
	"<Leader>t",
	":lua require('ide.components.terminal').toggle()<CR>",
	{ noremap = true, silent = true }
)

vim.keymap.set("n", "<leader>r", ":RunCode<CR>", { noremap = true, silent = false })
vim.keymap.set("n", "<leader>rf", ":RunFile<CR>", { noremap = true, silent = false })
vim.keymap.set("n", "<leader>rft", ":RunFile tab<CR>", { noremap = true, silent = false })
vim.keymap.set("n", "<leader>rp", ":RunProject<CR>", { noremap = true, silent = false })
vim.keymap.set("n", "<leader>rc", ":RunClose<CR>", { noremap = true, silent = false })
vim.keymap.set("n", "<leader>crf", ":CRFiletype<CR>", { noremap = true, silent = false })
vim.keymap.set("n", "<leader>crp", ":CRProjects<CR>", { noremap = true, silent = false })

-- Treesitter setup
require("nvim-treesitter.configs").setup({
	highlight = {
		enable = true,
		additional_vim_regex_highlighting = false,
	},
	sync_install = false,
	auto_install = true,
})

-- Enable LSP debug logs
vim.lsp.set_log_level("debug")

-- nvim-cmp setup (for autocompletion)
local has_words_before = function()
	local line, col = unpack(vim.api.nvim_win_get_cursor(0))
	return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
end

local feedkey = function(key, mode)
	vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes(key, true, true, true), mode, true)
end
