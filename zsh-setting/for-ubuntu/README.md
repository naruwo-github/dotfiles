# How to use

## Change bash to zsh

- `sudo apt install zsh`
- `chsh -s $(which zsh)`

## Install oh-my-zsh

- `sudo apt install curl wget git`
- `sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"`
- `cd && ln -s path/to/.zshrc_ubuntu ~/.zshrc`

### Set plugins

ref: https://guinuxbr.com/en/posts/zsh+oh-my-zsh+starship/#loading-some-plugins

- `git clone https://github.com/zsh-users/zsh-autosuggestions.git $ZSH_CUSTOM/plugins/zsh-autosuggestions`
- `git clone https://github.com/zsh-users/zsh-syntax-highlighting.git $ZSH_CUSTOM/plugins/zsh-syntax-highlighting`

## Install starship

ref: https://guinuxbr.com/en/posts/zsh+oh-my-zsh+starship/#loading-some-plugins
