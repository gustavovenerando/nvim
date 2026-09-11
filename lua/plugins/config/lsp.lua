local lsp_group = vim.api.nvim_create_augroup("user_lsp_attach", {
    clear = true,
})

vim.api.nvim_create_autocmd("LspAttach", {
    group = lsp_group,

    callback = function(args)
        local function nmap(keys, func, desc)
            vim.keymap.set("n", keys, func, {
                buf = args.buf,
                desc = "LSP: " .. desc,
            })
        end

        nmap("<leader>ca", vim.lsp.buf.code_action, "[C]ode [A]ction")

        nmap("gd", function()
            require("telescope.builtin").lsp_definitions()
        end, "[G]oto [D]efinition")

        nmap("gr", function()
            require("telescope.builtin").lsp_references()
        end, "[G]oto [R]eferences")

        nmap("gI", vim.lsp.buf.implementation, "[G]oto [I]mplementation")
        nmap("gT", vim.lsp.buf.type_definition, "[G]oto [T]ype Definition")
        nmap("gD", vim.lsp.buf.declaration, "[G]oto [D]eclaration")
        nmap("K", vim.lsp.buf.hover, "Hover Documentation")

        nmap("<leader>ds", function()
            require("telescope.builtin").lsp_document_symbols()
        end, "[D]ocument [S]ymbols")

        nmap("<leader>ws", function()
            require("telescope.builtin").lsp_dynamic_workspace_symbols()
        end, "[W]orkspace [S]ymbols")
    end,
})

local capabilities = require("cmp_nvim_lsp").default_capabilities()

local servers = {
    jsonls = {
        settings = {
            json = {
                schemas = require("schemastore").json.schemas(),
                validate = { enable = true },
            },
        },
    },

    yamlls = {
        settings = {
            yaml = {
                schemaStore = {
                    enable = false,
                    url = "",
                },
                schemas = require("schemastore").yaml.schemas(),
            },
        },
    },

    lua_ls = {},
    bashls = {},
    eslint = {},
    clangd = {},
    cssls = {},
}

for name, config in pairs(servers) do
    config.capabilities = vim.tbl_deep_extend(
        "force",
        {},
        capabilities,
        config.capabilities or {}
    )

    vim.lsp.config(name, config)
end

require("mason").setup()

require("mason-lspconfig").setup({
    ensure_installed = vim.tbl_keys(servers),

    -- Only automatically enable the LSPs that this file owns.
    automatic_enable = vim.tbl_keys(servers),
})

require("mason-tool-installer").setup({
    ensure_installed = {
        "stylua",
    },
})
