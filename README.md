# dotfiles

* Attention!!
  * Create symbolic links: `ln -s <Symbolic link source path> <Path to where to create the symbolic link>`

* `zsh-setting/`: These are zsh settings installed when login to or open zsh.
  * about difference between `.zprofile` and `.zshrc`: https://gallard316.hatenablog.com/entry/2020/11/24/185634
  * symbolic link example
    * `ln -s ./zsh-setting/.zprofile ~/.zprofile`
    * `ln -s ./zsh-setting/.zshrc ~/.zshrc`

* `starship.toml`: This is one of zsh settings.
  * Starship official: https://starship.rs/
  * symbolic link example
    * `ln -s .starship.toml ~/.config/starship.toml`