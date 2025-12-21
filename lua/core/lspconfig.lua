local utils = require("utils")
local capabilities = require("blink.cmp").get_lsp_capabilities()

local register_lsp_binding = function(bufnr, key, action, desc)
	vim.keymap.set("n", key, action, { buffer = bufnr, noremap = true, silent = true, desc = desc })
end

local default_on_attach = function(_, bufnr)
	register_lsp_binding(bufnr, "<leader>lgd", vim.lsp.buf.definition, "Go to definition")
	register_lsp_binding(bufnr, "<leader>lgD", vim.lsp.buf.declaration, "Go to declaration")
	register_lsp_binding(bufnr, "<leader>lgt", vim.lsp.buf.type_definition, "Go to type definition")
	register_lsp_binding(bufnr, "<leader>lgi", vim.lsp.buf.implementation, "List implementations")
	register_lsp_binding(bufnr, "<leader>lgr", vim.lsp.buf.references, "List implementations")
	register_lsp_binding(bufnr, "<leader>lgn", function()
		vim.diagnostic.jump({ count = 1, float = true })
	end, "Go to next diagnostic")
	register_lsp_binding(bufnr, "<leader>lgp", function()
		vim.diagnostic.jump({ count = -1, float = true })
	end, "Go to previous diagnostic")

	register_lsp_binding(bufnr, "<leader>le", vim.diagnostic.open_float, "Open diagnostic float")
	register_lsp_binding(bufnr, "<leader>lH", vim.lsp.buf.document_highlight, "Document highlight")
	register_lsp_binding(bufnr, "<leader>lS", vim.lsp.buf.document_symbol, "Document symbols")
	register_lsp_binding(bufnr, "<leader>lh", vim.lsp.buf.hover, "Hover")
	register_lsp_binding(bufnr, "<leader>ls", vim.lsp.buf.signature_help, "Signature help")
	register_lsp_binding(bufnr, "<leader>lr", vim.lsp.buf.rename, "Rename symbol")
	register_lsp_binding(bufnr, "<leader>la", vim.lsp.buf.code_action, "Code action")
end

local config_files = vim.api.nvim_get_runtime_file("lua/servers/*.lua", true)
local servers = {}

for _, path in ipairs(config_files) do
	local name = utils.get_file_name_no_ext(path)
	local config = dofile(path)

	local on_attach = vim.lsp.config[name] ~= nil and vim.lsp.config[name].on_attach
	local config_on_attach = config.on_attach

	config.capabilities = capabilities
	config.on_attach = function(client, bufnr)
		default_on_attach(client, bufnr)

		if on_attach then
			on_attach(client, bufnr)
		end

		if config_on_attach then
			config_on_attach(client, bufnr)
		end
	end

	vim.lsp.config[name] = config
	table.insert(servers, name)
end

vim.lsp.enable(servers)
