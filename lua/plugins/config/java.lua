local java17 = vim.fn.expand("~/.sdkman/candidates/java/17.0.18-tem")
local java21 = vim.fn.expand("~/.sdkman/candidates/java/21.0.10-tem")

local function noop() end

vim.lsp.config("jdtls", {
    cmd_env = {
        JAVA_HOME = java21,
        PATH = java21 .. "/bin:" .. vim.env.PATH,
    },
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
                    { name = "JavaSE-17", path = java17, default = true, },
                    { name = "JavaSE-21", path = java21, },
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
