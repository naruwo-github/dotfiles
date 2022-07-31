# First, install homebrew
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

# Second, install packages via homebrew
brew install fzf
brew install asdf
brew install exa
brew install starship

# Third, install language via asdf
. /usr/local/opt/asdf/libexec/asdf.sh

asdf plugin add nodejs https://github.com/asdf-vm/asdf-nodejs.git
NODE_VERSION=18.6.0
asdf install nodejs $NODE_VERSION
asdf global nodejs $NODE_VERSION
