" Berg colorscheme for Neovim/Vim
" Bloomberg terminal inspired theme
" Based on: https://github.com/jx22/berg

set background=dark
highlight clear

if exists("syntax_on")
  syntax reset
endif

let g:colors_name = "berg"

" Color Palette
let s:black       = { "gui": "#000000", "cterm": "0"   }
let s:red         = { "gui": "#d54135", "cterm": "1"   }
let s:green       = { "gui": "#60C487", "cterm": "2"   }
let s:yellow      = { "gui": "#FEE334", "cterm": "3"   }
let s:blue        = { "gui": "#6D96D0", "cterm": "4"   }
let s:magenta     = { "gui": "#7a3577", "cterm": "5"   }
let s:cyan        = { "gui": "#4DC7F9", "cterm": "6"   }
let s:white       = { "gui": "#acacae", "cterm": "7"   }

let s:bright_black   = { "gui": "#464646", "cterm": "8"  }
let s:bright_red     = { "gui": "#e65a4d", "cterm": "9"  }
let s:bright_green   = { "gui": "#5dc453", "cterm": "10" }
let s:orange         = { "gui": "#f49f31", "cterm": "11" }
let s:bright_blue    = { "gui": "#8baad6", "cterm": "12" }
let s:bright_magenta = { "gui": "#9d4a99", "cterm": "13" }
let s:bright_cyan    = { "gui": "#ABD3E0", "cterm": "14" }
let s:bright_white   = { "gui": "#d7d7d7", "cterm": "15" }

" Theme colors
let s:bg          = { "gui": "#000000", "cterm": "0"   }
let s:fg          = { "gui": "#f49f31", "cterm": "11"  }
let s:gray        = { "gui": "#646667", "cterm": "8"   }
let s:light_gray  = { "gui": "#acacae", "cterm": "7"   }
let s:dark_gray   = { "gui": "#282828", "cterm": "8"   }
let s:darker_gray = { "gui": "#202020", "cterm": "0"   }
let s:selection   = { "gui": "#353f40", "cterm": "8"   }
let s:comment     = { "gui": "#d54135", "cterm": "1"   }
let s:string      = { "gui": "#a67228", "cterm": "3"   }

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
call s:HL("Cursor",       s:bg,           s:cyan,        "")
call s:HL("CursorLine",   {},             s:darker_gray, "")
call s:HL("CursorColumn", {},             s:darker_gray, "")
call s:HL("LineNr",       s:gray,         s:bg,          "")
call s:HL("CursorLineNr", s:orange,       s:darker_gray, "bold")
call s:HL("Visual",       {},             s:selection,   "")
call s:HL("VisualNOS",    {},             s:selection,   "")
call s:HL("Search",       s:black,        s:yellow,      "")
call s:HL("IncSearch",    s:black,        s:orange,      "")
call s:HL("MatchParen",   s:cyan,         s:selection,   "bold")

" Gutter
call s:HL("SignColumn",   s:gray,         s:bg,          "")
call s:HL("FoldColumn",   s:gray,         s:bg,          "")
call s:HL("Folded",       s:gray,         s:darker_gray, "")

" Statusline
call s:HL("StatusLine",   s:orange,       s:darker_gray, "")
call s:HL("StatusLineNC", s:gray,         s:darker_gray, "")

" Tabline
call s:HL("TabLine",      s:light_gray,   s:darker_gray, "")
call s:HL("TabLineFill",  {},             s:darker_gray, "")
call s:HL("TabLineSel",   s:orange,       s:dark_gray,   "bold")

" Popup menu
call s:HL("Pmenu",        s:light_gray,   s:darker_gray, "")
call s:HL("PmenuSel",     s:black,        s:orange,      "")
call s:HL("PmenuSbar",    {},             s:dark_gray,   "")
call s:HL("PmenuThumb",   {},             s:gray,        "")

" Messages
call s:HL("ErrorMsg",     s:bright_red,   s:bg,          "")
call s:HL("WarningMsg",   s:orange,       s:bg,          "")
call s:HL("ModeMsg",      s:green,        s:bg,          "")
call s:HL("MoreMsg",      s:cyan,         s:bg,          "")
call s:HL("Question",     s:cyan,         s:bg,          "")

" Splits
call s:HL("VertSplit",    s:dark_gray,    s:bg,          "")

" Diff
call s:HL("DiffAdd",      s:green,        s:darker_gray, "")
call s:HL("DiffChange",   s:orange,       s:darker_gray, "")
call s:HL("DiffDelete",   s:red,          s:darker_gray, "")
call s:HL("DiffText",     s:blue,         s:selection,   "")

" Spelling
call s:HL("SpellBad",     s:red,          {},            "undercurl")
call s:HL("SpellCap",     s:orange,       {},            "undercurl")
call s:HL("SpellLocal",   s:yellow,       {},            "undercurl")
call s:HL("SpellRare",    s:cyan,         {},            "undercurl")

" Misc
call s:HL("Directory",    s:cyan,         {},            "")
call s:HL("SpecialKey",   s:gray,         {},            "")
call s:HL("Title",        s:yellow,       {},            "bold")
call s:HL("NonText",      s:gray,         {},            "")
call s:HL("Conceal",      s:gray,         s:bg,          "")

" Syntax Highlighting
" Comments
call s:HL("Comment",      s:comment,      {},            "italic")
call s:HL("Todo",         s:orange,       s:darker_gray, "bold")

" Constants
call s:HL("Constant",     s:magenta,      {},            "")
call s:HL("String",       s:string,       {},            "")
call s:HL("Character",    s:string,       {},            "")
call s:HL("Number",       s:magenta,      {},            "")
call s:HL("Boolean",      s:magenta,      {},            "")
call s:HL("Float",        s:magenta,      {},            "")

" Identifiers
call s:HL("Identifier",   s:blue,         {},            "")
call s:HL("Function",     s:yellow,       {},            "")

" Statements
call s:HL("Statement",    s:blue,         {},            "")
call s:HL("Conditional",  s:blue,         {},            "")
call s:HL("Repeat",       s:blue,         {},            "")
call s:HL("Label",        s:blue,         {},            "")
call s:HL("Operator",     s:blue,         {},            "")
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
call s:HL("Delimiter",    s:orange,       {},            "")
call s:HL("SpecialComment", s:gray,       {},            "italic")
call s:HL("Debug",        s:red,          {},            "")

" Underlined
call s:HL("Underlined",   s:cyan,         {},            "underline")

" Errors
call s:HL("Error",        s:bright_red,   s:bg,          "")

" Language-specific
" Python
call s:HL("pythonBuiltin",     s:bright_blue, {},        "")
call s:HL("pythonFunction",    s:yellow,      {},        "")
call s:HL("pythonDecorator",   s:cyan,        {},        "")
call s:HL("pythonInclude",     s:blue,        {},        "")
call s:HL("pythonException",   s:red,         {},        "")
call s:HL("pythonOperator",    s:blue,        {},        "")

" JavaScript/TypeScript
call s:HL("jsFunction",        s:blue,        {},        "")
call s:HL("jsFuncName",        s:yellow,      {},        "")
call s:HL("jsArrowFunction",   s:blue,        {},        "")
call s:HL("jsThis",            s:cyan,        {},        "")
call s:HL("jsSuper",           s:cyan,        {},        "")
call s:HL("jsNull",            s:magenta,     {},        "")
call s:HL("jsUndefined",       s:magenta,     {},        "")

" HTML
call s:HL("htmlTag",           s:gray,        {},        "")
call s:HL("htmlEndTag",        s:gray,        {},        "")
call s:HL("htmlTagName",       s:cyan,        {},        "")
call s:HL("htmlArg",           s:bright_cyan, {},        "")
call s:HL("htmlSpecialChar",   s:magenta,     {},        "")

" CSS
call s:HL("cssClassName",      s:cyan,        {},        "")
call s:HL("cssIdentifier",     s:cyan,        {},        "")
call s:HL("cssProp",           s:orange,      {},        "")
call s:HL("cssColor",          s:magenta,     {},        "")
call s:HL("cssValueLength",    s:magenta,     {},        "")
call s:HL("cssValueNumber",    s:magenta,     {},        "")

" Markdown
call s:HL("markdownHeadingDelimiter", s:yellow,       {},   "bold")
call s:HL("markdownHeading",          s:yellow,       {},   "bold")
call s:HL("markdownH1",               s:yellow,       {},   "bold")
call s:HL("markdownH2",               s:yellow,       {},   "bold")
call s:HL("markdownH3",               s:yellow,       {},   "bold")
call s:HL("markdownBold",             s:orange,       {},   "bold")
call s:HL("markdownItalic",           s:orange,       {},   "italic")
call s:HL("markdownCode",             s:green,        {},   "")
call s:HL("markdownCodeBlock",        s:green,        {},   "")
call s:HL("markdownLink",             s:cyan,         {},   "underline")
call s:HL("markdownUrl",              s:bright_cyan,  {},   "")

" Git
call s:HL("gitcommitSummary",         s:yellow,       {},   "")
call s:HL("gitcommitComment",         s:comment,      {},   "italic")
call s:HL("gitcommitBranch",          s:cyan,         {},   "bold")
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

" QuickUI highlight groups - Bloomberg terminal style with dark red background
let s:darkred = { "gui": "#2d0000", "cterm": "52" }
call s:HL('QuickDefaultBackground', s:fg, s:darkred, 'none')
call s:HL('QuickDefaultSel', s:black, s:orange, 'bold')
call s:HL('QuickDefaultKey', s:cyan, s:darkred, 'bold')
call s:HL('QuickDefaultDisable', s:gray, s:darkred, 'none')
call s:HL('QuickDefaultHelp', s:bright_green, s:darkred, 'none')
call s:HL('QuickDefaultBorder', s:red, s:darkred, 'none')
call s:HL('QuickDefaultTermBorder', s:red, s:darkred, 'none')
call s:HL('QuickDefaultPreview', {}, s:darkred, 'none')
