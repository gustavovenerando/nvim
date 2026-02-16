vim.api.nvim_create_autocmd("LspAttach", {
	callback = function(args)
		local nmap = function(keys, func, desc)
			if desc then
				desc = "LSP: " .. desc
			end

			vim.keymap.set("n", keys, func, { buffer = 0, desc = desc })
		end

		vim.opt_local.omnifunc = "v:lua.vim.lsp.omnifunc"

        local telescope = require("telescope.builtin")

		nmap("<leader>ca", vim.lsp.buf.code_action, "[C]ode [A]ction")
		nmap("gd", telescope.lsp_definitions, "[G]oto [D]efinition")
		nmap("gr", telescope.lsp_references, "[G]oto [R]eferences")
		nmap("gI", vim.lsp.buf.implementation, "[G]oto [I]mplementation")
		nmap("gT", vim.lsp.buf.type_definition, "Type [D]efinition")
		nmap("gD", vim.lsp.buf.declaration, "[G]oto [D]eclaration")
		nmap("K", function ()
            vim.lsp.buf.hover({ border = "rounded" })
        end,
            "Hover Documentation"
        )
		nmap("<leader>ds", telescope.lsp_document_symbols, "[D]ocument [S]ymbols")
		nmap("<leader>ws", telescope.lsp_dynamic_workspace_symbols, "[W]orkspace [S]ymbols")
		-- nmap('<space>cr', vim.lsp.buf.rename, 'Rename')
	end,
})

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = vim.tbl_deep_extend('force', capabilities, require('cmp_nvim_lsp').default_capabilities())

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
}

require('mason').setup()
local ensure_installed = vim.tbl_keys(servers)
vim.list_extend(ensure_installed, {
    'stylua',
    'lua_ls',
    'bashls',
    'eslint',
    'clangd',
    'cssls',
})

require('mason-tool-installer').setup { ensure_installed = ensure_installed }

require('mason-lspconfig').setup {
    handlers = {
        function(server_name)
            local server = servers[server_name] or {}
            -- This handles overriding only values explicitly passed
            -- by the server configuration above. Useful when disabling
            -- certain features of an LSP (for example, turning off formatting for tsserver)
            server.capabilities = vim.tbl_deep_extend('force', {}, capabilities, server.capabilities or {})
            require('lspconfig')[server_name].setup(server)
        end,
    },
}

vim.lsp.handlers['textDocument/hover'] = vim.lsp.with(
    vim.lsp.handlers.hover,
    { border = 'rounded' }
)

vim.lsp.handlers['textDocument/signatureHelp'] = vim.lsp.with(
    vim.lsp.handlers.signature_help,
    { border = 'rounded' }
)

