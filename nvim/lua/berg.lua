-- Berg colorscheme for Neovim
-- Bloomberg terminal inspired theme
-- Lua version for Neovim 0.5+

local colors = {
  -- Base colors
  black          = "#000000",
  red            = "#d54135",
  green          = "#60C487",
  yellow         = "#FEE334",
  blue           = "#6D96D0",
  magenta        = "#7a3577",
  cyan           = "#4DC7F9",
  white          = "#acacae",

  -- Bright colors
  bright_black   = "#464646",
  bright_red     = "#e65a4d",
  bright_green   = "#5dc453",
  orange         = "#f49f31",
  bright_blue    = "#8baad6",
  bright_magenta = "#9d4a99",
  bright_cyan    = "#ABD3E0",
  bright_white   = "#d7d7d7",

  -- UI colors
  bg             = "#000000",
  fg             = "#f49f31",
  gray           = "#646667",
  light_gray     = "#acacae",
  dark_gray      = "#282828",
  darker_gray    = "#202020",
  selection      = "#353f40",
  comment        = "#d54135",
  string         = "#a67228",
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
    Normal          = { fg = colors.fg, bg = colors.bg },
    Cursor          = { fg = colors.bg, bg = colors.cyan },
    CursorLine      = { bg = colors.darker_gray },
    CursorColumn    = { bg = colors.darker_gray },
    LineNr          = { fg = colors.gray, bg = colors.bg },
    CursorLineNr    = { fg = colors.orange, bg = colors.darker_gray, style = "bold" },
    Visual          = { bg = colors.selection },
    VisualNOS       = { bg = colors.selection },
    Search          = { fg = colors.black, bg = colors.yellow },
    IncSearch       = { fg = colors.black, bg = colors.orange },
    MatchParen      = { fg = colors.cyan, bg = colors.selection, style = "bold" },

    -- Gutter
    SignColumn      = { fg = colors.gray, bg = colors.bg },
    FoldColumn      = { fg = colors.gray, bg = colors.bg },
    Folded          = { fg = colors.gray, bg = colors.darker_gray },

    -- Statusline
    StatusLine      = { fg = colors.orange, bg = colors.darker_gray },
    StatusLineNC    = { fg = colors.gray, bg = colors.darker_gray },

    -- Tabline
    TabLine         = { fg = colors.light_gray, bg = colors.darker_gray },
    TabLineFill     = { bg = colors.darker_gray },
    TabLineSel      = { fg = colors.orange, bg = colors.dark_gray, style = "bold" },

    -- Popup menu
    Pmenu           = { fg = colors.light_gray, bg = colors.darker_gray },
    PmenuSel        = { fg = colors.black, bg = colors.orange },
    PmenuSbar       = { bg = colors.dark_gray },
    PmenuThumb      = { bg = colors.gray },

    -- Messages
    ErrorMsg        = { fg = colors.bright_red, bg = colors.bg },
    WarningMsg      = { fg = colors.orange, bg = colors.bg },
    ModeMsg         = { fg = colors.green, bg = colors.bg },
    MoreMsg         = { fg = colors.cyan, bg = colors.bg },
    Question        = { fg = colors.cyan, bg = colors.bg },

    -- Splits
    VertSplit       = { fg = colors.dark_gray, bg = colors.bg },

    -- Diff
    DiffAdd         = { fg = colors.green, bg = colors.darker_gray },
    DiffChange      = { fg = colors.orange, bg = colors.darker_gray },
    DiffDelete      = { fg = colors.red, bg = colors.darker_gray },
    DiffText        = { fg = colors.blue, bg = colors.selection },

    -- Spelling
    SpellBad        = { fg = colors.red, style = "undercurl", sp = colors.red },
    SpellCap        = { fg = colors.orange, style = "undercurl", sp = colors.orange },
    SpellLocal      = { fg = colors.yellow, style = "undercurl", sp = colors.yellow },
    SpellRare       = { fg = colors.cyan, style = "undercurl", sp = colors.cyan },

    -- Misc
    Directory       = { fg = colors.cyan },
    SpecialKey      = { fg = colors.gray },
    Title           = { fg = colors.yellow, style = "bold" },
    NonText         = { fg = colors.gray },
    Conceal         = { fg = colors.gray, bg = colors.bg },

    -- Syntax
    Comment         = { fg = colors.comment, style = "italic" },
    Todo            = { fg = colors.orange, bg = colors.darker_gray, style = "bold" },

    Constant        = { fg = colors.magenta },
    String          = { fg = colors.string },
    Character       = { fg = colors.string },
    Number          = { fg = colors.magenta },
    Boolean         = { fg = colors.magenta },
    Float           = { fg = colors.magenta },

    Identifier      = { fg = colors.blue },
    Function        = { fg = colors.yellow },

    Statement       = { fg = colors.blue },
    Conditional     = { fg = colors.blue },
    Repeat          = { fg = colors.blue },
    Label           = { fg = colors.blue },
    Operator        = { fg = colors.blue },
    Keyword         = { fg = colors.blue },
    Exception       = { fg = colors.blue },

    PreProc         = { fg = colors.cyan },
    Include         = { fg = colors.cyan },
    Define          = { fg = colors.cyan },
    Macro           = { fg = colors.cyan },
    PreCondit       = { fg = colors.cyan },

    Type            = { fg = colors.green },
    StorageClass    = { fg = colors.blue },
    Structure       = { fg = colors.green },
    Typedef         = { fg = colors.green },

    Special         = { fg = colors.cyan },
    SpecialChar     = { fg = colors.bright_cyan },
    Tag             = { fg = colors.bright_cyan },
    Delimiter       = { fg = colors.orange },
    SpecialComment  = { fg = colors.gray, style = "italic" },
    Debug           = { fg = colors.red },

    Underlined      = { fg = colors.cyan, style = "underline" },
    Error           = { fg = colors.bright_red, bg = colors.bg },

    -- Treesitter
    ["@comment"]              = { link = "Comment" },
    ["@constant"]             = { link = "Constant" },
    ["@constant.builtin"]     = { fg = colors.bright_blue },
    ["@string"]               = { link = "String" },
    ["@number"]               = { link = "Number" },
    ["@boolean"]              = { link = "Boolean" },
    ["@float"]                = { link = "Float" },
    ["@function"]             = { link = "Function" },
    ["@function.builtin"]     = { fg = colors.bright_blue },
    ["@function.method"]      = { link = "Function" },
    ["@keyword"]              = { link = "Keyword" },
    ["@keyword.function"]     = { link = "Keyword" },
    ["@keyword.operator"]     = { link = "Operator" },
    ["@keyword.return"]       = { link = "Keyword" },
    ["@conditional"]          = { link = "Conditional" },
    ["@repeat"]               = { link = "Repeat" },
    ["@operator"]             = { link = "Operator" },
    ["@exception"]            = { link = "Exception" },
    ["@include"]              = { link = "Include" },
    ["@type"]                 = { link = "Type" },
    ["@type.builtin"]         = { link = "Type" },
    ["@variable"]             = { fg = colors.fg },
    ["@variable.builtin"]     = { fg = colors.bright_blue },
    ["@property"]             = { fg = colors.orange },
    ["@parameter"]            = { fg = colors.fg },
    ["@field"]                = { fg = colors.orange },
    ["@constructor"]          = { link = "Function" },
    ["@punctuation.bracket"]  = { link = "Delimiter" },
    ["@punctuation.delimiter"]= { link = "Delimiter" },
    ["@tag"]                  = { link = "Tag" },
    ["@tag.delimiter"]        = { link = "Delimiter" },
    ["@text.title"]           = { fg = colors.yellow, style = "bold" },
    ["@text.emphasis"]        = { style = "italic" },
    ["@text.strong"]          = { style = "bold" },
    ["@text.uri"]             = { fg = colors.cyan, style = "underline" },

    -- LSP
    DiagnosticError           = { fg = colors.bright_red },
    DiagnosticWarn            = { fg = colors.orange },
    DiagnosticInfo            = { fg = colors.cyan },
    DiagnosticHint            = { fg = colors.green },
    DiagnosticUnderlineError  = { style = "undercurl", sp = colors.bright_red },
    DiagnosticUnderlineWarn   = { style = "undercurl", sp = colors.orange },
    DiagnosticUnderlineInfo   = { style = "undercurl", sp = colors.cyan },
    DiagnosticUnderlineHint   = { style = "undercurl", sp = colors.green },

    -- Git signs
    GitSignsAdd               = { fg = colors.green },
    GitSignsChange            = { fg = colors.orange },
    GitSignsDelete            = { fg = colors.red },

    -- Telescope
    TelescopeNormal           = { fg = colors.fg, bg = colors.bg },
    TelescopeBorder           = { fg = colors.gray, bg = colors.bg },
    TelescopePromptBorder     = { fg = colors.orange, bg = colors.bg },
    TelescopePromptPrefix     = { fg = colors.orange },
    TelescopeSelection        = { bg = colors.selection },
    TelescopeSelectionCaret   = { fg = colors.orange },
    TelescopeMatching         = { fg = colors.yellow, style = "bold" },

    -- NvimTree
    NvimTreeNormal            = { fg = colors.fg, bg = colors.bg },
    NvimTreeFolderName        = { fg = colors.cyan },
    NvimTreeOpenedFolderName  = { fg = colors.bright_cyan },
    NvimTreeRootFolder        = { fg = colors.orange, style = "bold" },
    NvimTreeSpecialFile       = { fg = colors.yellow },
    NvimTreeGitDirty          = { fg = colors.orange },
    NvimTreeGitNew            = { fg = colors.green },
    NvimTreeGitDeleted        = { fg = colors.red },
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
vim.g.colors_name = "berg"

load_syntax()

-- Terminal colors
vim.g.terminal_color_0  = colors.black
vim.g.terminal_color_1  = colors.red
vim.g.terminal_color_2  = colors.green
vim.g.terminal_color_3  = colors.yellow
vim.g.terminal_color_4  = colors.blue
vim.g.terminal_color_5  = colors.magenta
vim.g.terminal_color_6  = colors.cyan
vim.g.terminal_color_7  = colors.white
vim.g.terminal_color_8  = colors.bright_black
vim.g.terminal_color_9  = colors.bright_red
vim.g.terminal_color_10 = colors.bright_green
vim.g.terminal_color_11 = colors.orange
vim.g.terminal_color_12 = colors.bright_blue
vim.g.terminal_color_13 = colors.bright_magenta
vim.g.terminal_color_14 = colors.bright_cyan
vim.g.terminal_color_15 = colors.bright_white
