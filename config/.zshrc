## Git alias ###
alias gi="git init"
alias ga="git add ."
alias gcm='git commit -m'
alias gp='git push'
alias dcu='docker compose up'
alias dcd='docker compose down'


# code

export PATH=$PATH:/mnt/c/Users/matth/AppData/Local/Programs/Microsoft\ VS\ Code/bin

# PATH GO
GOPATH=$HOME/go  PATH=$PATH:/usr/local/go/bin:$GOPATH/bin
export PATH=$PATH:/usr/local/go/bin

# PATH COMMIT_MESSAGE
PATH="$PATH:/home/aurora/bin"

# PATH BIn
PATH=$PATH:/home/aurora/.local/bin

# ASDF
. "$HOME/.asdf/asdf.sh"

fpath=(${ASDF_DIR}/completions $fpath) 
autoload -Uz compinit && compinit

# Set the directory we want to store zinit and plugins
ZINIT_HOME="${XDG_DATA_HOME:-${HOME}/.local/share}/zinit/zinit.git"

# Download Zinit, if it's not there yet
if [ ! -d "$ZINIT_HOME" ]; then
   mkdir -p "$(dirname $ZINIT_HOME)"
   git clone https://github.com/zdharma-continuum/zinit.git "$ZINIT_HOME"
fi

# Source/Load zinit
source "${ZINIT_HOME}/zinit.zsh"

# Add in zsh plugins
zinit light zsh-users/zsh-syntax-highlighting
zinit light zsh-users/zsh-completions
zinit light zsh-users/zsh-autosuggestions
zinit light Aloxaf/fzf-tab

# Add in snippets
zinit snippet OMZP::git
zinit snippet OMZP::sudo
zinit snippet OMZP::archlinux
zinit snippet OMZP::aws
zinit snippet OMZP::kubectl
zinit snippet OMZP::kubectx
zinit snippet OMZP::command-not-found

# Load completions
autoload -Uz compinit && compinit

zinit cdreplay -q

eval "$(oh-my-posh init zsh --config $HOME/.config/ohmyposh/zen.toml)"

# Keybindings
bindkey -e
bindkey '^p' history-search-backward
bindkey '^n' history-search-forward
bindkey '^[w' kill-region

# History
HISTSIZE=5000
HISTFILE=~/.zsh_history
SAVEHIST=$HISTSIZE
HISTDUP=erase
setopt appendhistory
setopt sharehistory
setopt hist_ignore_space
setopt hist_ignore_all_dups
setopt hist_save_no_dups
setopt hist_ignore_dups
setopt hist_find_no_dups

# Completion styling
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"
zstyle ':completion:*' menu no
zstyle ':fzf-tab:complete:cd:*' fzf-preview 'ls --color $realpath'
zstyle ':fzf-tab:complete:__zoxide_z:*' fzf-preview 'ls --color $realpath'

# Aliases
alias ls='ls --color'
alias vim='nvim'
alias c='clear'

# Shell integrations
eval "$(fzf --zsh)"
eval "$(zoxide init --cmd cd zsh)"

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# bun completions
[ -s "/home/aurora/.bun/_bun" ] && source "/home/aurora/.bun/_bun"

# bun
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"
