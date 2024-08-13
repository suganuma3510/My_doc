# Homebrew
# https://brew.sh/
# /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
# brew search xxx

brew install --cask google-chrome
brew install --cask arc
brew install --cask visual-studio-code
brew install --cask slack
brew install --cask zoom
brew install --cask docker
brew install --cask alfred
brew install --cask postman

# AWS CLI
brew install awscli
brew install --cask session-manager-plugin
# aws --version

# Terraform
brew install tfenv
# tfenv --version
# tfenv list-remote
# tfenv install 1.9.0
# tfenv use 1.9.0
# tfenv list

# curl http/3
# brew tap cloudflare/homebrew-cloudflare
# brew install cloudflare/cloudflare/curl
# echo 'export PATH="/opt/homebrew/opt/curl/bin:$PATH"' >> ~/.zshrc
# source ~/.zshrc


git config user.name "suganuma3510"
git config user.email "suganuma3510@gmail.com"