# 🪐 Neovim
## ⚙️ Installation Requirements
- [**Neovim**](https://github.com/neovim/neovim/blob/master/BUILD.md) `>= 0.11.2`
- One of the [**Nerd Fonts**](https://github.com/ryanoasis/nerd-fonts) (required for icons)
- Blazingly fast TypeScript integration with [**typescript-tools.nvim**](https://github.com/pmizio/typescript-tools.nvim):
  ```bash
  sudo npm i -g typescript typescript-language-server
  ```
- Prerequisites:
  ```bash
  sudo apt-get install ninja-build gettext cmake unzip curl ripgrep xclip
  ```

## 🔄 When Lazy Plugins Need a Restart
If Lazy plugins require a clean restart, you can clear all Neovim caches with:

```bash
rm -rf ~/.local/state/nvim/ ~/.local/share/nvim/ ~/.cache/nvim/ ~/.config/nvim/lazy-lock.json
```

## Local environmental variables (Optional)
📍**Path:**
`~/.config/nvim/lua/local.lua`

Example for **42 projects header**:

```lua
vim.g.user = "user"
vim.g.mail = "user_mail@mail.com"
```
