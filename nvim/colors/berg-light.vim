" Berg Light colorscheme for Neovim/Vim
" Warm Bloomberg-inspired light theme
" Companion to the dark Berg theme

set background=light
highlight clear

if exists("syntax_on")
  syntax reset
endif

let g:colors_name = "berg-light"

" Color Palette - warm, ergonomic light tones
let s:cream        = { "gui": "#FAF6F0", "cterm": "15"  }
let s:warm_white   = { "gui": "#F5F0E8", "cterm": "255" }
let s:parchment    = { "gui": "#EDE8E0", "cterm": "254" }
let s:warm_gray    = { "gui": "#D8CFC4", "cterm": "252" }
let s:mid_gray     = { "gui": "#A89888", "cterm": "248" }
let s:dark_brown   = { "gui": "#3D3229", "cterm": "236" }
let s:charcoal     = { "gui": "#2A2420", "cterm": "234" }

" Accent colors - muted for light background
let s:red          = { "gui": "#A03030", "cterm": "124" }
let s:green        = { "gui": "#2E6B4F", "cterm": "29"  }
let s:yellow       = { "gui": "#8B6914", "cterm": "136" }
let s:blue         = { "gui": "#2E5A84", "cterm": "25"  }
let s:magenta      = { "gui": "#6B3A6B", "cterm": "90"  }
let s:cyan         = { "gui": "#4A7B8B", "cterm": "30"  }
let s:orange       = { "gui": "#8B4513", "cterm": "130" }

" Bright accent colors
let s:bright_red     = { "gui": "#C04040", "cterm": "160" }
let s:bright_green   = { "gui": "#3A7B5A", "cterm": "35"  }
let s:gold           = { "gui": "#B8860B", "cterm": "178" }
let s:bright_blue    = { "gui": "#3A6A9A", "cterm": "31"  }
let s:bright_magenta = { "gui": "#7B4A7B", "cterm": "96"  }
let s:bright_cyan    = { "gui": "#5A8B9B", "cterm": "36"  }
let s:warm_black     = { "gui": "#1A1614", "cterm": "233" }

" Semantic colors
let s:bg           = { "gui": "#FAF6F0", "cterm": "15"  }
let s:fg           = { "gui": "#3D3229", "cterm": "236" }
let s:comment      = { "gui": "#8B7355", "cterm": "137" }
let s:string       = { "gui": "#7B5B2E", "cterm": "94"  }
let s:selection    = { "gui": "#DDD5C8", "cterm": "253" }
let s:cursor_line  = { "gui": "#F0EBE3", "cterm": "255" }
let s:line_nr      = { "gui": "#B8A898", "cterm": "249" }
let s:status_bg    = { "gui": "#E8E0D4", "cterm": "253" }
let s:border       = { "gui": "#D0C8BC", "cterm": "251" }

" Helper function
function! s:HL(group, fg, bg, attr)
  let l:attr = a:attr
  if !empty(a:fg)
    exec "hi " . a:group . " guifg=" . a:fg.gui . " ctermfg=" . a:fg.cterm
  endif
  if !empty(a:bg)
    exec "hi " . a:group . " guibg=" . a:bg.gui . " ctermbg=" . a:bg.cterm
  endif
  if !empty(a:attr)
    exec "hi " . a:group . " gui=" . l:attr . " cterm=" . l:attr
  endif
endfun

" Editor UI
call s:HL("Normal",       s:fg,           s:bg,          "")
call s:HL("Cursor",       s:bg,           s:blue,        "")
call s:HL("CursorLine",   {},             s:cursor_line, "")
call s:HL("CursorColumn", {},             s:cursor_line, "")
call s:HL("LineNr",       s:line_nr,      s:bg,          "")
call s:HL("CursorLineNr", s:orange,       s:cursor_line, "bold")
call s:HL("Visual",       {},             s:selection,   "")
call s:HL("VisualNOS",    {},             s:selection,   "")
call s:HL("Search",       s:charcoal,     s:gold,        "")
call s:HL("IncSearch",    s:charcoal,     { "gui": "#E8C878", "cterm": "222" }, "")
call s:HL("MatchParen",   s:blue,         { "gui": "#D4C8B8", "cterm": "252" }, "bold")

" Gutter
call s:HL("SignColumn",   s:mid_gray,     s:bg,          "")
call s:HL("FoldColumn",   s:mid_gray,     s:bg,          "")
call s:HL("Folded",       s:mid_gray,     s:parchment,   "")

" Statusline
call s:HL("StatusLine",   s:orange,       s:status_bg,   "bold")
call s:HL("StatusLineNC", s:mid_gray,     s:status_bg,   "")

" Tabline
call s:HL("TabLine",      s:mid_gray,     s:status_bg,   "")
call s:HL("TabLineFill",  {},             s:status_bg,   "")
call s:HL("TabLineSel",   s:orange,       s:warm_white,  "bold")

" Popup menu
call s:HL("Pmenu",        s:fg,           s:status_bg,   "")
call s:HL("PmenuSel",     s:bg,           s:orange,      "")
call s:HL("PmenuSbar",    {},             s:warm_gray,   "")
call s:HL("PmenuThumb",   {},             s:mid_gray,    "")

" Messages
call s:HL("ErrorMsg",     s:bright_red,   s:bg,          "")
call s:HL("WarningMsg",   s:orange,       s:bg,          "")
call s:HL("ModeMsg",      s:green,        s:bg,          "")
call s:HL("MoreMsg",      s:cyan,         s:bg,          "")
call s:HL("Question",     s:cyan,         s:bg,          "")

" Splits
call s:HL("VertSplit",    s:border,       s:bg,          "")

" Diff
call s:HL("DiffAdd",      s:green,        { "gui": "#E0ECD8", "cterm": "194" }, "")
call s:HL("DiffChange",   s:orange,       { "gui": "#F0E8D8", "cterm": "230" }, "")
call s:HL("DiffDelete",   s:red,          { "gui": "#F0D8D8", "cterm": "224" }, "")
call s:HL("DiffText",     s:blue,         { "gui": "#D8E4F0", "cterm": "189" }, "")

" Spelling
call s:HL("SpellBad",     s:red,          {},            "undercurl")
call s:HL("SpellCap",     s:orange,       {},            "undercurl")
call s:HL("SpellLocal",   s:yellow,       {},            "undercurl")
call s:HL("SpellRare",    s:cyan,         {},            "undercurl")

" Misc
call s:HL("Directory",    s:blue,         {},            "")
call s:HL("SpecialKey",   s:mid_gray,     {},            "")
call s:HL("Title",        s:orange,       {},            "bold")
call s:HL("NonText",      s:mid_gray,     {},            "")
call s:HL("Conceal",      s:mid_gray,     s:bg,          "")

" Syntax Highlighting
" Comments
call s:HL("Comment",      s:comment,      {},            "italic")
call s:HL("Todo",         s:orange,       { "gui": "#F0E8D8", "cterm": "230" }, "bold")

" Constants
call s:HL("Constant",     s:magenta,      {},            "")
call s:HL("String",       s:string,       {},            "")
call s:HL("Character",    s:string,       {},            "")
call s:HL("Number",       s:magenta,      {},            "")
call s:HL("Boolean",      s:magenta,      {},            "")
call s:HL("Float",        s:magenta,      {},            "")

" Identifiers
call s:HL("Identifier",   s:blue,         {},            "")
call s:HL("Function",     s:orange,       {},            "")

" Statements
call s:HL("Statement",    s:blue,         {},            "")
call s:HL("Conditional",  s:blue,         {},            "")
call s:HL("Repeat",       s:blue,         {},            "")
call s:HL("Label",        s:blue,         {},            "")
call s:HL("Operator",     s:dark_brown,   {},            "")
call s:HL("Keyword",      s:blue,         {},            "")
call s:HL("Exception",    s:blue,         {},            "")

" PreProc
call s:HL("PreProc",      s:cyan,         {},            "")
call s:HL("Include",      s:cyan,         {},            "")
call s:HL("Define",       s:cyan,         {},            "")
call s:HL("Macro",        s:cyan,         {},            "")
call s:HL("PreCondit",    s:cyan,         {},            "")

" Types
call s:HL("Type",         s:green,        {},            "")
call s:HL("StorageClass", s:blue,         {},            "")
call s:HL("Structure",    s:green,        {},            "")
call s:HL("Typedef",      s:green,        {},            "")

" Special
call s:HL("Special",      s:cyan,         {},            "")
call s:HL("SpecialChar",  s:bright_cyan,  {},            "")
call s:HL("Tag",          s:bright_cyan,  {},            "")
call s:HL("Delimiter",    s:dark_brown,   {},            "")
call s:HL("SpecialComment", s:mid_gray,   {},            "italic")
call s:HL("Debug",        s:red,          {},            "")

" Underlined
call s:HL("Underlined",   s:blue,         {},            "underline")

" Errors
call s:HL("Error",        s:bright_red,   s:bg,          "")

" Language-specific
" Python
call s:HL("pythonBuiltin",     s:bright_blue, {},        "")
call s:HL("pythonFunction",    s:orange,      {},        "")
call s:HL("pythonDecorator",   s:cyan,        {},        "")
call s:HL("pythonInclude",     s:blue,        {},        "")
call s:HL("pythonException",   s:red,         {},        "")
call s:HL("pythonOperator",    s:dark_brown,  {},        "")

" JavaScript/TypeScript
call s:HL("jsFunction",        s:blue,        {},        "")
call s:HL("jsFuncName",        s:orange,      {},        "")
call s:HL("jsArrowFunction",   s:blue,        {},        "")
call s:HL("jsThis",            s:cyan,        {},        "")
call s:HL("jsSuper",           s:cyan,        {},        "")
call s:HL("jsNull",            s:magenta,     {},        "")
call s:HL("jsUndefined",       s:magenta,     {},        "")

" HTML
call s:HL("htmlTag",           s:mid_gray,    {},        "")
call s:HL("htmlEndTag",        s:mid_gray,    {},        "")
call s:HL("htmlTagName",       s:blue,        {},        "")
call s:HL("htmlArg",           s:bright_cyan, {},        "")
call s:HL("htmlSpecialChar",   s:magenta,     {},        "")

" CSS
call s:HL("cssClassName",      s:blue,        {},        "")
call s:HL("cssIdentifier",     s:blue,        {},        "")
call s:HL("cssProp",           s:orange,      {},        "")
call s:HL("cssColor",          s:magenta,     {},        "")
call s:HL("cssValueLength",    s:magenta,     {},        "")
call s:HL("cssValueNumber",    s:magenta,     {},        "")

" Markdown
call s:HL("markdownHeadingDelimiter", s:orange,       {},   "bold")
call s:HL("markdownHeading",          s:orange,       {},   "bold")
call s:HL("markdownH1",               s:orange,       {},   "bold")
call s:HL("markdownH2",               s:orange,       {},   "bold")
call s:HL("markdownH3",               s:orange,       {},   "bold")
call s:HL("markdownBold",             s:dark_brown,   {},   "bold")
call s:HL("markdownItalic",           s:dark_brown,   {},   "italic")
call s:HL("markdownCode",             s:green,        {},   "")
call s:HL("markdownCodeBlock",        s:green,        {},   "")
call s:HL("markdownLink",             s:blue,         {},   "underline")
call s:HL("markdownUrl",              s:bright_cyan,  {},   "")

" Git
call s:HL("gitcommitSummary",         s:orange,       {},   "")
call s:HL("gitcommitComment",         s:comment,      {},   "italic")
call s:HL("gitcommitBranch",          s:blue,         {},   "bold")
call s:HL("gitcommitHeader",          s:orange,       {},   "")

" GitGutter / Signify
call s:HL("GitGutterAdd",             s:green,        s:bg, "")
call s:HL("GitGutterChange",          s:orange,       s:bg, "")
call s:HL("GitGutterDelete",          s:red,          s:bg, "")
call s:HL("SignifySignAdd",           s:green,        s:bg, "")
call s:HL("SignifySignChange",        s:orange,       s:bg, "")
call s:HL("SignifySignDelete",        s:red,          s:bg, "")

" Neovim LSP
hi! link LspDiagnosticsDefaultError Error
hi! link LspDiagnosticsDefaultWarning WarningMsg
hi! link LspDiagnosticsDefaultInformation ModeMsg
hi! link LspDiagnosticsDefaultHint MoreMsg
hi! link LspDiagnosticsUnderlineError SpellBad
hi! link LspDiagnosticsUnderlineWarning SpellCap
hi! link LspDiagnosticsUnderlineInformation SpellLocal
hi! link LspDiagnosticsUnderlineHint SpellRare

" Treesitter
hi! link TSComment Comment
hi! link TSConstant Constant
hi! link TSString String
hi! link TSNumber Number
hi! link TSBoolean Boolean
hi! link TSFloat Float
hi! link TSFunction Function
hi! link TSMethod Function
hi! link TSKeyword Keyword
hi! link TSConditional Conditional
hi! link TSRepeat Repeat
hi! link TSOperator Operator
hi! link TSException Exception
hi! link TSInclude Include
hi! link TSType Type
hi! link TSVariable Identifier
hi! link TSProperty Identifier
hi! link TSParameter Identifier
hi! link TSField Identifier
hi! link TSConstructor Function
hi! link TSPunctBracket Delimiter
hi! link TSPunctDelimiter Delimiter
hi! link TSTag Tag
hi! link TSTagDelimiter Delimiter

" QuickUI highlight groups - warm light style
let s:menu_bg = { "gui": "#EDE5D8", "cterm": "254" }
let s:menu_dark = { "gui": "#D4C4A8", "cterm": "180" }
call s:HL('QuickDefaultBackground', s:fg, s:menu_bg, 'none')
call s:HL('QuickDefaultSel', s:bg, s:orange, 'bold')
call s:HL('QuickDefaultKey', s:blue, s:menu_bg, 'bold')
call s:HL('QuickDefaultDisable', s:mid_gray, s:menu_bg, 'none')
call s:HL('QuickDefaultHelp', s:green, s:menu_bg, 'none')
call s:HL('QuickDefaultBorder', s:orange, s:menu_bg, 'none')
call s:HL('QuickDefaultTermBorder', s:orange, s:menu_bg, 'none')
call s:HL('QuickDefaultPreview', {}, s:menu_bg, 'none')
