---@module 'lazy'
---@module 'conform'

local utils = require("utils")
local config_files = vim.api.nvim_get_runtime_file("lua/formatters/*.lua", true)

local formatters = {}
for _, path in pairs(config_files) do
	local name = utils.get_file_name_no_ext(path)
	local config = dofile(path)

	formatters[name] = config
end

---@type LazySpec
return {
	"stevearc/conform.nvim",

	---@type conform.setupOpts
	opts = {
		formatters = formatters,

		default_format_opts = {
			lsp_format = "fallback",
		},

		format_on_save = { timeout_ms = 500 },

		formatters_by_ft = {
			lua = { "stylua" },
		},
	},

	keys = {
		{
			"<leader>lf",
			function()
				require("conform").format()
			end,
			desc = "Format [Conform]",
		},
	},
}
