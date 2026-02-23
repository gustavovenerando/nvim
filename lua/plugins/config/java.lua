local function noop() end

vim.lsp.config("jdtls", {
    handlers = {
        ["$/progress"] = noop,
        ["language/progressReport"] = noop,
        ["language/status"] = noop,
        ["window/showMessage"] = noop,
        ["window/logMessage"] = noop,
    },
    settings = {
        java = {
            configuration = {
                runtimes = {
                    {
                        name = "JavaSE-17",
                        path = vim.fn.expand("~/.sdkman/candidates/java/17.0.18-tem"),
                        default = true,
                    },
                    {
                        name = "JavaSE-21",
                        path = vim.fn.expand("~/.sdkman/candidates/java/21.0.10-tem"),
                    },
                },
            },
        },
    },
})

require('java').setup({
    jdk = {
        auto_install = false,
        version = '21'
    }
})

vim.lsp.enable("jdtls")
