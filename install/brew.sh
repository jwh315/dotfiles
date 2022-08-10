# Install Homebrew

which -s brew
if [[ $? != 0 ]] ; then
    # Install Homebrew
    ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
else
    brew update
fi

# Install packages
brew_install() {
    echo "\nInstalling $1"
    if brew list $1 &>/dev/null; then
        echo "${1} is already installed"
    else
        brew install $1 && echo "$1 is installed"
    fi
}

brew_install 'iterm2'
brew_install 'curl'
brew_install 'grep'
brew_install 'awscli'
brew_install 'git-lfs'
brew_install 'redis'
brew_install 'ssh-copy-id'
brew_install 'wget'
brew_install 'telnet'
brew_install 'neovim'
brew_install 'php'
brew_install 'grep'
brew_install 'ripgrep'
brew_install 'jq'
brew_install 'docker'


which -s node 
if [[ $? != 0 ]] ; then
    brew install node@14
    brew unlink node
    brew link --overwrite node@14
fi


