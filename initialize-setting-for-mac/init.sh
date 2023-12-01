# First, install homebrew
echo -e "\n. $(brew --prefix asdf)/libexec/asdf.sh" >> ${ZDOTDIR:-~}/.zshrc

# Second, install packages via homebrew
brew install asdf
brew install eza
brew install starship
brew install zsh-autosuggestions

# Third, install language via asdf
. /opt/homebrew/opt/asdf/libexec/asdf.sh

asdf plugin add nodejs https://github.com/asdf-vm/asdf-nodejs.git
NODE_VERSION=20.10.0
asdf install nodejs $NODE_VERSION
asdf global nodejs $NODE_VERSION

asdf plugin add python
PYTHON_VERSION=3.12.0
asdf install python $PYTHON_VERSION
asdf global python $PYTHON_VERSION
pip install --upgrade pip
pip install pipenv

# Fourth, install sshrc
# brew install wget
# wget https://raw.githubusercontent.com/cdown/sshrc/master/sshrc
# chmod +x sshrc
# mv sshrc /usr/local/bin/ # maybe, forced to use sudo(and password)
# cd && touch .sshrc
