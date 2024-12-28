-- Automatically generated packer.nvim plugin loader code

if vim.api.nvim_call_function('has', {'nvim-0.5'}) ~= 1 then
  vim.api.nvim_command('echohl WarningMsg | echom "Invalid Neovim version for packer.nvim! | echohl None"')
  return
end

vim.api.nvim_command('packadd packer.nvim')

local no_errors, error_msg = pcall(function()

_G._packer = _G._packer or {}
_G._packer.inside_compile = true

local time
local profile_info
local should_profile = false
if should_profile then
  local hrtime = vim.loop.hrtime
  profile_info = {}
  time = function(chunk, start)
    if start then
      profile_info[chunk] = hrtime()
    else
      profile_info[chunk] = (hrtime() - profile_info[chunk]) / 1e6
    end
  end
else
  time = function(chunk, start) end
end

local function save_profiles(threshold)
  local sorted_times = {}
  for chunk_name, time_taken in pairs(profile_info) do
    sorted_times[#sorted_times + 1] = {chunk_name, time_taken}
  end
  table.sort(sorted_times, function(a, b) return a[2] > b[2] end)
  local results = {}
  for i, elem in ipairs(sorted_times) do
    if not threshold or threshold and elem[2] > threshold then
      results[i] = elem[1] .. ' took ' .. elem[2] .. 'ms'
    end
  end
  if threshold then
    table.insert(results, '(Only showing plugins that took longer than ' .. threshold .. ' ms ' .. 'to load)')
  end

  _G._packer.profile_output = results
end

time([[Luarocks path setup]], true)
local package_path_str = "/home/nick/.cache/nvim/packer_hererocks/2.1.1731601260/share/lua/5.1/?.lua;/home/nick/.cache/nvim/packer_hererocks/2.1.1731601260/share/lua/5.1/?/init.lua;/home/nick/.cache/nvim/packer_hererocks/2.1.1731601260/lib/luarocks/rocks-5.1/?.lua;/home/nick/.cache/nvim/packer_hererocks/2.1.1731601260/lib/luarocks/rocks-5.1/?/init.lua"
local install_cpath_pattern = "/home/nick/.cache/nvim/packer_hererocks/2.1.1731601260/lib/lua/5.1/?.so"
if not string.find(package.path, package_path_str, 1, true) then
  package.path = package.path .. ';' .. package_path_str
end

if not string.find(package.cpath, install_cpath_pattern, 1, true) then
  package.cpath = package.cpath .. ';' .. install_cpath_pattern
end

time([[Luarocks path setup]], false)
time([[try_loadstring definition]], true)
local function try_loadstring(s, component, name)
  local success, result = pcall(loadstring(s), name, _G.packer_plugins[name])
  if not success then
    vim.schedule(function()
      vim.api.nvim_notify('packer.nvim: Error running ' .. component .. ' for ' .. name .. ': ' .. result, vim.log.levels.ERROR, {})
    end)
  end
  return result
end

time([[try_loadstring definition]], false)
time([[Defining packer_plugins]], true)
_G.packer_plugins = {
  ["Comment.nvim"] = {
    config = { "\27LJ\2\n5\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\fComment\frequire\0" },
    loaded = true,
    path = "/home/nick/.local/share/nvim/site/pack/packer/start/Comment.nvim",
    url = "https://github.com/numToStr/Comment.nvim"
  },
  LuaSnip = {
    loaded = true,
    path = "/home/nick/.local/share/nvim/site/pack/packer/start/LuaSnip",
    url = "https://github.com/L3MON4D3/LuaSnip"
  },
  ["autoclose.nvim"] = {
    loaded = true,
    path = "/home/nick/.local/share/nvim/site/pack/packer/start/autoclose.nvim",
    url = "https://github.com/m4xshen/autoclose.nvim"
  },
  ["cmp-buffer"] = {
    loaded = true,
    path = "/home/nick/.local/share/nvim/site/pack/packer/start/cmp-buffer",
    url = "https://github.com/hrsh7th/cmp-buffer"
  },
  ["cmp-cmdline"] = {
    loaded = true,
    path = "/home/nick/.local/share/nvim/site/pack/packer/start/cmp-cmdline",
    url = "https://github.com/hrsh7th/cmp-cmdline"
  },
  ["cmp-nvim-lsp"] = {
    loaded = true,
    path = "/home/nick/.local/share/nvim/site/pack/packer/start/cmp-nvim-lsp",
    url = "https://github.com/hrsh7th/cmp-nvim-lsp"
  },
  ["cmp-path"] = {
    loaded = true,
    path = "/home/nick/.local/share/nvim/site/pack/packer/start/cmp-path",
    url = "https://github.com/hrsh7th/cmp-path"
  },
  cmp_luasnip = {
    loaded = true,
    path = "/home/nick/.local/share/nvim/site/pack/packer/start/cmp_luasnip",
    url = "https://github.com/saadparwaiz1/cmp_luasnip"
  },
  ["code_runner.nvim"] = {
    loaded = true,
    path = "/home/nick/.local/share/nvim/site/pack/packer/start/code_runner.nvim",
    url = "https://github.com/CRAG666/code_runner.nvim"
  },
  ["conform.nvim"] = {
    loaded = true,
    path = "/home/nick/.local/share/nvim/site/pack/packer/start/conform.nvim",
    url = "https://github.com/stevearc/conform.nvim"
  },
  ["dressing.nvim"] = {
    loaded = true,
    path = "/home/nick/.local/share/nvim/site/pack/packer/start/dressing.nvim",
    url = "https://github.com/stevearc/dressing.nvim"
  },
  ["emmet-vim"] = {
    loaded = true,
    path = "/home/nick/.local/share/nvim/site/pack/packer/start/emmet-vim",
    url = "https://github.com/mattn/emmet-vim"
  },
  ["flutter-tools.nvim"] = {
    loaded = true,
    path = "/home/nick/.local/share/nvim/site/pack/packer/start/flutter-tools.nvim",
    url = "https://github.com/akinsho/flutter-tools.nvim"
  },
  ["lsp-trouble.nvim"] = {
    loaded = true,
    path = "/home/nick/.local/share/nvim/site/pack/packer/start/lsp-trouble.nvim",
    url = "https://github.com/folke/lsp-trouble.nvim"
  },
  ["mason-lspconfig.nvim"] = {
    loaded = true,
    path = "/home/nick/.local/share/nvim/site/pack/packer/start/mason-lspconfig.nvim",
    url = "https://github.com/williamboman/mason-lspconfig.nvim"
  },
  ["mason-tool-installer.nvim"] = {
    loaded = true,
    path = "/home/nick/.local/share/nvim/site/pack/packer/start/mason-tool-installer.nvim",
    url = "https://github.com/WhoIsSethDaniel/mason-tool-installer.nvim"
  },
  ["mason.nvim"] = {
    loaded = true,
    path = "/home/nick/.local/share/nvim/site/pack/packer/start/mason.nvim",
    url = "https://github.com/williamboman/mason.nvim"
  },
  ["neo-tree.nvim"] = {
    config = { "\27LJ\2\n�\2\0\1\a\0\v\0\0265\1\0\0\18\4\0\0009\2\1\0'\5\2\0B\2\3\2\15\0\2\0X\3\18�6\3\3\0009\3\4\3\18\5\1\0\18\6\2\0B\3\3\2\15\0\3\0X\4\v�6\3\3\0009\3\5\0039\3\6\0035\5\a\0>\0\2\0055\6\b\0B\3\3\0016\3\3\0009\3\t\3'\5\n\0B\3\2\1K\0\1\0\bbd!\bcmd\1\0\1\vdetach\2\1\2\0\0\rxdg-open\rjobstart\afn\17tbl_contains\bvim\15^.+%.(.+)$\nmatch\1\25\0\0\bpng\bjpg\tjpeg\bgif\bsvg\bpdf\bexe\bbin\bdll\bzip\btar\agz\brar\biso\bmp3\bwav\tflac\bmp4\bmkv\bavi\bttf\botf\bdeb\rappImage�%\1\0\b\0z\0�\0016\0\0\0009\0\1\0009\0\2\0'\2\3\0005\3\4\0B\0\3\0016\0\0\0009\0\1\0009\0\2\0'\2\5\0005\3\6\0B\0\3\0016\0\0\0009\0\1\0009\0\2\0'\2\a\0005\3\b\0B\0\3\0016\0\0\0009\0\1\0009\0\2\0'\2\t\0005\3\n\0B\0\3\0016\0\v\0'\2\f\0B\0\2\0029\0\r\0005\2\14\0005\3\15\0=\3\16\0024\3\3\0005\4\17\0003\5\18\0=\5\19\4>\4\1\3=\3\20\0025\3\22\0005\4\21\0=\4\23\0035\4\24\0=\4\25\0035\4\26\0=\4\27\0035\4\28\0=\4\29\0035\4\30\0=\4\31\0035\4!\0005\5 \0=\5\"\4=\4#\0035\4$\0=\4%\0035\4&\0=\4'\0035\4(\0=\4)\0035\4*\0=\4+\0035\4,\0=\4-\3=\3.\0025\3/\0005\0040\0=\0041\0035\0043\0005\0052\0=\0054\0045\0055\0005\0066\0=\0067\5=\0058\0045\0059\0005\6:\0=\0067\5=\5;\4=\4<\3=\3=\0024\3\0\0=\3>\0025\3E\0005\4?\0004\5\0\0=\5@\0044\5\0\0=\5A\0044\5\0\0=\5B\0044\5\0\0=\5C\0044\5\0\0=\5D\4=\4F\0035\4G\0=\4H\0035\4[\0005\5I\0005\6J\0005\aK\0=\a7\6=\6L\0055\6M\0=\6N\0055\6O\0=\6P\0055\6Q\0=\6R\0055\6S\0=\6T\0055\6U\0=\6V\0055\6W\0=\6X\0055\6Y\0=\6Z\5=\5<\0045\5\\\0=\5]\4=\4=\0034\4\0\0=\4^\3=\3_\0025\3a\0005\4`\0=\4H\0035\4k\0005\5b\0005\6c\0005\ad\0=\a7\6=\6L\0055\6e\0=\6N\0055\6f\0=\6P\0055\6g\0=\6T\0055\6h\0=\6V\0055\6i\0=\6X\0055\6j\0=\6Z\5=\5<\4=\4=\3=\3l\0025\3w\0005\4m\0005\5n\0005\6o\0005\ap\0=\a7\6=\6L\0055\6q\0=\6N\0055\6r\0=\6P\0055\6s\0=\6T\0055\6t\0=\6V\0055\6u\0=\6X\0055\6v\0=\6Z\5=\5<\4=\4=\3=\3#\2B\0\2\0016\0\0\0009\0x\0'\2y\0B\0\2\1K\0\1\0#nnoremap \\ :Neotree reveal<cr>\bcmd\1\0\1\vwindow\0\1\2\1\0\18order_by_type\vnowait\1\1\2\1\0\18order_by_size\vnowait\1\1\2\1\0\18order_by_name\vnowait\1\1\2\1\0\22order_by_modified\vnowait\1\1\2\1\0\25order_by_diagnostics\vnowait\1\1\2\1\0\21order_by_created\vnowait\1\1\0\2\15prefix_key\6o\ntitle\rOrder by\1\2\2\0\14show_help\vnowait\1\vconfig\0\1\0\14\6o\0\agg\24git_commit_and_push\agc\15git_commit\agp\rgit_push\aot\0\aga\17git_add_file\aoc\0\agu\21git_unstage_file\aom\0\6A\16git_add_all\aos\0\aon\0\aod\0\agr\20git_revert_file\1\0\2\rposition\nfloat\rmappings\0\fbuffers\1\0\1\rmappings\0\1\2\1\0\18order_by_type\vnowait\1\1\2\1\0\18order_by_size\vnowait\1\1\2\1\0\18order_by_name\vnowait\1\1\2\1\0\22order_by_modified\vnowait\1\1\2\1\0\25order_by_diagnostics\vnowait\1\1\2\1\0\21order_by_created\vnowait\1\1\0\2\15prefix_key\6o\ntitle\rOrder by\1\2\2\0\14show_help\vnowait\1\vconfig\0\1\0\n\6o\0\t<bs>\16navigate_up\aos\0\6.\rset_root\aot\0\aom\0\abd\18buffer_delete\aon\0\aod\0\aoc\0\1\0\4\18show_unloaded\2\21group_empty_dirs\2\vwindow\0\24follow_current_file\0\1\0\2\fenabled\2\20leave_dirs_open\1\15filesystem\rcommands\26fuzzy_finder_mappings\1\0\4\t<up>\19move_cursor_up\v<down>\21move_cursor_down\n<C-p>\19move_cursor_up\n<C-n>\21move_cursor_down\1\0\2\26fuzzy_finder_mappings\0\rmappings\0\aot\1\2\1\0\18order_by_type\vnowait\1\aos\1\2\1\0\18order_by_size\vnowait\1\aon\1\2\1\0\18order_by_name\vnowait\1\aom\1\2\1\0\22order_by_modified\vnowait\1\aog\1\2\1\0\24order_by_git_status\vnowait\1\aod\1\2\1\0\25order_by_diagnostics\vnowait\1\aoc\1\2\1\0\21order_by_created\vnowait\1\6o\1\0\2\15prefix_key\6o\ntitle\rOrder by\1\2\2\0\14show_help\vnowait\1\vconfig\0\1\0\18\6o\0\t<bs>\16navigate_up\a]g\22next_git_modified\6/\17fuzzy_finder\aot\0\6f\21filter_on_submit\aom\0\aog\0\aon\0\aod\0\aoc\0\6.\rset_root\6#\17fuzzy_sorter\a[g\22prev_git_modified\n<c-x>\17clear_filter\aos\0\6D\27fuzzy_finder_directory\6H\18toggle_hidden\24follow_current_file\1\0\2\fenabled\1\20leave_dirs_open\1\19filtered_items\1\0\a\rcommands\0\19filtered_items\0\27use_libuv_file_watcher\1\vwindow\0\26hijack_netrw_behavior\17open_default\21group_empty_dirs\1\24follow_current_file\0\26never_show_by_pattern\15never_show\16always_show\20hide_by_pattern\17hide_by_name\1\0\t\fvisible\1\26never_show_by_pattern\0\15never_show\0\16always_show\0\20hide_by_pattern\0\17hide_by_name\0\16hide_hidden\2\20hide_gitignored\2\18hide_dotfiles\2\18nesting_rules\vwindow\rmappings\6a\1\0\1\14show_path\tnone\1\2\1\0\badd\vconfig\0\6P\vconfig\1\0\2\14use_float\2\19use_image_nvim\2\1\2\1\0\19toggle_preview\vconfig\0\f<space>\1\0\27\6p\25paste_from_clipboard\6s\16open_vsplit\6x\21cut_to_clipboard\6t\16open_tabnew\6y\22copy_to_clipboard\6r\vrename\6a\0\6d\vdelete\6c\tcopy\6A\18add_directory\6R\frefresh\6S\15open_split\6P\0\6q\17close_window\6z\20close_all_nodes\6?\14show_help\6<\16prev_source\6>\16next_source\6i\22show_file_details\6l\18focus_preview\6w\28open_with_window_picker\n<esc>\vcancel\t<cr>\topen\18<2-LeftMouse>\topen\f<space>\0\6C\15close_node\6m\tmove\1\2\1\0\16toggle_node\vnowait\1\20mapping_options\1\0\2\vnowait\2\fnoremap\2\1\0\4\nwidth\3(\rmappings\0\rposition\tleft\20mapping_options\0\30default_component_configs\19symlink_target\1\0\1\fenabled\1\fcreated\1\0\2\fenabled\2\19required_width\3n\18last_modified\1\0\2\fenabled\2\19required_width\3X\ttype\1\0\2\fenabled\2\19required_width\3z\14file_size\1\0\2\fenabled\2\19required_width\3@\15git_status\fsymbols\1\0\1\fsymbols\0\1\0\t\fdeleted\b✖\nadded\5\rmodified\5\rconflict\b\vstaged\b\runstaged\t󰄱\fignored\b\14untracked\b\frenamed\t󰁕\tname\1\0\3\14highlight\20NeoTreeFileName\26use_git_status_colors\2\19trailing_slash\1\rmodified\1\0\2\vsymbol\b[+]\14highlight\20NeoTreeModified\ticon\1\0\5\18folder_closed\b\14highlight\20NeoTreeFileIcon\fdefault\6*\17folder_empty\t󰜌\16folder_open\b\vindent\1\0\t\16indent_size\3\2\14highlight\24NeoTreeIndentMarker\23expander_highlight\20NeoTreeExpander\22expander_expanded\b\23expander_collapsed\b\23last_indent_marker\b└\18indent_marker\b│\17with_markers\2\fpadding\3\1\14container\1\0\v\19symlink_target\0\ticon\0\14container\0\15git_status\0\vindent\0\fcreated\0\18last_modified\0\rmodified\0\14file_size\0\tname\0\ttype\0\1\0\1\26enable_character_fade\2\19event_handlers\fhandler\0\1\0\2\fhandler\0\nevent\16file_opened$open_files_do_not_replace_types\1\4\0\0\rterminal\ftrouble\aqf\1\0\14\25close_if_last_window\1\vwindow\0\15filesystem\0\30default_component_configs\0\18nesting_rules\0\15git_status\0\19event_handlers\0\26sort_case_insensitive\1\fbuffers\0$open_files_do_not_replace_types\0\"enable_normal_mode_for_inputs\1\23enable_diagnostics\2\22enable_git_status\2\23popup_border_style\frounded\nsetup\rneo-tree\frequire\1\0\2\vtexthl\23DiagnosticSignHint\ttext\t󰌵\23DiagnosticSignHint\1\0\2\vtexthl\23DiagnosticSignInfo\ttext\t \23DiagnosticSignInfo\1\0\2\vtexthl\23DiagnosticSignWarn\ttext\t \23DiagnosticSignWarn\1\0\2\vtexthl\24DiagnosticSignError\ttext\t \24DiagnosticSignError\16sign_define\afn\bvim\0" },
    loaded = true,
    path = "/home/nick/.local/share/nvim/site/pack/packer/start/neo-tree.nvim",
    url = "https://github.com/nvim-neo-tree/neo-tree.nvim"
  },
  ["nui.nvim"] = {
    loaded = true,
    path = "/home/nick/.local/share/nvim/site/pack/packer/start/nui.nvim",
    url = "https://github.com/MunifTanjim/nui.nvim"
  },
  ["nvim-cmp"] = {
    loaded = true,
    path = "/home/nick/.local/share/nvim/site/pack/packer/start/nvim-cmp",
    url = "https://github.com/hrsh7th/nvim-cmp"
  },
  ["nvim-lspconfig"] = {
    loaded = true,
    path = "/home/nick/.local/share/nvim/site/pack/packer/start/nvim-lspconfig",
    url = "https://github.com/neovim/nvim-lspconfig"
  },
  ["nvim-treesitter"] = {
    loaded = true,
    path = "/home/nick/.local/share/nvim/site/pack/packer/start/nvim-treesitter",
    url = "https://github.com/nvim-treesitter/nvim-treesitter"
  },
  ["nvim-web-devicons"] = {
    loaded = true,
    path = "/home/nick/.local/share/nvim/site/pack/packer/start/nvim-web-devicons",
    url = "https://github.com/nvim-tree/nvim-web-devicons"
  },
  ["nvim-window-picker"] = {
    config = { "\27LJ\2\n�\2\0\0\6\0\f\0\0156\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\n\0005\3\3\0005\4\5\0005\5\4\0=\5\6\0045\5\a\0=\5\b\4=\4\t\3=\3\v\2B\0\2\1K\0\1\0\17filter_rules\1\0\1\17filter_rules\0\abo\fbuftype\1\3\0\0\rterminal\rquickfix\rfiletype\1\0\2\rfiletype\0\fbuftype\0\1\4\0\0\rneo-tree\19neo-tree-popup\vnotify\1\0\3\19autoselect_one\2\24include_current_win\1\abo\0\nsetup\18window-picker\frequire\0" },
    loaded = true,
    path = "/home/nick/.local/share/nvim/site/pack/packer/start/nvim-window-picker",
    url = "https://github.com/s1n7ax/nvim-window-picker"
  },
  ["onedark.nvim"] = {
    loaded = true,
    path = "/home/nick/.local/share/nvim/site/pack/packer/start/onedark.nvim",
    url = "https://github.com/navarasu/onedark.nvim"
  },
  ["packer.nvim"] = {
    loaded = true,
    path = "/home/nick/.local/share/nvim/site/pack/packer/start/packer.nvim",
    url = "https://github.com/wbthomason/packer.nvim"
  },
  ["plenary.nvim"] = {
    loaded = true,
    path = "/home/nick/.local/share/nvim/site/pack/packer/start/plenary.nvim",
    url = "https://github.com/nvim-lua/plenary.nvim"
  },
  ["telescope.nvim"] = {
    loaded = true,
    path = "/home/nick/.local/share/nvim/site/pack/packer/start/telescope.nvim",
    url = "https://github.com/nvim-telescope/telescope.nvim"
  },
  ["terminal.nvim"] = {
    loaded = true,
    path = "/home/nick/.local/share/nvim/site/pack/packer/start/terminal.nvim",
    url = "https://github.com/rebelot/terminal.nvim"
  },
  ["transparent.nvim"] = {
    loaded = true,
    path = "/home/nick/.local/share/nvim/site/pack/packer/start/transparent.nvim",
    url = "https://github.com/xiyaowong/transparent.nvim"
  }
}

time([[Defining packer_plugins]], false)
-- Config for: neo-tree.nvim
time([[Config for neo-tree.nvim]], true)
try_loadstring("\27LJ\2\n�\2\0\1\a\0\v\0\0265\1\0\0\18\4\0\0009\2\1\0'\5\2\0B\2\3\2\15\0\2\0X\3\18�6\3\3\0009\3\4\3\18\5\1\0\18\6\2\0B\3\3\2\15\0\3\0X\4\v�6\3\3\0009\3\5\0039\3\6\0035\5\a\0>\0\2\0055\6\b\0B\3\3\0016\3\3\0009\3\t\3'\5\n\0B\3\2\1K\0\1\0\bbd!\bcmd\1\0\1\vdetach\2\1\2\0\0\rxdg-open\rjobstart\afn\17tbl_contains\bvim\15^.+%.(.+)$\nmatch\1\25\0\0\bpng\bjpg\tjpeg\bgif\bsvg\bpdf\bexe\bbin\bdll\bzip\btar\agz\brar\biso\bmp3\bwav\tflac\bmp4\bmkv\bavi\bttf\botf\bdeb\rappImage�%\1\0\b\0z\0�\0016\0\0\0009\0\1\0009\0\2\0'\2\3\0005\3\4\0B\0\3\0016\0\0\0009\0\1\0009\0\2\0'\2\5\0005\3\6\0B\0\3\0016\0\0\0009\0\1\0009\0\2\0'\2\a\0005\3\b\0B\0\3\0016\0\0\0009\0\1\0009\0\2\0'\2\t\0005\3\n\0B\0\3\0016\0\v\0'\2\f\0B\0\2\0029\0\r\0005\2\14\0005\3\15\0=\3\16\0024\3\3\0005\4\17\0003\5\18\0=\5\19\4>\4\1\3=\3\20\0025\3\22\0005\4\21\0=\4\23\0035\4\24\0=\4\25\0035\4\26\0=\4\27\0035\4\28\0=\4\29\0035\4\30\0=\4\31\0035\4!\0005\5 \0=\5\"\4=\4#\0035\4$\0=\4%\0035\4&\0=\4'\0035\4(\0=\4)\0035\4*\0=\4+\0035\4,\0=\4-\3=\3.\0025\3/\0005\0040\0=\0041\0035\0043\0005\0052\0=\0054\0045\0055\0005\0066\0=\0067\5=\0058\0045\0059\0005\6:\0=\0067\5=\5;\4=\4<\3=\3=\0024\3\0\0=\3>\0025\3E\0005\4?\0004\5\0\0=\5@\0044\5\0\0=\5A\0044\5\0\0=\5B\0044\5\0\0=\5C\0044\5\0\0=\5D\4=\4F\0035\4G\0=\4H\0035\4[\0005\5I\0005\6J\0005\aK\0=\a7\6=\6L\0055\6M\0=\6N\0055\6O\0=\6P\0055\6Q\0=\6R\0055\6S\0=\6T\0055\6U\0=\6V\0055\6W\0=\6X\0055\6Y\0=\6Z\5=\5<\0045\5\\\0=\5]\4=\4=\0034\4\0\0=\4^\3=\3_\0025\3a\0005\4`\0=\4H\0035\4k\0005\5b\0005\6c\0005\ad\0=\a7\6=\6L\0055\6e\0=\6N\0055\6f\0=\6P\0055\6g\0=\6T\0055\6h\0=\6V\0055\6i\0=\6X\0055\6j\0=\6Z\5=\5<\4=\4=\3=\3l\0025\3w\0005\4m\0005\5n\0005\6o\0005\ap\0=\a7\6=\6L\0055\6q\0=\6N\0055\6r\0=\6P\0055\6s\0=\6T\0055\6t\0=\6V\0055\6u\0=\6X\0055\6v\0=\6Z\5=\5<\4=\4=\3=\3#\2B\0\2\0016\0\0\0009\0x\0'\2y\0B\0\2\1K\0\1\0#nnoremap \\ :Neotree reveal<cr>\bcmd\1\0\1\vwindow\0\1\2\1\0\18order_by_type\vnowait\1\1\2\1\0\18order_by_size\vnowait\1\1\2\1\0\18order_by_name\vnowait\1\1\2\1\0\22order_by_modified\vnowait\1\1\2\1\0\25order_by_diagnostics\vnowait\1\1\2\1\0\21order_by_created\vnowait\1\1\0\2\15prefix_key\6o\ntitle\rOrder by\1\2\2\0\14show_help\vnowait\1\vconfig\0\1\0\14\6o\0\agg\24git_commit_and_push\agc\15git_commit\agp\rgit_push\aot\0\aga\17git_add_file\aoc\0\agu\21git_unstage_file\aom\0\6A\16git_add_all\aos\0\aon\0\aod\0\agr\20git_revert_file\1\0\2\rposition\nfloat\rmappings\0\fbuffers\1\0\1\rmappings\0\1\2\1\0\18order_by_type\vnowait\1\1\2\1\0\18order_by_size\vnowait\1\1\2\1\0\18order_by_name\vnowait\1\1\2\1\0\22order_by_modified\vnowait\1\1\2\1\0\25order_by_diagnostics\vnowait\1\1\2\1\0\21order_by_created\vnowait\1\1\0\2\15prefix_key\6o\ntitle\rOrder by\1\2\2\0\14show_help\vnowait\1\vconfig\0\1\0\n\6o\0\t<bs>\16navigate_up\aos\0\6.\rset_root\aot\0\aom\0\abd\18buffer_delete\aon\0\aod\0\aoc\0\1\0\4\18show_unloaded\2\21group_empty_dirs\2\vwindow\0\24follow_current_file\0\1\0\2\fenabled\2\20leave_dirs_open\1\15filesystem\rcommands\26fuzzy_finder_mappings\1\0\4\t<up>\19move_cursor_up\v<down>\21move_cursor_down\n<C-p>\19move_cursor_up\n<C-n>\21move_cursor_down\1\0\2\26fuzzy_finder_mappings\0\rmappings\0\aot\1\2\1\0\18order_by_type\vnowait\1\aos\1\2\1\0\18order_by_size\vnowait\1\aon\1\2\1\0\18order_by_name\vnowait\1\aom\1\2\1\0\22order_by_modified\vnowait\1\aog\1\2\1\0\24order_by_git_status\vnowait\1\aod\1\2\1\0\25order_by_diagnostics\vnowait\1\aoc\1\2\1\0\21order_by_created\vnowait\1\6o\1\0\2\15prefix_key\6o\ntitle\rOrder by\1\2\2\0\14show_help\vnowait\1\vconfig\0\1\0\18\6o\0\t<bs>\16navigate_up\a]g\22next_git_modified\6/\17fuzzy_finder\aot\0\6f\21filter_on_submit\aom\0\aog\0\aon\0\aod\0\aoc\0\6.\rset_root\6#\17fuzzy_sorter\a[g\22prev_git_modified\n<c-x>\17clear_filter\aos\0\6D\27fuzzy_finder_directory\6H\18toggle_hidden\24follow_current_file\1\0\2\fenabled\1\20leave_dirs_open\1\19filtered_items\1\0\a\rcommands\0\19filtered_items\0\27use_libuv_file_watcher\1\vwindow\0\26hijack_netrw_behavior\17open_default\21group_empty_dirs\1\24follow_current_file\0\26never_show_by_pattern\15never_show\16always_show\20hide_by_pattern\17hide_by_name\1\0\t\fvisible\1\26never_show_by_pattern\0\15never_show\0\16always_show\0\20hide_by_pattern\0\17hide_by_name\0\16hide_hidden\2\20hide_gitignored\2\18hide_dotfiles\2\18nesting_rules\vwindow\rmappings\6a\1\0\1\14show_path\tnone\1\2\1\0\badd\vconfig\0\6P\vconfig\1\0\2\14use_float\2\19use_image_nvim\2\1\2\1\0\19toggle_preview\vconfig\0\f<space>\1\0\27\6p\25paste_from_clipboard\6s\16open_vsplit\6x\21cut_to_clipboard\6t\16open_tabnew\6y\22copy_to_clipboard\6r\vrename\6a\0\6d\vdelete\6c\tcopy\6A\18add_directory\6R\frefresh\6S\15open_split\6P\0\6q\17close_window\6z\20close_all_nodes\6?\14show_help\6<\16prev_source\6>\16next_source\6i\22show_file_details\6l\18focus_preview\6w\28open_with_window_picker\n<esc>\vcancel\t<cr>\topen\18<2-LeftMouse>\topen\f<space>\0\6C\15close_node\6m\tmove\1\2\1\0\16toggle_node\vnowait\1\20mapping_options\1\0\2\vnowait\2\fnoremap\2\1\0\4\nwidth\3(\rmappings\0\rposition\tleft\20mapping_options\0\30default_component_configs\19symlink_target\1\0\1\fenabled\1\fcreated\1\0\2\fenabled\2\19required_width\3n\18last_modified\1\0\2\fenabled\2\19required_width\3X\ttype\1\0\2\fenabled\2\19required_width\3z\14file_size\1\0\2\fenabled\2\19required_width\3@\15git_status\fsymbols\1\0\1\fsymbols\0\1\0\t\fdeleted\b✖\nadded\5\rmodified\5\rconflict\b\vstaged\b\runstaged\t󰄱\fignored\b\14untracked\b\frenamed\t󰁕\tname\1\0\3\14highlight\20NeoTreeFileName\26use_git_status_colors\2\19trailing_slash\1\rmodified\1\0\2\vsymbol\b[+]\14highlight\20NeoTreeModified\ticon\1\0\5\18folder_closed\b\14highlight\20NeoTreeFileIcon\fdefault\6*\17folder_empty\t󰜌\16folder_open\b\vindent\1\0\t\16indent_size\3\2\14highlight\24NeoTreeIndentMarker\23expander_highlight\20NeoTreeExpander\22expander_expanded\b\23expander_collapsed\b\23last_indent_marker\b└\18indent_marker\b│\17with_markers\2\fpadding\3\1\14container\1\0\v\19symlink_target\0\ticon\0\14container\0\15git_status\0\vindent\0\fcreated\0\18last_modified\0\rmodified\0\14file_size\0\tname\0\ttype\0\1\0\1\26enable_character_fade\2\19event_handlers\fhandler\0\1\0\2\fhandler\0\nevent\16file_opened$open_files_do_not_replace_types\1\4\0\0\rterminal\ftrouble\aqf\1\0\14\25close_if_last_window\1\vwindow\0\15filesystem\0\30default_component_configs\0\18nesting_rules\0\15git_status\0\19event_handlers\0\26sort_case_insensitive\1\fbuffers\0$open_files_do_not_replace_types\0\"enable_normal_mode_for_inputs\1\23enable_diagnostics\2\22enable_git_status\2\23popup_border_style\frounded\nsetup\rneo-tree\frequire\1\0\2\vtexthl\23DiagnosticSignHint\ttext\t󰌵\23DiagnosticSignHint\1\0\2\vtexthl\23DiagnosticSignInfo\ttext\t \23DiagnosticSignInfo\1\0\2\vtexthl\23DiagnosticSignWarn\ttext\t \23DiagnosticSignWarn\1\0\2\vtexthl\24DiagnosticSignError\ttext\t \24DiagnosticSignError\16sign_define\afn\bvim\0", "config", "neo-tree.nvim")
time([[Config for neo-tree.nvim]], false)
-- Config for: Comment.nvim
time([[Config for Comment.nvim]], true)
try_loadstring("\27LJ\2\n5\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\fComment\frequire\0", "config", "Comment.nvim")
time([[Config for Comment.nvim]], false)
-- Config for: nvim-window-picker
time([[Config for nvim-window-picker]], true)
try_loadstring("\27LJ\2\n�\2\0\0\6\0\f\0\0156\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\n\0005\3\3\0005\4\5\0005\5\4\0=\5\6\0045\5\a\0=\5\b\4=\4\t\3=\3\v\2B\0\2\1K\0\1\0\17filter_rules\1\0\1\17filter_rules\0\abo\fbuftype\1\3\0\0\rterminal\rquickfix\rfiletype\1\0\2\rfiletype\0\fbuftype\0\1\4\0\0\rneo-tree\19neo-tree-popup\vnotify\1\0\3\19autoselect_one\2\24include_current_win\1\abo\0\nsetup\18window-picker\frequire\0", "config", "nvim-window-picker")
time([[Config for nvim-window-picker]], false)

_G._packer.inside_compile = false
if _G._packer.needs_bufread == true then
  vim.cmd("doautocmd BufRead")
end
_G._packer.needs_bufread = false

if should_profile then save_profiles() end

end)

if not no_errors then
  error_msg = error_msg:gsub('"', '\\"')
  vim.api.nvim_command('echohl ErrorMsg | echom "Error in packer_compiled: '..error_msg..'" | echom "Please check your config for correctness" | echohl None')
end
