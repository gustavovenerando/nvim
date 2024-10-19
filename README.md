# neovim
Installation requirements:
- [Neovim](https://github.com/neovim/neovim/blob/master/BUILD.md) >= 0.10
- One of [Nerd Fonts](https://github.com/ryanoasis/nerd-fonts) - Needed to work with icons
- Blazingly fast TypeScript integration with [typescript-tools.nvim](https://github.com/pmizio/typescript-tools.nvim) - sudo npm i -g typescript typescript-language-server
- sudo apt-get install ninja-build gettext cmake unzip curl ripgrep xclip

When restarting lazy plugins is needed: 
- rm -rf ~/.local/state/nvim/ ~/.local/share/nvim/ ~/.cache/nvim/ ~/.config/nvim/lazy-lock.json
