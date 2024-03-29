require("catppuccin").setup({
    flavour = "frappe",
    transparent_background = true,
    integrations = {
        leap = true,
        mason = true,
        neotree = true,
        which_key = true,
        nvimtree = true,
        harpoon = true,
        dap = { enabled = true, enable_ui = true },
        alpha = true,
        -- indent_blankline = { enabled = true, colored_indent_levels = true },
    },
    highlight_overrides = {
        all = function(colors) -- Global highlight, will be replaced with custom_highlights if exists
            return {
                LineNr = { fg = colors.overlay1 },
                CursorLineNr = { fg = colors.lavander },
                CursorLine = { bg = colors.crust },
            }
        end, -- Same for each flavour
    }
})

vim.cmd.colorscheme "catppuccin"
