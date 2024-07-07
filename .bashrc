#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# Set to superior editing mode
set -o vi

# keybinds
bind -x '"\C-l":clear'
# ~~~~~~~~~~~~~~~ Environment Variables ~~~~~~~~~~~~~~~~~~~~~~~~

export VISUAL=nvim
export EDITOR=nvim

# config
export BROWSER="arc"

# directories
export REPOS="$HOME/repos"
export GITUSER="fenagel"
export GHREPOS="$REPOS/github.com/$GITUSER"
export DOTFILES="$GHREPOS/dotfiles"
export LAB="$GHREPOS/lab"
export SCRIPTS="$DOTFILES/scripts"
export ICLOUD="$HOME/icloud"
export SECOND_BRAIN="$HOME/Zettelkasten"

# Go related. In general all executables and scripts go in .local/bin
export GOBIN="$HOME/.local/bin"
export GOPRIVATE="github.com/$GITUSER/*,gitlab.com/$GITUSER/*"
# export GOPATH="$HOME/.local/share/go"
export GOPATH="$HOME/go/"

# get rid of mail notifications on MacOS
unset MAILCHECK

# ~~~~~~~~~~~~~~~ Path configuration ~~~~~~~~~~~~~~~~~~~~~~~~

PATH="${PATH:+${PATH}:}"$SCRIPTS":"$HOME"/.local/bin" # appending

export PATH="${KREW_ROOT:-$HOME/.krew}/bin:$PATH"

# ~~~~~~~~~~~~~~~ History ~~~~~~~~~~~~~~~~~~~~~~~~

export HISTFILE=~/.histfile
export HISTSIZE=25000
export SAVEHIST=25000
export HISTCONTROL=ignorespace

# ~~~~~~~~~~~~~~~ Functions ~~~~~~~~~~~~~~~~~~~~~~~~

# This function is stolen from rwxrob

clone() {
    local repo="$1" user
    local repo="${repo#https://github.com/}"
    local repo="${repo#git@github.com:}"
    if [[ $repo =~ / ]]; then
        user="${repo%%/*}"
    else
        user="$GITUSER"
        [[ -z "$user" ]] && user="$USER"
    fi
    local name="${repo##*/}"
    local userd="$REPOS/github.com/$user"
    local path="$userd/$name"
    [[ -d "$path" ]] && cd "$path" && return
    mkdir -p "$userd"
    cd "$userd"
    echo gh repo clone "$user/$name" -- --recurse-submodule
    gh repo clone "$user/$name" -- --recurse-submodule
    cd "$name"
} && export -f clone

# ~~~~~~~~~~~~~~~ SSH ~~~~~~~~~~~~~~~~~~~~~~~~
# SSH Script from arch wiki

if ! pgrep -u "$USER" ssh-agent >/dev/null; then
    ssh-agent >"$XDG_RUNTIME_DIR/ssh-agent.env"
fi
if [[ ! "$SSH_AUTH_SOCK" ]]; then
    source "$XDG_RUNTIME_DIR/ssh-agent.env" >/dev/null
fi

# Only run on Ubuntu

if [[ $(grep -E "^(ID|NAME)=" /etc/os-release | grep -q "ubuntu")$? == 0 ]]; then
    eval "$(ssh-agent -s)" >/dev/null
    eval "$(fzf --bash)"
fi

# ~~~~~~~~~~~~~~~ Prompt ~~~~~~~~~~~~~~~~~~~~~~~~

export STARSHIP_CONFIG=$HOME/.starship.toml
eval "$(starship init bash)"

# ~~~~~~~~~~~~~~~ Aliases ~~~~~~~~~~~~~~~~~~~~~~~~

alias v=nvim
alias vim=nvim

# cd
alias ..="cd .."
alias scripts='cd $SCRIPTS'

# Repos

alias lab='cd $LAB'
alias cks='cd $LAB/kubernetes/cks/'
alias dot='cd $GHREPOS/dotfiles'
alias repos='cd $REPOS'
alias ghrepos='cd $GHREPOS'
alias cdgo='cd $GHREPOS/go/'

alias c="clear"
alias icloud="cd \$ICLOUD"

# ls
alias ls='ls --color=auto'
alias ll='ls -la'
# alias la='exa -laghm@ --all --icons --git --color=always'
alias la='ls -lathr'

# finds all files recursively and sorts by last modification, ignore hidden files
alias lastmod='find . -type f -not -path "*/\.*" -exec ls -lrt {} +'

alias sv='sudoedit'
alias t='tmux'
alias e='exit'
alias syu='sudo pacman -Syu'

# git
alias gp='git pull'
alias gs='git status'
alias lg='lazygit'

# ricing
alias eb='v ~/.bashrc'
alias ev='cd ~/.config/nvim/ && v init.lua'
alias sbr='source ~/.bashrc'
alias s='startx'

# vim & second brain
alias sb="cd \$SECOND_BRAIN"
alias in="cd \$SECOND_BRAIN/0 Inbox/"
alias zk="cd \$SECOND_BRAIN"

# starting programmes
alias cards='python3 /opt/homebrew/lib/python3.11/site-packages/mtg_proxy_printer/'

# terraform
alias tf='terraform'
alias tp='terraform plan'

# flux
source <(flux completion bash)
alias fgk='flux get kustomizations'

# completions
source <(talosctl completion bash)
source <(kubectl-cnp completion bash)
source <(cilium completion bash)
source <(devpod completion bash)

# fzf aliases
# use fp to do a fzf search and preview the files
alias fp="fzf --preview 'bat --style=numbers --color=always --line-range :500 {}'"
# search for a file with fzf and open it in vim
alias vf='v $(fp)'

# sourcing
# What is this for?
# source "$HOME/.privaterc"

if [[ "$OSTYPE" == "darwin"* ]]; then
    source "$HOME/.fzf.bash"
    # echo "I'm on Mac!"

    # brew bash completion
    [[ -r "/opt/homebrew/etc/profile.d/bash_completion.sh" ]] && . "/opt/homebrew/etc/profile.d/bash_completion.sh"
else
    #	source /usr/share/fzf/key-bindings.bash
    #	source /usr/share/fzf/completion.bash

    # The first one worked on Ubuntu, the eval one on Fedora. Keeping for reference.
    # [ -f ~/.fzf.bash ] && source ~/.fzf.bash
    eval "$(fzf --bash)"
fi

# Only needed for npm install on WSL
#export NVM_DIR="$HOME/.config/nvm"
#[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"                   # This loads nvm
#[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion" # This loads nvm bash_completion
