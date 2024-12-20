local M = {}

M.black = {
    -- Base colors
    bg = "#0f0f0f",                 -- editor.background
    fg = "#c8c8c8",                 -- editor.foreground

    black = "#0f0f0f",              -- terminal.ansiBlack
    red = "#D62C2C",                -- terminal.ansiRed
    orange = "#FF7135",         
    green = "56db3a"                -- terminal.ansiGreen, prev: #42dd76
    yellow = "#FFB638",             -- terminal.ansiYellow
    blue = "#28A9FF",               -- terminal.ansiBlue
    magenta = "#A95EFF",            -- terminal.ansiMagenta
    pink = "#FF478D",
    cyan = "#000aff",               -- terminal.ansiCyan
    white = "#c8c8c8",              -- terminal.ansiWhite

    bright_black = "#5b5b5f",       -- terminal.ansiBrightBlack
    bright_red = "#fc0606",         -- terminal.ansiBrightRed
    bright_green = "#21fe9b",       -- terminal.ansiBrightGreen
    bright_yellow = "#ffb838",      -- terminal.ansiBrightYellow
    bright_blue = "#28a9ff",        -- terminal.ansiBrightBlue
    bright_magenta = "#e66dff",     -- terminal.ansiBrightMagenta
    bright_cyan = "#00cfff",        -- terminal.ansiBrightCyan
    bright_white = "#fbfbfb",       -- terminal.ansiBrightWhite

    -- Special colors
    selectionBg = "#414143",        -- editor.selectionBackground (rrggbbaa -> hex, see above)
    selectionFg = "#c5c5cb",        -- editor.selectionForeground

    lineHighlightBg = "#1d1d20",    -- editor.lineHighlightBackground (rrggbbaa -> hex, see above)

    indentGuideActiveBg = "#44444d", -- editorIndentGuide.activeBackground1 (rrggbbaa -> hex, see above)
    indentGuideBg = "#0f0f11",       -- editorIndentGuide.Background1 (rrggbbaa -> hex, see above) #202024

    lineNumActiveFg = "#929293",    -- editorLineNumber.activeForeground
    lineNumFg = "#373741",          -- editorLineNumber.foreground

    whitespaceFg = "#2b2b30",       -- keyword.other.whitespace.liquid (rrggbbaa -> hex, see above)

    normalMode = "#444444",
    visualMode = blue,
    insertMode = green,

    statusbarBg = "#333333",        -- activityBar.background
    statusbarFg = "#5f5f65",        -- activityBar.foreground
    
    gray01 = statusbarBg,
    gray02 = "#444444",
    -- gray03 = "#323231", -- #323231
    gray04 = "#50505a",
    gray05 = "#555555",
    gray06 = "#666666", -- #767675
    -- gray07 = "#b6b6b5", -- #b6b6b5

    none = "NONE",
}

return M
