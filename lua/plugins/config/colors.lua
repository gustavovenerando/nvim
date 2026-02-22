require("catppuccin").setup({
    flavour = "frappe",
    transparent_background = true,
    float = {
        transparent = true,
        solid = false,
    },
    integrations = {
        leap = true,
        mason = true,
        neotree = true,
        which_key = true,
        nvimtree = true,
        harpoon = true,
        dap = { enabled = true, enable_ui = true },
        alpha = true,
        telescope = true,
        -- indent_blankline = { enabled = true, colored_indent_levels = true },
    },
    highlight_overrides = {
        all = function(colors) -- Global highlight, will be replaced with custom_highlights if exists
            return {
                LineNr = { fg = colors.overlay1 },
                CursorLineNr = { fg = colors.lavander },
                CursorLine = { bg = colors.crust },

                TelescopeSelection = { bg = colors.none, style = { "bold" } },
                TelescopeSelectionCaret = { fg = colors.mauve, bg = colors.none },
            }
        end,
    }
})

vim.cmd.colorscheme "catppuccin"
