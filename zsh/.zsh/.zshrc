# Aliases
alias e=$EDITOR
alias ls='ls --color -AFh'

# Prompt
PROMPT='%F{5}%(4~.%-1~/…/%2~.%~)%f› '
RPROMPT='%(?..%(146?..❗️%F{1}%?%f))%(1j. 🔧 %F{3}%j%f.)'

# Tool hooks
eval "$(direnv hook zsh)"
eval "$(rbenv init -)"

export NVM_DIR="$HOME/.nvm"
[ -s "/usr/local/opt/nvm/nvm.sh" ] && . "/usr/local/opt/nvm/nvm.sh"
[ -s "/usr/local/opt/nvm/etc/bash_completion.d/nvm" ] && . "/usr/local/opt/nvm/etc/bash_completion.d/nvm"

# Configuration Variables
HISTFILE=~/.zsh/histfile
HISTSIZE=10000
SAVEHIST=10000

# Configuration Options
setopt autocd
unsetopt beep

setopt share_history

# Configuration Commands
zstyle :compinstall filename '/Users/srt/.zshrc'

autoload -Uz compinit; compinit
