# Homebrew
# https://brew.sh/
# /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
# brew search xxx
# brew update
# brew upgrade

brew install --cask google-chrome
brew install --cask arc
# brew install --cask firefox
brew install --cask visual-studio-code
brew install --cask slack
brew install --cask zoom
brew install --cask docker
brew install --cask alfred
brew install --cask postman
brew install --cask drawio
brew install --cask ghostty
brew install --cask claude-code

# AWS CLI
brew install awscli
brew install --cask session-manager-plugin
# aws --version

# awsume
# https://awsu.me/general/quickstart.html
brew install pipx
pipx install awsume
pipx inject awsume awsume-console-plugin

# Terraform
brew install tfenv
# tfenv --version
# tfenv list-remote
# tfenv install 1.9.0
# tfenv use 1.9.0
# tfenv list

# GitHub CLI
brew install gh
# gh auth login

# Custom Aliases
cat << 'APPENDEOF' >> ~/.zshrc

# General
alias ll='ls -lha'
alias c='clear'
alias h='history'
alias p='pushd'
alias cp='cp -i'
alias mv='mv -i'
alias ..='cd ..'
alias ...='cd ../..'

# Terraform
alias tf='terraform'
alias tfi='terraform init'
alias tfa='terraform apply'
alias tfaa='terraform apply -auto-approve'
alias tfp='terraform plan'
alias tfd='terraform destroy'
alias tff='terraform fmt -recursive'

APPENDEOF
source ~/.zshrc

# 隠しファイルを表示
defaults write com.apple.finder AppleShowAllFiles -bool true
killall Finder