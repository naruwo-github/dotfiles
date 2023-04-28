# dotfiles

* Attention!!
  * Create symbolic links: `ln -s <Symbolic link source path> <Path to where to create the symbolic link>`

* `initialize-setting/`: This is for the time when you change your mac. When you open your new mac, you should execute `initialize-setting/init.sh` first!

* `vim-setting/`: This is for the setting improving vim life!
  * symbolic link example
    * `ln -s ~/.../vim-setting/.vimrc ~/.vimrc`

* `zsh-setting/`: These are zsh settings installed when login to or open zsh.
  * about difference between `.zprofile` and `.zshrc`: https://gallard316.hatenablog.com/entry/2020/11/24/185634
  * symbolic link example
    * `ln -s ~/.../zsh-setting/.zprofile ~/.zprofile`
    * `ln -s ~/.../zsh-setting/.zshrc ~/.zshrc`
    * `ln -s ~/.../zsh-setting/.alias_profile ~/.alias_profile`
  * Install plugins
```zsh
`git clone https://github.com/zsh-users/zsh-autosuggestions.git $ZSH_CUSTOM/plugins/zsh-autosuggestions`
`git clone https://github.com/zsh-users/zsh-syntax-highlighting.git $ZSH_CUSTOM/plugins/zsh-syntax-highlighting`
```

* `starship.toml`: This is one of zsh settings.
  * Starship official: https://starship.rs/
  * symbolic link example
    * `ln -s .starship.toml ~/.config/starship.toml`
