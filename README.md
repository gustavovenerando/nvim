# 🪐 Neovim
## ⚙️ Installation Requirements
- [**Neovim**](https://github.com/neovim/neovim/blob/master/BUILD.md) `>= 0.11.2`
- One of the [**Nerd Fonts**](https://github.com/ryanoasis/nerd-fonts) (required for icons)
- Blazingly fast TypeScript integration with [**typescript-tools.nvim**](https://github.com/pmizio/typescript-tools.nvim):
  ```bash
  sudo npm i -g typescript typescript-language-server
  ```
- Sdkman for Java setup:
  ```bash
  curl -s "https://get.sdkman.io" | bash
  source "$HOME/.sdkman/bin/sdkman-init.sh"

  sdk list java
  sdk install java <some_java_version>
  sdk default java <some_java_version>
  ```
- Prerequisites:
  ```bash
  sudo apt-get install ninja-build gettext cmake unzip curl ripgrep xclip
  ```

## ☕ Java Setup
This setup keeps your **system/terminal Java on 17**, while forcing **JDTLS to run on Java 21** (required by nvim-java / jdtls).  
JDTLS will treat **Java 17 as the default project runtime** for compilation/debug.

### SDKMAN (terminal default)
```bash
sdk default java 17.0.18-tem
```

### Configuration
```lua
// lua/plugins/config/java.lua
local java17 = vim.fn.expand("~/.sdkman/candidates/java/17.0.18-tem")
local java21 = vim.fn.expand("~/.sdkman/candidates/java/21.0.10-tem")

vim.lsp.config("jdtls", {
    ...,
    cmd_env = {
        JAVA_HOME = java21,
        PATH = java21 .. "/bin:" .. vim.env.PATH,
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
```

## 🔄 When Lazy Plugins Need a Restart
If Lazy plugins require a clean restart, you can clear all Neovim caches with:

```bash
rm -rf ~/.local/state/nvim/ ~/.local/share/nvim/ ~/.cache/nvim/ ~/.config/nvim/lazy-lock.json
```

> [!WARNING]
>Deleting `lazy-lock.json` removes version pinning.
>After this, plugins will update to the latest versions on the next install/sync.

## Local environmental variables (Optional)
📍**Path:**
`~/.config/nvim/lua/local.lua`

Example for **42 projects header**:

```lua
vim.g.user = "user"
vim.g.mail = "user_mail@mail.com"
```
