# dotfiles

## Overview
This repository contains dotfiles for setting up and configuring a Mac environment.

## How to Create Symbolic Links
Basic syntax:
```bash
ln -s <Source file path> <Destination path>
```

## Directory Structure

### 🔧 initialize-setting/
Scripts for new Mac setup
- Usage: When you get a new Mac, run `initialize-setting/init.sh` first

### 📝 vim-setting/
Vim configuration files
- Setup example:
  ```bash
  ln -s ~/.../vim-setting/.vimrc ~/.vimrc
  ```

### 🐚 zsh-setting/
Zsh configuration files (loaded at login and startup)
- For the difference between `.zprofile` and `.zshrc`, see [here](https://gallard316.hatenablog.com/entry/2020/11/24/185634)
- Setup example:
  ```bash
  ln -s ~/.../zsh-setting/.zprofile ~/.zprofile
  ln -s ~/.../zsh-setting/.zshrc ~/.zshrc
  ln -s ~/.../zsh-setting/.alias_profile ~/.alias_profile
  ```

### ⭐️ starship.toml
Starship prompt configuration file
- [Starship Official Website](https://starship.rs/)
- Setup example:
  ```bash
  ln -s .starship.toml ~/.config/starship.toml
  ```
