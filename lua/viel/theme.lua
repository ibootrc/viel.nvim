local M = {}

M.palette = {
	-- The 5 Core Truths from the Image
	midnight = "#10162B", -- Deep Midnight
	sapphire = "#203B72", -- Sapphire Blue
	haze = "#4C77A9", -- Cerulean Haze
	cloud = "#A1BDD4", -- Cloud Veil
	mist = "#EBF1F7", -- Luminous Mist

	-- Derived Semantic Layers (Strictly Monochromatic)
	surface = "#1B243B", -- Subtle background shifts
	overlay = "#324266", -- Guides/Inlay Hints
	muted = "#7D97AD", -- Comments
}
-- comment
function M.setup()
	if vim.g.colors_name then
		vim.cmd("hi clear")
	end
	vim.g.colors_name = "viel"
	vim.opt.termguicolors = true

	local p = M.palette
	local h = function(group, opts)
		vim.api.nvim_set_hl(0, group, opts)
	end

	-- 1. EDITOR UI (TRANSPARENT CORE)
	-- 'bg = "NONE"' ensures it inherits your Kitty transparency
	h("Normal", { fg = p.cloud, bg = "NONE" })
	h("NormalFloat", { fg = p.cloud, bg = "NONE" })
	h("FloatBorder", { fg = p.haze, bg = "NONE" })
	h("EndOfBuffer", { fg = p.midnight, bg = "NONE" })

	-- UI Elements
	h("CursorLine", { bg = p.surface })
	h("Visual", { bg = p.sapphire, fg = p.mist })
	h("LineNr", { fg = p.overlay, bg = "NONE" })
	h("CursorLineNr", { fg = p.mist, bg = "NONE", bold = true })
	h("Search", { fg = p.midnight, bg = p.mist })
	h("VertSplit", { fg = p.sapphire, bg = "NONE" })
	h("WinSeparator", { fg = p.sapphire, bg = "NONE" })
	h("Pmenu", { fg = p.cloud, bg = p.midnight }) -- Slight solid for menus
	h("PmenuSel", { fg = p.mist, bg = p.sapphire, bold = true })

	-- 2. SYNTAX (Monochromatic Hierarchy)
	h("@function", { fg = p.mist, bold = true }) -- Logic is Brightest
	h("@keyword", { fg = p.haze, italic = true }) -- Structure is Mid-Tone
	h("@variable", { fg = p.cloud }) -- Data is Standard
	h("@string", { fg = p.haze }) -- Strings are Misty
	h("@comment", { fg = p.muted, italic = true })
	h("@type", { fg = p.cloud, bold = true })
	h("@constant", { fg = p.mist })
	h("@operator", { fg = p.haze })
	h("@parameter", { fg = p.cloud, italic = true })

	-- 3. LSP & DIAGNOSTICS
	h("DiagnosticError", { fg = p.haze })
	h("DiagnosticWarn", { fg = p.muted })
	h("DiagnosticInfo", { fg = p.overlay })
	h("DiagnosticHint", { fg = p.cloud })

	-- 4. PLUGIN INTEGRATIONS
	-- Flash.nvim
	h("FlashLabel", { bg = p.mist, fg = p.midnight, bold = true })
	h("FlashMatch", { bg = p.sapphire, fg = p.mist })
	-- Noice.nvim
	h("NoiceCmdlinePopupBorder", { fg = p.haze })
	h("NoiceCmdlineIcon", { fg = p.mist })
	-- Twilight.nvim
	h("Twilight", { fg = p.sapphire })
end

-- Auto-apply when sourced
M.setup()

return M
