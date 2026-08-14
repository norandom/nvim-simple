-- Berg Light colorscheme for Neovim
-- Warm Bloomberg-inspired light theme
-- Lua version for Neovim 0.5+
-- Companion to the dark Berg theme

local colors = {
	-- Base colors - muted for light background
	black = "#1A1614",
	red = "#A03030",
	green = "#2E6B4F",
	yellow = "#8B6914",
	blue = "#2E5A84",
	magenta = "#6B3A6B",
	cyan = "#4A7B8B",
	white = "#A89888",

	-- Bright accent colors
	bright_black = "#2A2420",
	bright_red = "#C04040",
	bright_green = "#3A7B5A",
	orange = "#8B4513",
	bright_blue = "#3A6A9A",
	bright_magenta = "#7B4A7B",
	bright_cyan = "#5A8B9B",
	bright_white = "#F5F0E8",

	-- UI colors - warm light palette
	bg = "#FAF6F0",
	fg = "#3D3229",
	gray = "#A89888",
	light_gray = "#D8CFC4",
	dark_gray = "#D0C8BC",
	darker_gray = "#E0D8CC",
	selection = "#DDD5C8",
	comment = "#8B7355",
	string = "#7B5B2E",
}

local function highlight(group, color)
	local style = color.style and "gui=" .. color.style or "gui=NONE"
	local fg = color.fg and "guifg=" .. color.fg or "guifg=NONE"
	local bg = color.bg and "guibg=" .. color.bg or "guibg=NONE"
	local sp = color.sp and "guisp=" .. color.sp or ""

	vim.cmd("highlight " .. group .. " " .. style .. " " .. fg .. " " .. bg .. " " .. sp)
end

local function load_syntax()
	local syntax = {
		-- Editor UI
		Normal = { fg = colors.fg, bg = colors.bg },
		Cursor = { fg = colors.bg, bg = colors.blue },
		CursorLine = { bg = "#F0EBE3" },
		CursorColumn = { bg = "#F0EBE3" },
		LineNr = { fg = "#B8A898", bg = colors.bg },
		CursorLineNr = { fg = colors.orange, bg = "#F0EBE3", style = "bold" },
		Visual = { bg = colors.selection },
		VisualNOS = { bg = colors.selection },
		Search = { fg = "#2A2420", bg = "#B8860B" },
		IncSearch = { fg = "#2A2420", bg = "#E8C878" },
		MatchParen = { fg = colors.blue, bg = "#D4C8B8", style = "bold" },

		-- Gutter
		SignColumn = { fg = colors.gray, bg = colors.bg },
		FoldColumn = { fg = colors.gray, bg = colors.bg },
		Folded = { fg = colors.gray, bg = "#EDE8E0" },

		-- Statusline
		StatusLine = { fg = colors.orange, bg = "#E8E0D4", style = "bold" },
		StatusLineNC = { fg = colors.gray, bg = "#E8E0D4" },

		-- Tabline
		TabLine = { fg = colors.gray, bg = "#E8E0D4" },
		TabLineFill = { bg = "#E8E0D4" },
		TabLineSel = { fg = colors.orange, bg = colors.light_gray, style = "bold" },

		-- Popup menu
		Pmenu = { fg = colors.fg, bg = "#E8E0D4" },
		PmenuSel = { fg = colors.bg, bg = colors.orange },
		PmenuSbar = { bg = colors.light_gray },
		PmenuThumb = { bg = colors.gray },

		-- Messages
		ErrorMsg = { fg = colors.bright_red, bg = colors.bg },
		WarningMsg = { fg = colors.orange, bg = colors.bg },
		ModeMsg = { fg = colors.green, bg = colors.bg },
		MoreMsg = { fg = colors.cyan, bg = colors.bg },
		Question = { fg = colors.cyan, bg = colors.bg },

		-- Splits
		VertSplit = { fg = colors.dark_gray, bg = colors.bg },

		-- Diff
		DiffAdd = { fg = colors.green, bg = "#E0ECD8" },
		DiffChange = { fg = colors.orange, bg = "#F0E8D8" },
		DiffDelete = { fg = colors.red, bg = "#F0D8D8" },
		DiffText = { fg = colors.blue, bg = "#D8E4F0" },

		-- Spelling
		SpellBad = { fg = colors.red, style = "undercurl", sp = colors.red },
		SpellCap = { fg = colors.orange, style = "undercurl", sp = colors.orange },
		SpellLocal = { fg = colors.yellow, style = "undercurl", sp = colors.yellow },
		SpellRare = { fg = colors.cyan, style = "undercurl", sp = colors.cyan },

		-- Misc
		Directory = { fg = colors.blue },
		SpecialKey = { fg = colors.gray },
		Title = { fg = colors.orange, style = "bold" },
		NonText = { fg = colors.gray },
		Conceal = { fg = colors.gray, bg = colors.bg },

		-- Syntax
		Comment = { fg = colors.comment, style = "italic" },
		Todo = { fg = colors.orange, bg = "#F0E8D8", style = "bold" },

		Constant = { fg = colors.magenta },
		String = { fg = colors.string },
		Character = { fg = colors.string },
		Number = { fg = colors.magenta },
		Boolean = { fg = colors.magenta },
		Float = { fg = colors.magenta },

		Identifier = { fg = colors.blue },
		Function = { fg = colors.orange },

		Statement = { fg = colors.blue },
		Conditional = { fg = colors.blue },
		Repeat = { fg = colors.blue },
		Label = { fg = colors.blue },
		Operator = { fg = colors.fg },
		Keyword = { fg = colors.blue },
		Exception = { fg = colors.blue },

		PreProc = { fg = colors.cyan },
		Include = { fg = colors.cyan },
		Define = { fg = colors.cyan },
		Macro = { fg = colors.cyan },
		PreCondit = { fg = colors.cyan },

		Type = { fg = colors.green },
		StorageClass = { fg = colors.blue },
		Structure = { fg = colors.green },
		Typedef = { fg = colors.green },

		Special = { fg = colors.cyan },
		SpecialChar = { fg = colors.bright_cyan },
		Tag = { fg = colors.bright_cyan },
		Delimiter = { fg = colors.fg },
		SpecialComment = { fg = colors.gray, style = "italic" },
		Debug = { fg = colors.red },

		Underlined = { fg = colors.blue, style = "underline" },
		Error = { fg = colors.bright_red, bg = colors.bg },

		-- Treesitter
		["@comment"] = { link = "Comment" },
		["@constant"] = { link = "Constant" },
		["@constant.builtin"] = { fg = colors.bright_blue },
		["@string"] = { link = "String" },
		["@number"] = { link = "Number" },
		["@boolean"] = { link = "Boolean" },
		["@float"] = { link = "Float" },
		["@function"] = { link = "Function" },
		["@function.builtin"] = { fg = colors.bright_blue },
		["@function.method"] = { link = "Function" },
		["@keyword"] = { link = "Keyword" },
		["@keyword.function"] = { link = "Keyword" },
		["@keyword.operator"] = { link = "Operator" },
		["@keyword.return"] = { link = "Keyword" },
		["@conditional"] = { link = "Conditional" },
		["@repeat"] = { link = "Repeat" },
		["@operator"] = { link = "Operator" },
		["@exception"] = { link = "Exception" },
		["@include"] = { link = "Include" },
		["@type"] = { link = "Type" },
		["@type.builtin"] = { link = "Type" },
		["@variable"] = { fg = colors.fg },
		["@variable.builtin"] = { fg = colors.bright_blue },
		["@property"] = { fg = colors.orange },
		["@parameter"] = { fg = colors.fg },
		["@field"] = { fg = colors.orange },
		["@constructor"] = { link = "Function" },
		["@punctuation.bracket"] = { link = "Delimiter" },
		["@punctuation.delimiter"] = { link = "Delimiter" },
		["@tag"] = { link = "Tag" },
		["@tag.delimiter"] = { link = "Delimiter" },
		["@text.title"] = { fg = colors.orange, style = "bold" },
		["@text.emphasis"] = { style = "italic" },
		["@text.strong"] = { style = "bold" },
		["@text.uri"] = { fg = colors.blue, style = "underline" },

		-- LSP
		DiagnosticError = { fg = colors.bright_red },
		DiagnosticWarn = { fg = colors.orange },
		DiagnosticInfo = { fg = colors.cyan },
		DiagnosticHint = { fg = colors.green },
		DiagnosticUnderlineError = { style = "undercurl", sp = colors.bright_red },
		DiagnosticUnderlineWarn = { style = "undercurl", sp = colors.orange },
		DiagnosticUnderlineInfo = { style = "undercurl", sp = colors.cyan },
		DiagnosticUnderlineHint = { style = "undercurl", sp = colors.green },

		-- Git signs
		GitSignsAdd = { fg = colors.green },
		GitSignsChange = { fg = colors.orange },
		GitSignsDelete = { fg = colors.red },

		-- Telescope
		TelescopeNormal = { fg = colors.fg, bg = colors.bg },
		TelescopeBorder = { fg = colors.gray, bg = colors.bg },
		TelescopePromptBorder = { fg = colors.orange, bg = colors.bg },
		TelescopePromptPrefix = { fg = colors.orange },
		TelescopeSelection = { bg = colors.selection },
		TelescopeSelectionCaret = { fg = colors.orange },
		TelescopeMatching = { fg = colors.yellow, style = "bold" },

		-- NvimTree
		NvimTreeNormal = { fg = colors.fg, bg = colors.bg },
		NvimTreeFolderName = { fg = colors.blue },
		NvimTreeOpenedFolderName = { fg = colors.bright_cyan },
		NvimTreeRootFolder = { fg = colors.orange, style = "bold" },
		NvimTreeSpecialFile = { fg = colors.yellow },
		NvimTreeGitDirty = { fg = colors.orange },
		NvimTreeGitNew = { fg = colors.green },
		NvimTreeGitDeleted = { fg = colors.red },
	}

	for group, colors_table in pairs(syntax) do
		highlight(group, colors_table)
	end
end

-- Load the theme
vim.cmd("hi clear")
if vim.fn.exists("syntax_on") then
	vim.cmd("syntax reset")
end

vim.o.termguicolors = true
vim.o.background = "light"
vim.g.colors_name = "berg-light"

load_syntax()

-- Terminal colors
vim.g.terminal_color_0 = colors.black
vim.g.terminal_color_1 = colors.red
vim.g.terminal_color_2 = colors.green
vim.g.terminal_color_3 = colors.yellow
vim.g.terminal_color_4 = colors.blue
vim.g.terminal_color_5 = colors.magenta
vim.g.terminal_color_6 = colors.cyan
vim.g.terminal_color_7 = colors.white
vim.g.terminal_color_8 = colors.bright_black
vim.g.terminal_color_9 = colors.bright_red
vim.g.terminal_color_10 = colors.bright_green
vim.g.terminal_color_11 = colors.orange
vim.g.terminal_color_12 = colors.bright_blue
vim.g.terminal_color_13 = colors.bright_magenta
vim.g.terminal_color_14 = colors.bright_cyan
vim.g.terminal_color_15 = colors.bright_white
