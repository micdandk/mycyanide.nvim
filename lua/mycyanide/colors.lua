local M = {}

M.black = {
    -- Base colors
    bg = "#0f0f0f",                 -- editor.background
    fg = "#c8c8c8",                 -- editor.foreground

    black = "#0f0f0f",              -- terminal.ansiBlack
    red = "#D62C2C",                -- terminal.ansiRed
    orange = "#FF7135",         
    green = "#56db3a",               -- terminal.ansiGreen, prev: #42dd76
    yellow = "#FFB638",             -- terminal.ansiYellow
    -- blue = "#28A9FF",               -- terminal.ansiBlue
    blue = "#00afff",               -- terminal.ansiBlue
    magenta = "#A95EFF",            -- terminal.ansiMagenta
    pink = "#FF478D",
    cyan = "#00afff",               -- terminal.ansiCyan
    white = "#c8c8c8",              -- terminal.ansiWhite

    bright_black = "#5b5b5f",       -- terminal.ansiBrightBlack
    bright_red = "#fc0606",         -- terminal.ansiBrightRed
    bright_green = "#41feab",       -- terminal.ansiBrightGreen
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
    gray00 = "#181818",   
    gray01 = statusbarBg,
    gray02 = "#444444",
    -- gray03 = "#323231", -- #323231
    gray04 = "#50505a",
    gray05 = "#555555",
    gray06 = "#666666", -- #767675
    -- gray07 = "#b6b6b5", -- #b6b6b5

    none = "NONE",
}

-- Kitty colors:
-- color9 #e8bacf
-- color10 #3a3332
-- color11 #494542
-- color12 #7f7c7b
-- color13 #d624d3
-- color14 #ccab53
-- color15 #f7f7f7

M.white= {
    -- Base colors
    bg = "#fafafa",                 -- editor.background
    fg = "#333333",                 -- editor.foreground

    black = "#0f0f0f",              -- terminal.ansiBlack
    red = "#da2c20",                -- terminal.ansiRed
    orange = "#fcac02",         
    green = "#00a152",               -- terminal.ansiGreen, prev: #42dd76
    yellow = "#fcec02",             -- terminal.ansiYellow
    blue = "#00a0e4",               -- terminal.ansiBlue
    magenta = "#a01994",            -- terminal.ansiMagenta
    pink = "#FF478D",
    cyan = "#00a0f4",               -- terminal.ansiCyan
    white = "#c8c8c8",              -- terminal.ansiWhite

    bright_black = "#5b5b5f",       -- terminal.ansiBrightBlack
    bright_red = "#fc0606",         -- terminal.ansiBrightRed
    bright_green = "#229966",       -- terminal.ansiBrightGreen
    bright_yellow = "#aa9933",      -- terminal.ansiBrightYellow
    bright_blue = "#2266cc",        -- terminal.ansiBrightBlue
    bright_magenta = "#e66dff",     -- terminal.ansiBrightMagenta
    bright_cyan = "#00accc",        -- terminal.ansiBrightCyan
    bright_white = "#fbfbfb",       -- terminal.ansiBrightWhite

    -- Special colors
    selectionBg = "#414143",        -- editor.selectionBackground (rrggbbaa -> hex, see above)
    selectionFg = "#c5c5cb",        -- editor.selectionForeground

    lineHighlightBg = "#eeeecc",    -- editor.lineHighlightBackground (rrggbbaa -> hex, see above)

    indentGuideActiveBg = "#44444d", -- editorIndentGuide.activeBackground1 (rrggbbaa -> hex, see above)
    indentGuideBg = "#0f0f11",       -- editorIndentGuide.Background1 (rrggbbaa -> hex, see above) #202024

    lineNumActiveFg = "#929293",    -- editorLineNumber.activeForeground
    lineNumFg = "#373737",          -- editorLineNumber.foreground

    whitespaceFg = "#2b2b30",       -- keyword.other.whitespace.liquid (rrggbbaa -> hex, see above)

    normalMode = "#444444",
    visualMode = blue,
    insertMode = green,

    statusbarBg = "#fafafa",        -- activityBar.background
    statusbarFg = "#333333",        -- activityBar.foreground
    gray00 = "#181818",   
    gray01 = statusbarBg,
    gray02 = "#666666",
    -- gray03 = "#323231", -- #323231
    gray04 = "#50505a",
    gray05 = "#888888",
    gray06 = "#999999", -- #767675
    -- gray07 = "#b6b6b5", -- #b6b6b5

    none = "NONE",
}

return M
