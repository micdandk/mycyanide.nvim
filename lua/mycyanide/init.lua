
local colors = require("mycyanide.colors")

local c     = require("mycyanide.colors").black
local cfg   = require("mycyanide.config").config
local utils = require("mycyanide.utils")
local M = {}

local set_terminal_colors = function(v)
  vim.g.terminal_color_0 = v.black
  vim.g.terminal_color_1 = v.red
  vim.g.terminal_color_2 = v.green
  vim.g.terminal_color_3 = v.yellow
  vim.g.terminal_color_4 = v.blue
  vim.g.terminal_color_5 = v.magenta
  vim.g.terminal_color_6 = v.cyan
  vim.g.terminal_color_7 = v.white
  vim.g.terminal_color_8 = v.bright_black
  vim.g.terminal_color_9 = v.bright_red
  vim.g.terminal_color_10 = v.bright_green
  vim.g.terminal_color_11 = v.bright_yellow
  vim.g.terminal_color_12 = v.bright_blue
  vim.g.terminal_color_13 = v.bright_magenta
  vim.g.terminal_color_14 = v.bright_cyan
  vim.g.terminal_color_15 = v.bright_white
  vim.g.terminal_color_background = v.bg
  vim.g.terminal_color_foreground = v.fg
end


local set_groups = function(v)
  local groups = {
    -- Base
    -- Editor highlight groups
    Normal        = { fg = v.fg, bg = cfg.transparent and v.none or v.bg }, -- normal text and background color
    NormalNC      = { fg = v.fg, bg = cfg.transparent and v.none or v.bg }, -- normal text in non-current windows
    SignColumn    = { fg = v.fg, bg = cfg.transparent and v.none or v.bg }, -- column where signs are displayed
    EndOfBuffer   = { fg = v.gray02 }, -- ~ lines at the end of a buffer
    NormalFloat   = { fg = v.fg, bg = v.statusbarBg }, -- normal text and background color for floating windows
    FloatBorder   = { fg = v.bright_blue, bg = v.statusbarBg },
    ColorColumn   = { fg = v.none, bg = v.gray02 }, --  used for the columns set with 'colorcolumn'
    Conceal       = { fg = v.gray05 }, -- placeholder characters substituted for concealed text (see 'conceallevel')
    Cursor        = { fg = v.cyan, bg = v.none, reverse = true }, -- the character under the cursor
    CursorIM      = { fg = v.cyan, bg = v.none, reverse = true }, -- like Cursor, but used when in IME mode
    Directory     = { fg = v.bright_blue, bg = v.none, bold = true }, -- directory names (and other special names in listings)
    DiffAdd       = { fg = v.green, bg = v.none, reverse = true }, -- diff mode: Added line
    DiffChange    = { fg = v.yellow, bg = v.none, reverse = true }, --  diff mode: Changed line
    DiffDelete    = { fg = v.red, bg = v.none, reverse = true }, -- diff mode: Deleted line
    DiffText      = { fg = v.fg, bg = v.none, reverse = true }, -- diff mode: Changed text within a changed line
    ErrorMsg      = { fg = v.red }, -- error messages
    Folded        = { fg = v.gray05, bg = v.none, italic = true },
    FoldColumn    = { fg = v.yellow },
    IncSearch     = { reverse = true },
    LineNr        = { fg = v.lineNumFg },
    CursorLineNr  = { fg = v.lineNumActiveFg },
    MatchParen    = { fg = v.yellow, bold = true },
    ModeMsg       = { fg = v.fg, bold = true }, -- "-- Insert --" text at the bottom
    MoreMsg       = { fg = v.cyan, bold = true },
    NonText       = { fg = v.whitespaceFg },  -- Whitespace
    Pmenu         = { fg = v.gray07, bg = v.statusbarBg },
    PmenuSel      = { fg = v.bg, bg = v.gray06 },
    PmenuSbar     = { fg = v.fg, bg = v.statusbarBg },
    PmenuThumb    = { fg = v.fg, bg = v.gray05 },
    Question      = { fg = v.green, bold = true },
    QuickFixLine  = { fg = v.yellow, bg = v.gray01, bold = true, italic = true },
    qfLineNr      = { fg = v.yellow, bg = v.gray01 },
    Search        = { reverse = true },
    SpecialKey    = { fg = v.gray03 },
    SpellBad      = { fg = v.red, bg = v.none, italic = true, undercurl = true },
    SpellCap      = { fg = v.yellow, bg = v.none, italic = true, undercurl = true },
    SpellLocal    = { fg = v.cyan, bg = v.none, italic = true, undercurl = true },
    SpellRare     = { fg = v.cyan, bg = v.none, italic = true, undercurl = true },
    StatusLine    = { fg = v.statusbarFg, bg = v.statusbarBg },
    StatusLineNC     = { fg = v.gray06, bg = v.gray01 },
    StatusLineTerm   = { fg = v.gray07, bg = v.gray01 },
    StatusLineTermNC = { fg = v.gray07, bg = v.gray01 },
    TabLineFill   = { fg = v.gray05, bg = v.gray01 },
    TablineSel    = { fg = v.bg, bg = v.gray07 },
    Tabline       = { fg = v.gray05 },
    Title         = { fg = v.cyan, bg = v.none, bold = true },
    Visual        = { fg = v.none, bg = v.selectionBg }, -- visual selection color
    VisualNOS     = { fg = v.none, bg = v.selectionBg },  -- According to a github issue, this is deprecated
    WarningMsg    = { fg = v.yellow, bold = true },
    WildMenu      = { fg = v.bg, bg = v.gray02, bold = true },
    CursorColumn  = { fg = v.none, bg = v.lineHighlightBg }, -- column highlight color
    CursorLine    = { fg = v.none, bg = v.lineHighlightBg }, -- line highlight color
    ToolbarLine   = { fg = v.fg, bg = v.gray01 },
    ToolbarButton = { fg = v.fg, bg = v.none, bold = true },
    NormalMode    = { fg = v.normalMode, bg = v.white, reverse = true },
    InsertMode    = { fg = v.insertMode, bg = v.none, reverse = true },
    VisualMode    = { fg = v.visualMode, bg = v.none, reverse = true },
    VertSplit     = { fg = v.gray02 }, -- line between two split buffers
    WinSeparator  = { fg = v.gray00, bg = v.none }, -- line between two split buffers
    CommandMode   = { fg = v.gray05, bg = v.none, reverse = true },
    Warnings      = { fg = v.yellow },
    healthError   = { fg = v.red },
    healthSuccess = { fg = v.green },
    healthWarning = { fg = v.yellow },
   --common
    Type           = { fg = v.cyan }, -- int, long, char, etv.
    StorageClass   = { fg = v.cyan }, -- static, register, volatile, etv.
    Structure      = { fg = v.cyan }, -- struct, union, enum, etv.
    Constant       = { fg = v.cyan }, -- any constant
    Comment        = { fg = v.gray02, bg = v.none, bold = cfg.comment_style.bold, italic = cfg.comment_style.italic }, -- italic comments
    Conditional    = { fg = v.cyan,   bg = v.none, bold = cfg.keyword_style.bold, italic = cfg.keyword_style.italic }, -- italic if, then, else, endif, switch, etv.
    Keyword        = { fg = v.cyan,   bg = v.none, bold = cfg.keyword_style.bold, italic = cfg.keyword_style.italic }, -- italic for, do, while, etv.
    Repeat         = { fg = v.yellow, bg = v.none, bold = cfg.keyword_style.bold, italic = cfg.keyword_style.italic }, -- italic any other keyword
    Boolean        = { fg = v.cyan,   bg = v.none, bold = cfg.boolean_style.bold, italic = cfg.boolean_style.italic }, -- true , false
    Function       = { fg = v.cyan,   bg = v.none, bold = cfg.function_style.bold, italic = cfg.function_style.italic },
    Identifier     = { fg = v.cyan,   bg = v.none }, -- any variable name
    String         = { fg = v.bright_green, bg = v.none }, -- Any string
    Character      = { fg = v.bright_green }, -- any character constant: 'c', '\n'
    Number         = { fg = v.bright_green }, -- a number constant: 5
    Float          = { fg = v.bright_green }, -- a floating point constant: 2.3e10
    Statement      = { fg = v.cyan }, -- any statement
    Label          = { fg = v.cyan }, -- case, default, etv.
    Operator       = { fg = v.none }, -- sizeof", "+", "*", etv.
    Exception      = { fg = v.cyan }, -- try, catch, throw
    PreProc        = { fg = v.yellow }, -- generic Preprocessor
    Include        = { fg = v.yellow }, -- preprocessor #include
    Define         = { fg = v.yellow }, -- preprocessor #define
    Macro          = { fg = v.yellow }, -- same as Define
    Typedef        = { fg = v.cyan }, -- A typedef
    PreCondit      = { fg = v.yellow }, -- preprocessor #if, #else, #endif, etv.
    Special        = { fg = v.yellow, bg = v.none, italic = true }, -- any special symbol
    SpecialChar    = { fg = v.cyan }, -- special character in a constant
    Tag            = { fg = v.yellow }, -- you can use CTRL-] on this
    Delimiter      = { fg = v.gray07 }, -- character that needs attention like , or .
    SpecialComment = { fg = v.gray03 }, -- special things inside a comment
    Debug          = { fg = v.orange }, -- debugging statements
    Underlined     = { fg = v.cyan,   bg = v.none, underline = true }, -- text that stands out, HTML links
    Ignore         = { fg = v.gray07 }, -- left blank, hidden
    Error          = { fg = v.red,    bg = v.none, bold = true, underline = true }, -- any erroneous construct
    Todo           = { fg = v.gray02, bg = v.none, bold = true, italic = true }, -- anything that needs extra attention; mostly the keywords TODO FIXME and XXX

    -- GitSigns
    GitSignsAdd      = { fg = v.green,         bg = v.none, bold = false, underline = false, italic = false },
    GitSignsAddLn    = { fg = v.green,         bg = v.none, bold = false, underline = false, italic = false },     
    GitSignsAddNr    = { fg = v.green,         bg = v.none, bold = false, underline = false, italic = false },     
    GitSignsChange   = { fg = v.bright_yellow, bg = v.none, bold = false, underline = false, italic = false },    -- #dbdb3a
    GitSignsChangeLn = { fg = v.bright_yellow, bg = v.none, bold = false, underline = false, italic = false },    -- #dbdb3a
    GitSignsChangeNr = { fg = v.bright_yellow, bg = v.none, bold = false, underline = false, italic = false },    -- #dbdb3a
    GitSignsDelete   = { fg = v.bright_red, bg = v.none, bold = false, underline = false, italic = false },    -- #db563a
    GitSignsDeleteLn = { fg = v.bright_red, bg = v.none, bold = false, underline = false, italic = false },    -- #db563a
    GitSignsDeleteNr = { fg = v.bright_red, bg = v.none, bold = false, underline = false, italic = false },    -- #db563a
    GitSignsUntracked        = { fg = v.gray02, bg = v.none, bold = false, underline = false, italic = false },    -- #db563a
    GitSignsCurrentLineBlame = { fg = v.gray06, bg = v.none, bold = false, underline = false, italic = false },    -- #db563a

    -- HTML
    htmlArg         = { fg = v.fg, italic = true },
    htmlBold        = { fg = v.fg, bg = v.none, bold = true },
    htmlEndTag      = { fg = v.fg },
    htmlStyle       = { fg = v.cyan, bg = v.none, italic = true },
    htmlLink        = { fg = v.cyan, underline = true },
    htmlSpecialChar = { fg = v.yellow },
    htmlSpecialTagName = { fg = v.blue, bold = true },
    htmlTag         = { fg = v.fg },
    htmlTagN        = { fg = v.blue },
    htmlTagName     = { fg = v.blue },
    htmlTitle       = { fg = v.fg },
    htmlH1          = { fg = v.blue, bold = true },
    htmlH2          = { fg = v.blue, bold = true },
    htmlH3          = { fg = v.blue, bold = true },
    htmlH4          = { fg = v.blue, bold = true },
    htmlH5          = { fg = v.blue, bold = true },
    -- Markdown
    markdownH1      = { fg = v.white, bold = true },
    markdownH2      = { fg = v.white, bold = true },
    markdownH3      = { fg = v.white, bold = true },
    markdownH4      = { fg = v.white, bold = true },
    markdownH5      = { fg = v.white, bold = true },
    markdownH6      = { fg = v.white, bold = true },
    markdownHeadingDelimiter = { fg = v.gray05 },
    markdownHeadingRule   = { fg = v.gray05 },
    markdownId            = { fg = v.cyan },
    markdownIdDeclaration = { fg = v.blue },
    markdownIdDelimiter   = { fg = v.cyan },
    markdownLinkDelimiter = { fg = v.gray05 },
    markdownLinkText      = { fg = v.white, italic = true },
    markdownListMarker    = { fg = v.yellow },
    markdownOrderedListMarker = { fg = v.yellow },
    markdownRule          = { fg = v.gray05 },
    markdownUrl           = { fg = v.gray06, bg = v.none },
    markdownBlockquote    = { fg = v.gray07 },
    markdownBold          = { fg = v.fg, bg = v.none, bold = true },
    markdownItalic        = { fg = v.fg, bg = v.none, italic = true },
    markdownCode          = { fg = v.fg, bg = v.gray02 },
    markdownCodeBlock     = { fg = v.fg, bg = v.gray02 },
    markdownCodeDelimiter = { fg = v.fg, bg = v.gray02 },
    -- Dashboard
    DashboardShortCut = { fg = v.red },
    DashboardHeader   = { fg = v.magenta },
    DashboardCenter   = { fg = v.blue },
    DashboardFooter   = { fg = v.green, italic = true },
    -- TreeSitter highlight groups
    TSAnnotation      = { fg = v.yellow }, -- For C++/Dart attributes, annotations that can be attached to the code to denote some kind of meta information.
    TSAttribute       = { fg = v.fg }, -- (unstable) TODO: docs
    TSBoolean         = { fg = v.cyan, bg = v.none, bold = cfg.boolean_style.bold, italic = cfg.boolean_style.italic }, -- true or false
    TSCharacter       = { fg = v.bright_green }, -- For characters.
    TSComment         = { fg = v.gray02, bg = v.none, bold = cfg.comment_style.bold, italic = cfg.comment_style.italic }, -- For comment blocks.
    TSConditional     = { fg = v.cyan, bold = cfg.keyword_style.bold, italic = cfg.keyword_style.italic }, -- For keywords related to conditionnals.
    TSConstant        = { fg = v.cyan }, -- For constants
    TSConstBuiltin    = { fg = v.cyan, italic = true }, -- For constants that are built in the language: `nil` in Lua.
    TSConstMacro      = { fg = v.cyan }, -- For constants that are defined by macros: `NULL` in v.
    TSConstructor     = { fg = v.cyan }, -- For constructor calls and definitions: `= { }` in Lua, and Java constructors.
    TSError           = { fg = v.red }, -- For syntax/parser errors.
    TSException       = { fg = v.cyan }, -- For exception related keywords.
    TSField           = { fg = v.cyan }, -- For fields.
    TSFloat           = { fg = v.bright_green }, -- For floats.
    TSFunction        = { fg = v.cyan, bold = cfg.function_style.bold, italic = cfg.function_style.italic }, -- For fuction (calls and definitions).
    TSFuncBuiltin     = { fg = v.fg, bold = cfg.function_style.bold, italic = cfg.function_style.italic }, -- For builtin functions: `table.insert` in Lua.
    TSFuncMacro       = { fg = v.cyan }, -- For macro defined fuctions (calls and definitions): each `macro_rules` in Rust.
    TSInclude         = { fg = v.cyan, italic = true }, -- For includes: `#include` C, `use` or `extern crate` in Rust, or `require` in Lua.
    TSKeyword         = { fg = v.cyan, bold = cfg.keyword_style.bold, italic = cfg.keyword_style.italic }, -- For keywords that don't fall in previous categories.
    TSKeywordFunction = { fg = v.cyan, bold = cfg.function_style.bold, italic = cfg.function_style.italic }, -- For keywords used to define a fuction.
    TSKeywordOperator = { fg = v.yellow }, -- For operators that are English words, e.g. `and`, `as`, `or`.
    TSKeywordReturn   = { fg = v.cyan, bold = cfg.keyword_style.bold, italic = cfg.keyword_style.italic }, -- For the `return` and `yield` keywords.
    TSLabel           = { fg = v.cyan }, -- For labels: `label:` in C and `:label:` in Lua.
    TSMethod          = { fg = v.cyan, bold = cfg.function_style.bold, italic = cfg.function_style.italic }, -- For method calls and definitions.
    TSNamespace       = { fg = v.cyan }, -- For identifiers referring to modules and namespaces.
    -- TSNone = {}, -- No highlighting. Don't change the values of this highlight group.
    TSNumber        = { fg = v.bright_green }, -- For all numbers
    TSOperator      = { fg = v.yellow }, -- For any operator: `+`, but also `->` and `*` in v.
    TSParameter     = { fg = v.cyan }, -- For parameters of a function.
    TSParameterReference = { fg = v.cyan }, -- For references to parameters of a function.
    TSProperty      = { fg = v.fg }, -- Same as `TSField`.
    TSPunctDelimiter = { fg = v.fg }, -- For delimiters ie: `.`
    TSPunctBracket  = { fg = v.fg }, -- For brackets and parens.
    TSPunctSpecial  = { fg = v.fg }, -- For special punctutation that does not fall in the catagories before.
    TSRepeat        = { fg = v.cyan, bold = cfg.keyword_style.bold, italic = cfg.keyword_style.italic }, -- For keywords related to loops.
    TSString        = { fg = v.bright_green }, -- For strings.
    TSStringRegex   = { fg = v.yellow }, -- For regexes.
    TSStringEscape  = { fg = v.bright_green }, -- For escape characters within a string.
    TSStringSpecial = { fg = v.bright_green }, -- For strings with special meaning that don't fit into the above categories.
    TSSymbol        = { fg = v.cyan }, -- For identifiers referring to symbols or atoms.
    TSTag           = { fg = v.cyan }, -- Tags like html tag names.
    TSTagAttribute  = { fg = v.fg, italic = true }, -- For html tag attributes.
    TSTagDelimiter  = { fg = v.gray05 }, -- Tag delimiter like `<` `>` `/`
    TSText          = { fg = v.fg }, -- For strings considered text in a markup language.
    TSStrong        = { fg = v.white, bold = true }, -- For text to be represented in bold.
    TSEmphasis      = { fg = v.white, bold = true, italic = true }, -- For text to be represented with emphasis.
    TSUnderline     = { fg = v.white, bg = v.none, underline = true }, -- For text to be represented with an underline.
    TSStrike        = { }, -- For strikethrough text.
    TSTitle         = { fg = v.fg, bg = v.none, bold = true }, -- Text that is part of a title.
    TSLiteral       = { fg = v.fg }, -- Literal text.
    TSURI           = { fg = v.cyan }, -- Any URL like a link or email.
    TSMath          = { fg = v.cyan }, -- For LaTeX-like math environments.
    TSTextReference = { fg = v.yellow }, -- For footnotes, text references, citations.
    TSEnvironment   = { fg = v.cyan }, -- For text environments of markup languages.
    TSEnvironmentName = { fg = v.cyan }, -- For the name/the string indicating the type of text environment.
    TSNote          = { fg = v.yellow, italic = true }, -- Text representation of an informational note.
    TSWarning       = { fg = v.yellow, italic = true }, -- Text representation of a warning note.
    TSDanger        = { fg = v.red, italic = true }, -- Text representation of a danger note.
    TSType          = { fg = v.cyan }, -- For types.
    TSTypeBuiltin   = { fg = v.cyan }, -- For builtin types.
    TSVariable      = { fg = v.cyan, bold = cfg.variable_style.bold, italic = cfg.variable_style.italic }, -- Any variable name that does not have another highlight.
    TSVariableBuiltin = { fg = v.fg, bold = cfg.variable_style.bold, italic = cfg.variable_style.italic }, -- Variable names that are defined by the languages, like `this` or `self`.
    -- highlight groups for the native LSP client
    LspReferenceText = { fg = v.bg, bg = v.magenta }, -- used for highlighting "text" references
    LspReferenceRead = { fg = v.bg, bg = v.magenta }, -- used for highlighting "read" references
    LspReferenceWrite = { fg = v.bg, bg = v.magenta }, -- used for highlighting "write" references
    -- Diagnostics
    DiagnosticError = { fg = v.red }, -- base highlight group for "Error"
    DiagnosticWarn = { fg = v.yellow }, -- base highlight group for "Warning"
    DiagnosticInfo = { fg = v.blue }, -- base highlight group from "Information"
    DiagnosticHint = { fg = v.cyan }, -- base highlight group for "Hint"
    DiagnosticUnderlineError = { fg = v.red, undercurl = true, sp = v.red }, -- used to underline "Error" diagnostics.
    DiagnosticUnderlineWarn = { fg = v.yellow, undercurl = true, sp = v.yellow }, -- used to underline "Warning" diagnostics.
    DiagnosticUnderlineInfo = { fg = v.blue, undercurl = true, sp = v.blue }, -- used to underline "Information" diagnostics.
    DiagnosticUnderlineHint = { fg = v.cyan, undercurl = true, sp = v.cyan }, -- used to underline "Hint" diagnostics.
    -- Diagnostics (old)
    LspDiagnosticsDefaultError = { fg = v.red }, -- used for "Error" diagnostic virtual text
    LspDiagnosticsSignError = { fg = v.red }, -- used for "Error" diagnostic signs in sign column
    LspDiagnosticsFloatingError = { fg = v.red, bold = true }, -- used for "Error" diagnostic messages in the diagnostics float
    LspDiagnosticsVirtualTextError = { fg = v.red, bold = true }, -- Virtual text "Error"
    LspDiagnosticsUnderlineError = { fg = v.red, undercurl = true, sp = v.red }, -- used to underline "Error" diagnostics.
    LspDiagnosticsDefaultWarning = { fg = v.yellow }, -- used for "Warning" diagnostic signs in sign column
    LspDiagnosticsSignWarning = { fg = v.yellow }, -- used for "Warning" diagnostic signs in sign column
    LspDiagnosticsFloatingWarning = { fg = v.yellow, bold = true }, -- used for "Warning" diagnostic messages in the diagnostics float
    LspDiagnosticsVirtualTextWarning = { fg = v.yellow, bold = true }, -- Virtual text "Warning"
    LspDiagnosticsUnderlineWarning = { fg = v.yellow, undercurl = true, sp = v.yellow }, -- used to underline "Warning" diagnostics.
    LspDiagnosticsDefaultInformation = { fg = v.blue }, -- used for "Information" diagnostic virtual text
    LspDiagnosticsSignInformation = { fg = v.blue }, -- used for "Information" diagnostic signs in sign column
    LspDiagnosticsFloatingInformation = { fg = v.blue, bold = true }, -- used for "Information" diagnostic messages in the diagnostics float
    LspDiagnosticsVirtualTextInformation = { fg = v.blue, bold = true }, -- Virtual text "Information"
    LspDiagnosticsUnderlineInformation = { fg = v.blue, undercurl = true, sp = v.blue }, -- used to underline "Information" diagnostics.
    LspDiagnosticsDefaultHint = { fg = v.cyan }, -- used for "Hint" diagnostic virtual text
    LspDiagnosticsSignHint = { fg = v.cyan }, -- used for "Hint" diagnostic signs in sign column
    LspDiagnosticsFloatingHint = { fg = v.cyan, bold = true }, -- used for "Hint" diagnostic messages in the diagnostics float
    LspDiagnosticsVirtualTextHint = { fg = v.cyan, bold = true }, -- Virtual text "Hint"
    LspDiagnosticsUnderlineHint = { fg = v.cyan, undercurl = true, sp = v.cyan }, -- used to underline "Hint" diagnostics.
    -- Plugins highlight groups
    -- LspTrouble
    LspTroubleText = { fg = v.gray04 },
    LspTroubleCount = { fg = v.magenta, bg = v.gray03 },
    LspTroubleNormal = { fg = v.fg, bg = v.bg },
    -- Diff
    diffAdded = { fg = v.green },
    diffRemoved = { fg = v.red },
    diffChanged = { fg = v.blue },
    diffOldFile = { fg = v.gray04 },
    diffNewFile = { fg = v.fg },
    diffFile = { fg = v.gray05 },
    diffLine = { fg = v.cyan },
    diffIndexLine = { fg = v.magenta },
    -- Telescope
    TelescopeSelectionCaret = { fg = v.none, bg = v.gray02 },
    TelescopeBorder = { fg = v.cyan },
    TelescopePromptBorder = { fg = v.blue },
    TelescopeResultsBorder = { fg = v.blue }, -- orig gray02
    TelescopePreviewBorder = { fg = v.gray02 },
    TelescopeMatching = { fg = v.yellow },
    TelescopePromptPrefix = { fg = v.blue },
    -- NvimTree              https://github.com/nvim-tree/nvim-tree.lua/blob/master/lua/nvim-tree/appearance/init.lua
    NvimTreeNormal = { fg = v.fg, bg = cfg.transparent and v.none or v.bg },
    NvimTreeIndentMarker = { fg = v.gray03 },

    NvimTreeImageFile = { fg = v.white },
    NvimTreeExecFile = { fg = v.green },
    NvimTreeSpecialFile = { fg = v.magenta },
    NvimTreeOpenedFile = { fg = v.blue },

    NvimTreeFolderName = { fg = v.white },
    NvimTreeRootFolder = { fg = v.white, bold = true },
    NvimTreeEmptyFolderName = { fg = v.gray02 },

    NvimTreeFolderIcon = { fg = v.blue }, -- make this customizable
    NvimTreeOpenedFolderName = { fg = v.white, bold = true },
    -- NvimTreeOpenedFolderIcon = { fg = v.blue },

    NvimTreeCutHL = { fg = v.red },
    NvimTreeCopiedHL = { fg = v.green },

    NvimTreeGitDirty = { fg = v.gray07 },
    NvimTreeGitStaged = { fg = v.cyan },
    NvimTreeGitRenamed = { fg = v.yellow },
    NvimTreeGitNew = { fg = v.green },
    NvimTreeGitDeleted = { fg = v.red },
    -- Ale-vim
    ALEError = { fg = v.red },
    ALEWarning = { fg = v.yellow },
    ALEInfo = { fg = v.blue },
    ALEErrorSign = { fg = v.red },
    ALEWarningSign = { fg = v.yellow },
    ALEInfoSign = { fg = v.blue },
    ALEVirtualTextError = { fg = v.red },
    ALEVirtualTextWarning = { fg = v.yellow },
    ALEVirtualTextInfo = { fg = v.blue },
    -- WhichKey
    WhichKey = { fg = v.blue },
    WhichKeyGroup = { fg = v.yellow, italic = true },
    WhichKeyDesc = { fg = v.blue },
    WhichKeySeperator = { fg = v.gray05 },
    WhichKeyFloating = { bg = v.gray01 },
    WhichKeyFloat = { bg = v.gray01 },
    -- LspSaga
    LspSagaFinderSelection = { fg = v.magenta },
    LspSagaLspFinderBorder = { fg = v.gray05 },
    LspFloatWinNormal = { bg = v.bg },
    LspFloatWinBorder = { fg = v.gray05 },
    LspSagaBorderTitle = { fg = v.gray07 },
    TargetWord = { fg = v.cyan },
    ReferencesCount = { fg = v.gray07 },
    DefinitionCount = { fg = v.gray07 },
    TargetFileName = { fg = v.blue },
    DefinitionIcon = { fg = v.gray07 },
    ReferencesIcon = { fg = v.gray07 },
    ProviderTruncateLine = { fg = v.gray05 },
    SagaShadow = { fg = v.gray05 },
    DiagnosticTruncateLine = { fg = v.gray05 },
    DiagnosticWarning = { fg = v.red },
    DiagnosticInformation = { fg = v.blue },
    DefinitionPreviewTitle = { fg = v.gray07 },
    LspSagaShTruncateLine = { fg = v.gray05 },
    LspSagaDocTruncateLine = { fg = v.gray05 },
    LspSagaCodeActionTitle = { fg = v.gray07 },
    LspSagaCodeActionTruncateLine = { fg = v.gray05 },
    LspSagaCodeActionContent = { fg = v.magenta },
    LspSagaRenamePromptPrefix = { fg = v.green },
    LspSagaRenameBorder = { fg = v.gray05 },
    LspSagaHoverBorder = { fg = v.gray05 },
    LspSagaSignatureHelpBorder = { fg = v.gray05 },
    LspSagaCodeActionBorder = { fg = v.gray05 },
    LspSagaAutoPreview = { fg = v.gray07 },
    LspSagaDefPreviewBorder = { fg = v.gray05 },
    LspLinesDiagBorder = { fg = v.gray05 },
    LspSagaLightBulb = { fg = v.gray07 },
    LspSagaLightBulbSign = { fg = v.gray07 },
    LspSagaDiagnosticBorder = { fg = v.gray05 },
    LspSagaDiagnosticHeader = { fg = v.gray07 },
    LspSagaDiagnosticTruncateLine = { fg = v.gray05 },
    -- BufferLine
    BufferLineIndicatorSelected = { fg = v.yellow },
    BufferLineFill = { bg = v.statusbarBg },
    -- Sneak
    Sneak = { fg = v.bg, bg = v.blue },
    SneakScope = { bg = v.gray04 },
    -- Indent Blankline
    IndentBlanklineChar = { fg = v.indentGuideBg },
    IndentBlanklineContextChar = { fg = v.indentGuideActiveBg },
    -- nvim-cmp
    CmpItemAbbrDeprecated = { fg = v.gray05, strikethrough = true },
    CmpItemAbbrMatch = { fg = v.yellow },
    CmpItemAbbrMatchFuzzy = { fg = v.yellow },
    CmpItemKindVariable = { fg = v.blue },
    CmpItemKindInterface = { fg = v.blue },
    CmpItemKindText = { fg = v.blue },
    CmpItemKindFunction = { fg = v.magenta },
    CmpItemKindMethod = { fg = v.magenta },
    CmpItemKindKeyword = { fg = v.fg },
    CmpItemKindProperty = { fg = v.fg },
    CmpItemKindUnit = { fg = v.fg },
    -- mini.nvim
    MiniStatuslineModeNormal = { fg = v.bg, bg = v.normalMode },
    MiniStatuslineModeInsert = { fg = v.bg, bg = v.insertMode },
    MiniStatuslineModeVisual = { fg = v.bg, bg = v.visualMode },
    MiniStatuslineModeReplace = { fg = v.bg, bg = v.yellow },
    MiniStatuslineModeCommand = { fg = v.bg, bg = v.green },
    MiniStatuslineModeOther = { fg = v.gray05, bg = v.gray01 },
    MiniStatuslineDevInfo = { fg = v.fg, bg = v.gray02 },
    MiniStatuslineFilename = { fg = v.fg, bg = v.gray01 },
    MiniStatuslineFileinfo = { fg = v.fg, bg = v.gray02 },
    MiniStatuslineInactive = { fg = v.gray05, bg = v.gray01 },
    MiniTablineCurrent = { fg = v.bg, bg = v.cyan },
    MiniTablineVisible = { fg = v.bg, bg = v.magenta },
    MiniTablineHidden = { fg = v.gray05, bg = v.gray02 },
    MiniTablineModifiedCurrent = { fg = v.bg, bg = v.cyan },
    MiniTablineModifiedVisible = { fg = v.bg, bg = v.magenta },
    MiniTablineModifiedHidden = { fg = v.gray05, bg = v.gray02 },
    MiniTablineFill = { bg = v.gray01 },
    MiniCursorword = { underline = true },
    MiniSurround = { underline = true },
    MiniTrailspace = { bg = v.red },
    MiniCompletionActiveParameter = { underline = true },
    MiniJump = { reverse = true },
    MiniStarterCurrent = { fg = v.cyan },
    MiniStarterFooter = { fg = v.gray07 },
    MiniStarterHeader = { fg = v.blue },
    MiniStarterInactive = { fg = v.gray07 },
    MiniStarterItem = { fg = v.fg, bg = v.gray01 },
    MiniStarterItemBullet = { bg = v.gray01 },
    MiniStarterItemPrefix = { underline = true },
    MiniStarterSelection = { fg = v.magenta },
    MiniStarterQuery = { fg = v.magenta },
    -- Custom highlight groups for use in statusline plugins
    StatusLineNormalMode = { fg = v.black, bg = v.gray02 },
    StatusLineInsertMode = { fg = v.black, bg = v.gray03 },
    StatusLineVisualMode = { fg = v.black, bg = v.gray04 },
    StatusLineReplaceMode = { fg = v.black, bg = v.gray05 },
    StatusLineTerminalMode = { fg = v.black, bg = v.gray05 },
    StatusLineHint = { fg = v.blue, bg = v.gray01 },
    StatusLineInfo = { fg = v.green, bg = v.gray01 },
    StatusLineWarn = { fg = v.yellow, bg = v.gray01 },
    StatusLineError = { fg = v.red, bg = v.gray01 },
    -- Hydra
    HydraRed = { fg = v.red },
    HydraBlue = { fg = v.blue },
    HydraAmaranth = { fg = v.red },
    HydraTeal = { fg = v.cyan },
    HydraPink = { fg = v.magenta },
    HydraHint = { fg = v.fg, bg = v.gray02 },
    -- JSON
    jsonNumber = { fg = v.bright_green },
    jsonNull = { fg = v.black },
    jsonString = { fg = v.bright_green },
    jsonKeyword = { fg = v.blue },
  }

  for group, parameters in pairs(groups) do
    utils.highlight(group, parameters)
  end
end

M.colorscheme = function()
  vim.api.nvim_command("hi clear")
  if vim.fn.exists("syntax_on") then
    vim.api.nvim_command("syntax reset")
  end

  vim.o.termguicolors = true
  vim.g.colors_name = "mycyanide"
  if vim.o.background == "light" then
    variant = colors.white
  else
    variant = colors.black
  end  
  set_terminal_colors(colors.black)
  set_groups(colors.black)
end

return M
