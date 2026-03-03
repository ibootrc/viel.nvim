local M = {}

M.config = {
	transparent = true, -- Default to true for your Kitty setup
	bold = true,
}

function M.setup(opts)
	M.config = vim.tbl_deep_extend("force", M.config, opts or {})
end

function M.load()
	-- This links to your theme.lua logic
	require("viel.theme").setup(M.config)
end

return M
