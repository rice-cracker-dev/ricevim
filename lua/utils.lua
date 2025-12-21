local M = {}

function M.get_file_name_no_ext(path)
	return vim.fn.fnamemodify(path, ":t:r")
end

return M
