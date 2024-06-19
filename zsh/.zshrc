PATH="$HOME/.go/bin:$PATH"

if [[ -f "/opt/homebrew/bin/brew" ]] then
  # If you're using macOS, you'll want this enabled
  eval "$(/opt/homebrew/bin/brew shellenv)"
fi

export DOTFILES=$HOME/.dotfiles
export EDITOR=nvim
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
zinit snippet OMZP::ubuntu
zinit snippet OMZP::macos
zinit snippet OMZP::aws
zinit snippet OMZP::brew
zinit snippet OMZP::rails
zinit snippet OMZP::golang
zinit snippet OMZP::docker
zinit snippet OMZP::kubectl
zinit snippet OMZP::kubectx
zinit snippet OMZP::command-not-found

# Load completions
autoload -Uz compinit && compinit

zinit cdreplay -q

# Load oh my posh
if [ "$TERM_PROGRAM" != "Apple_Terminal" ]; then
  eval "$(oh-my-posh init zsh --config $HOME/.config/ohmyposh/zen.toml)"
fi

# Keybindings
bindkey -e
bindkey '^p' history-search-backward
bindkey '^n' history-search-forward
bindkey '^[w' kill-region

zle_highlight+=(paste:none)

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
alias v='nvim $(fd --type f --hidden --follow --exclude .git | fzf-tmux -p --reverse)'
alias g="git status"
alias ga="git add ."
alias gb="git branch -v"
alias gc="git commit -m "
alias gca="git commit -av"
alias gcl="git clone"
alias gco="git checkout -b"
alias gd="git diff"
alias gf="git fetch --all"
alias gl="git pull"
alias gma="git merge --abort"
alias gmc="git merge --continue"
alias gp="git push"
alias gpom="git pull origin main"
alias gpr="gh pr create"
alias gpum="git pull upstream master"
alias gr="git remote"
alias gra="git remote add"
alias grv="git remote -v"
alias gs="git status"
alias gst="git status"
alias l="lsd  --group-dirs first -A"
alias ll="lsd  --group-dirs first -Al"
alias lt="lsd  --group-dirs last -A --tree"
alias ld=lazydocker
alias lg=lazygit

# Shell integrations
eval "$(fzf --zsh)"
eval "$(zoxide init --cmd cd zsh)"
