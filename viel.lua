local M = {}

M.palette = {
	-- Core Layers (Tonal variations of #10162B)
	base = "#10162B", -- Deep Midnight
	mantle = "#0E1324", -- Darker (Statusline/Sidebar)
	crust = "#090D1A", -- Darkest (Floating shadow)

	-- UI Surfaces (Tonal variations of #203B72)
	surface0 = "#1B243B", -- Inactive panes
	surface1 = "#203B72", -- Sapphire Blue (Selection/Visual)
	surface2 = "#2D4B8A", -- Active line highlights

	-- Text & Muted Layers (From #A1BDD4 & #EBF1F7)
	text = "#EBF1F7", -- Luminous Mist (Main Text)
	subtext1 = "#A1BDD4", -- Cloud Veil (Secondary Text)
	subtext0 = "#7D97AD", -- Muted (Comments/Hints)
	overlay1 = "#4C77A9", -- Cerulean Haze (Borders/Guides)
	overlay0 = "#36567A", -- Dimmed Guides

	-- Accents (Monochromatic "Pops")
	sapphire = "#5C8FC4", -- Functions
	sky = "#78A3C9", -- Keywords
	teal = "#A1CBD4", -- Strings
	lavender = "#BDA1D4", -- Special/Types
}

function M.setup()
	if vim.g.colors_name then
		vim.cmd("hi clear")
	end
	vim.g.colors_name = "sapphire_veil"
	vim.opt.termguicolors = true

	local p = M.palette
	local h = function(group, opts)
		vim.api.nvim_set_hl(0, group, opts)
	end

	-- 1. TERMINAL COLORS (ANSI)
	local terms = { p.base, p.overlay1, p.teal, p.sky, p.sapphire, p.lavender, p.overlay1, p.text }
	for i, col in ipairs(terms) do
		vim.g["terminal_color_" .. (i - 1)] = col
		vim.g["terminal_color_" .. (i + 7)] = col
	end

	-- 2. EDITOR UI (CORE)
	h("Normal", { fg = p.text, bg = p.base })
	h("NormalFloat", { fg = p.text, bg = p.mantle })
	h("FloatBorder", { fg = p.overlay1, bg = p.mantle })
	h("CursorLine", { bg = p.surface0 })
	h("Visual", { bg = p.surface1 })
	h("LineNr", { fg = p.overlay0 })
	h("CursorLineNr", { fg = p.sky, bold = true })
	h("Search", { fg = p.base, bg = p.sky })
	h("IncSearch", { fg = p.base, bg = p.text })
	h("StatusLine", { fg = p.text, bg = p.mantle })
	h("VertSplit", { fg = p.surface1 })
	h("WinSeparator", { fg = p.surface1 })
	h("Folded", { fg = p.subtext0, bg = p.surface0 })
	h("EndOfBuffer", { fg = p.base })

	-- 3. SYNTAX & TREESITTER
	h("@function", { fg = p.sapphire, bold = true })
	h("@keyword", { fg = p.sky, italic = true })
	h("@string", { fg = p.teal })
	h("@variable", { fg = p.text })
	h("@comment", { fg = p.subtext0, italic = true })
	h("@type", { fg = p.lavender })
	h("@constant", { fg = p.teal, bold = true })
	h("@operator", { fg = p.overlay1 })
	h("@parameter", { fg = p.subtext1, italic = true })

	-- 4. LSP & DIAGNOSTICS (Monochromatic States)
	h("DiagnosticError", { fg = p.overlay1 })
	h("DiagnosticWarn", { fg = p.subtext1 })
	h("DiagnosticInfo", { fg = p.subtext0 })
	h("DiagnosticHint", { fg = p.overlay0 })
	h("LspReferenceText", { bg = p.surface0 })
	h("LspReferenceRead", { bg = p.surface0 })
	h("LspReferenceWrite", { bg = p.surface0 })

	-- 5. DIFF & GIT
	h("DiffAdd", { bg = p.surface0, fg = p.teal })
	h("DiffChange", { bg = p.surface0, fg = p.sky })
	h("DiffDelete", { bg = p.surface0, fg = p.overlay1 })
	h("DiffText", { bg = p.surface1, fg = p.text })

	-- 6. PLUGIN SUPPORT (Noice, Flash, Twilight)
	h("NoiceCmdlinePopupBorder", { fg = p.sapphire })
	h("NoiceCmdlineIcon", { fg = p.sky })
	h("FlashLabel", { bg = p.text, fg = p.base, bold = true })
	h("FlashMatch", { bg = p.surface1, fg = p.text })
	h("Twilight", { fg = p.surface1 })
end

return M
