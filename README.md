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
  sdk install <some_java_version>
  sdk default <some_java_version>
  ```
- Prerequisites:
  ```bash
  sudo apt-get install ninja-build gettext cmake unzip curl ripgrep xclip
  ```

## ☕ Java Setup
Set the runtimes in nvim-java config file:

```lua
vim.lsp.config("jdtls", {
  settings = {
    java = {
      configuration = {
        runtimes = {
          {
            name = "JavaSE-11",
            path = vim.fn.expand("~/.sdkman/candidates/java/<your-11-folder>"),
            default = true,
          },
          {
            name = "JavaSE-21",
            path = vim.fn.expand("~/.sdkman/candidates/java/<your-21-folder>"),
          },
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
