local M = {}

local config = {
	transparent = true,
	italics = true,
}

function M.setup(opts)
	config = vim.tbl_deep_extend("force", config, opts or {})
end

function M.load()
	if vim.g.colors_name then
		vim.cmd("hi clear")
	end

	vim.opt.termguicolors = true
	vim.g.colors_name = "viel"

	local theme = require("viel.theme").get(config)

	-- Applying highlights directly without an external utils file
	for group, opts in pairs(theme) do
		vim.api.nvim_set_hl(0, group, opts)
	end
end

return M
