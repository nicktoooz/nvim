-- Load required plugins
require("plugins")

-- OneDark theme setup
require("onedark").load()
require("transparent").setup({})
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
vim.opt.swapfile = false
vim.opt.wrap = false
vim.opt.termguicolors = true
-- LSP Setup for lua, typescript, python, java, csharp, kotlin
local lspconfig = require("lspconfig")
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true -- Enable snippet support

-- Lua LSP
require("lspconfig").lua_ls.setup({
	on_init = function(client)
		if client.workspace_folders then
			local path = client.workspace_folders[1].name
			if vim.loop.fs_stat(path .. "/.luarc.json") or vim.loop.fs_stat(path .. "/.luarc.jsonc") then
				return
			end
		end

		client.config.settings.Lua = vim.tbl_deep_extend("force", client.config.settings.Lua, {
			runtime = {
				-- Tell the language server which version of Lua you're using
				-- (most likely LuaJIT in the case of Neovim)
				version = "LuaJIT",
			},
			-- Make the server aware of Neovim runtime files
			workspace = {
				checkThirdParty = false,
				library = {
					vim.env.VIMRUNTIME,
					-- Depending on the usage, you might want to add additional paths here.
					-- "${3rd}/luv/library"
					-- "${3rd}/busted/library",
				},
				-- or pull in all of 'runtimepath'. NOTE: this is a lot slower and will cause issues when working on your own configuration (see https://github.com/neovim/nvim-lspconfig/issues/3189)
				-- library = vim.api.nvim_get_runtime_file("", true)
			},
		})
	end,
	settings = {
		Lua = {},
	},
})
-- TypeScript/JavaScript LSP (ts_ls)
lspconfig.ts_ls.setup({
	capabilities = capabilities,
})

lspconfig.tailwindcss.setup({})
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
lspconfig.intelephense.setup({
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

local configs = require("lspconfig.configs")

--if not configs.ls_emmet then
--	configs.ls_emmet = {
--		default_config = {
--			cmd = { "ls_emmet", "--stdio" },
--			filetypes = {
--				"html",
--				"css",
--				"scss",
--				"javascriptreact",
--				"typescriptreact",
--				"haml",
--				"xml",
--				"xsl",
--				"pug",
--				"slim",
--				"sass",
--				"stylus",
--				"less",
--				"sss",
--				"hbs",
--				"blade",
--				"handlebars",
--			},
--			root_dir = function(fname)
--				return vim.loop.cwd()
--			end,
--			settings = {},
--		},
--	}
--end
--
--lspconfig.ls_emmet.setup({ capabilities = capabilities })

lspconfig.emmet_language_server.setup({
	filetypes = {
		"css",
		"eruby",
		"html",
		"javascript",
		"javascriptreact",
		"less",
		"sass",
		"scss",
		"pug",
		"blade",
		"typescriptreact",
	},
	-- Read more about this options in the [vscode docs](https://code.visualstudio.com/docs/editor/emmet#_emmet-configuration).
	-- **Note:** only the options listed in the table are supported.
	init_options = {
		---@type table<string, string>
		includeLanguages = {},
		--- @type string[]
		excludeLanguages = {},
		--- @type string[]
		extensionsPath = {},
		--- @type table<string, any> [Emmet Docs](https://docs.emmet.io/customization/preferences/)
		preferences = {},
		--- @type boolean Defaults to `true`
		showAbbreviationSuggestions = true,
		--- @type "always" | "never" Defaults to `"always"`
		showExpandedAbbreviation = "always",
		--- @type boolean Defaults to `false`
		showSuggestionsAsSnippets = false,
		--- @type table<string, any> [Emmet Docs](https://docs.emmet.io/customization/syntax-profiles/)
		syntaxProfiles = {},
		--- @type table<string, string> [Emmet Docs](https://docs.emmet.io/customization/snippets/#variables)
		variables = {},
	},
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
		["<C-Down>"] = cmp.mapping.select_next_item(), -- Move to next suggestion
		["<C-Up>"] = cmp.mapping.select_prev_item(), -- Move to previous suggestion
		["<C-d>"] = cmp.mapping.scroll_docs(-4), -- Scroll documentation up
		["<C-f>"] = cmp.mapping.scroll_docs(4), -- Scroll documentation down
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

local parser_config = require("nvim-treesitter.parsers").get_parser_configs()
parser_config.blade = {
	install_info = {
		url = "https://github.com/EmranMR/tree-sitter-blade",
		files = { "src/parser.c" },
		branch = "main",
	},
	filetype = "blade",
}

vim.filetype.add({
	pattern = {
		[".*%.blade%.php"] = "blade",
	},
})

-- Custom indentation settings for Blade files
vim.cmd([[
  augroup BladeIndentation
    autocmd!
    autocmd FileType html,blade setlocal tabstop=4 shiftwidth=4 softtabstop=4 expandtab
  augroup END
]])

vim.api.nvim_create_autocmd("VimEnter", {
	callback = function()
		vim.cmd("Neotree") -- Toggles the NeoTree window
		vim.cmd("TransparentEnable")
	end,
})

-- Autosave
vim.api.nvim_create_autocmd({ "BufLeave", "FocusLost", "VimLeavePre" }, {
	callback = function(event)
		if vim.api.nvim_buf_get_option(event.buf, "modified") then
			vim.schedule(function()
				vim.api.nvim_buf_call(event.buf, function()
					vim.cmd("silent! write")
				end)
			end)
		end
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
		javascript = { "prettierd" },
		typescript = { "prettierd" },
		javascriptreact = { "prettierd" },
		typescriptreact = { "prettierd" },
		json = { "prettierd" },
		java = { "google-java-format" },
		kotlin = { "ktlint" },
		html = { "prettier" },
		css = { "prettierd" },
		scss = { "prettierd" },
		php = { "phpcbf" },
		blade = { "blade-formatter" },
	},
	format_on_save = {
		timeout_ms = 2000,
		lsp_fallback = true,
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

vim.keymap.set("n", "<leader>r", ":RunCode<CR>", { noremap = true, silent = false })
vim.keymap.set("n", "<leader>rf", ":RunFile<CR>", { noremap = true, silent = false })
vim.keymap.set("n", "<leader>rft", ":RunFile tab<CR>", { noremap = true, silent = false })
vim.keymap.set("n", "<leader>rp", ":RunProject<CR>", { noremap = true, silent = false })
vim.keymap.set("n", "<leader>rc", ":RunClose<CR>", { noremap = true, silent = false })
vim.keymap.set("n", "<leader>crf", ":CRFiletype<CR>", { noremap = true, silent = false })
vim.keymap.set("n", "<leader>crp", ":CRProjects<CR>", { noremap = true, silent = false })

-- Comment.nvim
-- Bind Ctrl+, to toggle comment using Comment.nvim
vim.api.nvim_set_keymap(
	"n",
	"<C-/>",
	':lua require("Comment.api").toggle.linewise.current()<CR>',
	{ noremap = true, silent = true }
)
vim.api.nvim_set_keymap(
	"v",
	"<C-/>",
	':lua require("Comment.api").toggle.linewise(vim.fn.visualmode())<CR>',
	{ noremap = true, silent = true }
)

-- Treesitter setup
require("nvim-treesitter.configs").setup({
	highlight = {
		enable = true,
		additional_vim_regex_highlighting = false,
	},
	sync_install = false,
	auto_install = true,
})

require("flutter-tools").setup({})
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
