export ZDOTDIR=$HOME/.zsh

if [[ ! -o login ]]; then
    source "$ZDOTDIR/.zprofile"
fi
