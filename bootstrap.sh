#!/bin/bash
set -euo pipefail

##
## Configuration
##

STOW_PACKAGES=(
    aspell
    git
    gnu
    local
    tmux
    zsh
)

TAPS=(
    homebrew/cask-fonts
)

PACKAGES=(
    aspell
    azure-cli
    bash
    binutils
    coreutils
    curl
    direnv
    docker
    findutils
    firefox
    font-ibm-plex
    gawk
    gcc
    git
    gnu-sed
    gnu-tar
    gnupg
    google-chrome
    grep
    iterm2
    jq
    make
    mercurial
    microsoft-edge
    nvim
    pinentry-mac
    ripgrep
    stow
    tree
    vim
    watch
    zsh
)

##
## Bootstrap Process
##

BREW=/usr/local/bin/brew
STOW=/usr/local/bin/stow
ZSH=/usr/local/bin/zsh

if [[ ! -x "$BREW" ]]; then
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
fi

$BREW tap $TAPS
$BREW update
$BREW install $PACKAGES

# Special installation for rustup. Hopefully this makes its way into
# Homebrew w/o the Rust dependency at some point.
(
    export RUSTUP_HOME=$HOME/.local/rust/rustup
    export CARGO_HOME=$HOME/.local/rust/cargo
    curl --proto '=https' --tlsv1.2 https://sh.rustup.rs -sSf \
	| sh -s -- -y --profile=default --default-toolchain stable
)

if ! grep "$ZSH" /etc/shells >/dev/null; then
    echo "$ZSH" | sudo tee -a /etc/shells && sudo -k
    chsh -s "$ZSH" >/dev/null 2>&1
fi

$STOW --target $HOME --verbose 1 $STOW_PACKAGES
