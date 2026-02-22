require('java').setup({
    jdk = {
        auto_install = false,
        version = '21'
    }
})

vim.lsp.enable("jdtls")

vim.lsp.config("jdtls", {
    settings = {
        java = {
            configuration = {
                runtimes = {
                    {
                        name = "JavaSE-11",
                        path = vim.fn.expand("~/.sdkman/candidates/java/11.0.30-tem"),
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
