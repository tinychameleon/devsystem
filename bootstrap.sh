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
    # Tools
    aspell
    azure-cli
    bash
    binutils
    coreutils
    curl
    direnv
    findutils
    fzf
    gawk
    gcc
    git
    git-lfs
    gnu-sed
    gnu-tar
    gnupg
    grep
    jq
    make
    mercurial
    pinentry-mac
    ripgrep
    stow
    tmux
    tree
    vim
    watch
    wordgrinder
    zsh

    # Casks
    homebrew/cask/docker
    homebrew/cask/emacs
    iterm2
    firefox
    google-chrome
    microsoft-edge
    microsoft-auto-update

    # Fonts
    font-fira-code-nerd-font
    font-ibm-plex
)

##
## Bootstrap Process
##

BREW=/usr/local/bin/brew
STOW=/usr/local/bin/stow
ZSH=/usr/local/bin/zsh
RUSTUP=$HOME/.local/rust/cargo/bin/rustup

if [[ ! -x "$BREW" ]]; then
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
fi

$BREW tap $TAPS
$BREW update
$BREW install $PACKAGES

# Special installation for rustup. Hopefully this makes its way into
# Homebrew w/o the Rust dependency at some point.
if [[ ! -x "$RUSTUP" ]]; then
    (
        export RUSTUP_HOME=$HOME/.local/rust/rustup
        export CARGO_HOME=$HOME/.local/rust/cargo
        curl --proto '=https' --tlsv1.2 https://sh.rustup.rs -sSf \
            | sh -s -- -y --profile=default --default-toolchain stable
    )
fi

if ! grep "$ZSH" /etc/shells >/dev/null; then
    echo "$ZSH" | sudo tee -a /etc/shells && sudo -k
    chsh -s "$ZSH" >/dev/null 2>&1
fi

$STOW --target $HOME --verbose 1 $STOW_PACKAGES

launchctl load -w $HOME/.local/opt/gnu.emacs.daemon.plist
