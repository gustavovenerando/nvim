local tokyo_status, tokyonight = pcall(require, 'tokyonight')
if not tokyo_status then
	return
end

tokyonight.setup({
	style = 'storm',
    on_highlights = function(hl,c)
        hl.LineNr = { fg = c.dark5 }
        hl.CursorLineNr = { fg = c.cyan }
    end
})

vim.cmd [[ colorscheme tokyonight ]]
