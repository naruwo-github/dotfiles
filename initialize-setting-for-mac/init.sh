# First, install homebrew
echo -e "\n. $(brew --prefix asdf)/libexec/asdf.sh" >> ${ZDOTDIR:-~}/.zshrc

# Second, install packages via homebrew
brew install fzf
brew install asdf
brew install exa
brew install starship

# Third, install language via asdf
. /opt/homebrew/opt/asdf/libexec/asdf.sh

asdf plugin add nodejs https://github.com/asdf-vm/asdf-nodejs.git
NODE_VERSION=18.6.0
asdf install nodejs $NODE_VERSION
asdf global nodejs $NODE_VERSION

asdf plugin add python
PYTHON_VERSION=3.10.6
asdf install python $PYTHON_VERSION
asdf global python $PYTHON_VERSION
pip install --upgrade pip
pip install pipenv
