# Nix
if [ -e '/nix/var/nix/profiles/default/etc/profile.d/nix-daemon.sh' ]; then
  . '/nix/var/nix/profiles/default/etc/profile.d/nix-daemon.sh'
fi

export SECOND_BRAIN="/Users/felix/Library/Mobile Documents/iCloud~md~obsidian/Documents/Second Brain"

alias reload-zsh="source ~/.zshrc"
alias edit-zsh="nvim ~/.zshrc"

# Git
alias gc="git commit -m"
alias gca="git commit -a -m"
# alias gps="git push origin HEAD"
alias gp="git pull origin"
alias gs="git status"
alias glog="git log --graph --topo-order --pretty='%w(100,0,6)%C(yellow)%h%C(bold)%C(black)%d %C(cyan)%ar %C(green)%an%n%C(bold)%C(white)%s %N' --abbrev-commit"
alias gdiff="git diff"
alias gco="git checkout"
alias gb='git branch'
alias gba='git branch -a'
alias ga='git add'
alias gr='git remote'
alias gre='git reset'

# Docker
alias dc="docker compose"
alias dps="docker ps"
alias dpa="docker ps -a"
alias dl="docker ps -l -q"
alias dx="docker exec -it"

# Dirs
alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."
alias .....="cd ../../../.."
alias ......="cd ../../../../.."

alias v="nvim"
alias c="clear"
alias vim="nvim"
alias lg="lazygit"

# vim & second brain
alias sb="cd \$SECOND_BRAIN"
alias in="cd \$SECOND_BRAIN/0 Inbox/"
alias zk="cd \$SECOND_BRAIN"

# Eza
alias l="eza -l --icons --git -a"
alias lt="eza --tree --level=2 --long --icons --git"

# fzf aliases
# use fp to do a fzf search and preview the files
alias fp="fzf --preview 'bat --style=numbers --color=always --line-range :500 {}'"
# search for a file with fzf and open it in vim
alias vf='v $(fp)'

alias ta="tmux a"
alias tk="tmux kill-server"
alias tn="tmux new -s"

function sesh-sessions() {
  {
    exec </dev/tty
    exec <&1
    local session
    session=$(sesh list -t -c | fzf --height 40% --reverse --border-label ' sesh ' --border --prompt '⚡  ')
    [[ -z "$session" ]] && return
    sesh connect $session
  }
}

zle     -N             sesh-sessions
bindkey -M emacs '\es' sesh-sessions
bindkey -M vicmd '\es' sesh-sessions
bindkey -M viins '\es' sesh-sessions

# history setup
HISTFILE=$HOME/.zhistory
SAVEHIST=1000
HISTSIZE=999
setopt share_history 
setopt hist_expire_dups_first
setopt hist_ignore_dups
setopt hist_verify

# completion using arrow keys (based on history)
bindkey '^[[A' history-search-backward
bindkey '^[[B' history-search-forward

# Check if zsh-autosuggestions is installed via Nix
if [ -e "${HOME}/.nix-profile/share/zsh-autosuggestions/zsh-autosuggestions.zsh" ]; then
  source "${HOME}/.nix-profile/share/zsh-autosuggestions/zsh-autosuggestions.zsh"
fi

# Check if zsh-syntax-highlighting is installed via Nix
if [ -e "${HOME}/.nix-profile/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh" ]; then
  source "${HOME}/.nix-profile/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh"
fi

# NVM setup (if you're using NVM with Nix)
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"

# Ruby setup (if you're using rbenv with Nix)
if [ -d "$HOME/.rbenv" ]; then
  export PATH="$HOME/.rbenv/shims:$PATH"
fi

# FZF setup
if command -v fzf >/dev/null 2>&1; then
  # Set up fzf key bindings and fuzzy completion
  if [ -e "${HOME}/.nix-profile/share/fzf/key-bindings.zsh" ]; then
    source "${HOME}/.nix-profile/share/fzf/key-bindings.zsh"
  fi
  if [ -e "${HOME}/.nix-profile/share/fzf/completion.zsh" ]; then
    source "${HOME}/.nix-profile/share/fzf/completion.zsh"
  fi

  # FZF theme
  # fg="#CBE0F0"
  # bg="#011628"
  # bg_highlight="#143652"
  # purple="#B388FF"
  # blue="#06BCE4"
  # cyan="#2CF9ED"
  # export FZF_DEFAULT_OPTS="--color=fg:${fg},bg:${bg},hl:${purple},fg+:${fg},bg+:${bg_highlight},hl+:${purple},info:${blue},prompt:${cyan},pointer:${cyan},marker:${cyan},spinner:${cyan},header:${cyan}"

  # Use fd instead of find for FZF
  if command -v fd >/dev/null 2>&1; then
    export FZF_DEFAULT_COMMAND="fd --hidden --strip-cwd-prefix --exclude .git"
    export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
    export FZF_ALT_C_COMMAND="fd --type=d --hidden --strip-cwd-prefix --exclude .git"
  fi

  # FZF functions
  _fzf_compgen_path() {
    fd --hidden --exclude .git . "$1"
  }

  _fzf_compgen_dir() {
    fd --type=d --hidden --exclude .git . "$1"
  }

  # Source fzf-git.sh if it exists
  if [ -f ~/fzf-git.sh/fzf-git.sh ]; then
    source ~/fzf-git.sh/fzf-git.sh
  fi

  show_file_or_dir_preview="if [ -d {} ]; then eza --tree --color=always {} | head -200; else bat -n --color=always --line-range :500 {}; fi"
  export FZF_CTRL_T_OPTS="--preview '$show_file_or_dir_preview'"
  export FZF_ALT_C_OPTS="--preview 'eza --tree --color=always {} | head -200'"

  _fzf_comprun() {
    local command=$1
    shift
    case "$command" in
      cd)           fzf --preview 'eza --tree --color=always {} | head -200' "$@" ;;
      export|unset) fzf --preview "eval 'echo \${}'"         "$@" ;;
      ssh)          fzf --preview 'dig {}'                   "$@" ;;
      *)            fzf --preview "$show_file_or_dir_preview" "$@" ;;
    esac
  }
fi

# Bat setup
if command -v bat >/dev/null 2>&1; then
  export BAT_THEME=tokyonight_night
fi

# Eza setup
if command -v eza >/dev/null 2>&1; then
  alias ls="eza --icons=always"
fi

# Zoxide setup
if command -v zoxide >/dev/null 2>&1; then
  eval "$(zoxide init zsh)"
  alias cd="z"
fi

# Add Nix and Home Manager paths
export PATH="$HOME/.nix-profile/bin:$PATH"
export NIX_PATH="$HOME/.nix-defexpr/channels:$NIX_PATH"

# Prompt
export STARSHIP_CONFIG=$HOME/.starship.toml
eval "$(starship init zsh)"

# bun completions
[ -s "/Users/felix/.bun/_bun" ] && source "/Users/felix/.bun/_bun"

# bun
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"
