local M = {}

local config = {
	transparent = true, -- Set to true for your Kitty background
	italics = true,
	overrides = {},
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
	local utils = require("viel.utils")

	-- Apply generated theme
	for group, opts in pairs(theme) do
		utils.highlight(group, opts)
	end
end

return M
