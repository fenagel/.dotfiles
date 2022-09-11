set fish_greeting # disable fish greeting

starship init fish | source
zoxide init fish | source

# variables
set -U BAT_THEME Nord 
set -U EDITOR nvim
set -U FZF_CTRL_R_OPTS "--reverse --preview 'echo {}' --preview-window down:3:hidden:wrap --bind '?:toggle-preview'"
set -U FZF_DEFAULT_COMMAND "fd -H -E '.git'"
set -U FZF_DEFAULT_OPTS "--color=spinner:#F8BD96,hl:#F28FAD --color=fg:#D9E0EE,header:#F28FAD,info:#DDB6F2,pointer:#F8BD96 --color=marker:#F8BD96,fg+:#F2CDCD,prompt:#DDB6F2,hl+:#F28FAD"
set -U FZF_TMUX_OPTS "-p"
set -U GOPATH (go env GOPATH)
set -U LANG en_US.UTF-8
set -U LC_ALL en_US.UTF-8
set -U NODE_PATH "~/.nvm/versions/node/v16.15.0/bin/node"

fish_add_path /usr/local/sbin
fish_add_path /usr/local/go/bin
fish_add_path /sbin
fish_add_path /usr/sbin
fish_add_path /bin
fish_add_path /usr/bin
fish_add_path /usr/local/bin
fish_add_path $HOME/.rbenv/bin
fish_add_path $HOME/.rbenv/shims
fish_add_path $HOME/.nvm/versions/node/v14.17.1/bin
fish_add_path ./bin
fish_add_path $HOME/.rbenv/bin
fish_add_path usr/local/bin/brew/bin
fish_add_path usr/local/bin/brew/sbin
fish_add_path $HOME/.nvm
fish_add_path $HOME/.config/bin
fish_add_path $GOPATH/bin

# pnpm autocomplete
[ -f ~/.config/tabtab/fish/__tabtab.fish ]; and . ~/.config/tabtab/fish/__tabtab.fish; or true

# fish colors
set -U fish_color_autosuggestion black
set -U fish_color_command normal
set -U fish_color_error red
set -U fish_color_param cyan
set -U fish_color_redirections yellow
set -U fish_color_terminators white
set -U fish_color_valid_path green

# aliases
alias aw="~/.config/aw/bin/run"

# abbreviations
abbr :bd "exit"
abbr :q "tmux kill-server"
abbr ast "aw set -t (aw list | fzf-tmux -p --reverse --preview 'aw set -t {}')"
abbr bc "brew cleanup"
abbr bd "brew doctor"
abbr bi "brew install"
abbr bic "brew install --cask"
abbr bif "brew info"
abbr bifc "brew info --cask"
abbr bo "brew outdated"
abbr bs "brew services"
abbr bsr "brew services restart"
abbr bu "brew update"
abbr bug "brew upgrade"
abbr c "clear"
abbr cl "clear"
abbr claer "clear"
abbr clera "clear"
abbr cx "chmod +x"
abbr dc "docker compose"
abbr dcd "docker compose down"
abbr dcdv "docker compose down -v"
abbr dcr "docker compose restart"
abbr dcu "docker compose up -d" 
abbr dps "docker ps --format 'table {{.Names}}\t{{.Status}}'"
abbr e "exit"
abbr ee "espanso edit"
abbr er "espanso restart"
abbr g "git status"
abbr ga "git add ."
abbr gb "git branch -v"
abbr gc "git commit"
abbr gca "git commit -av"
abbr gcl "git clone"
abbr gco "git checkout -b"
abbr gcom "~/bin/git-to-master-cleanup-branch.sh"
abbr gd "git diff"
abbr gf "git fetch --all"
abbr gl "git pull"
abbr gma "git merge --abort"
abbr gmc "git merge --continue"
abbr gp "git push"
abbr gpom "git pull origin main"
abbr gpr "gh pr create"
abbr gpum "git pull upstream master"
abbr gr "git remote"
abbr gra "git remote add"
abbr grao "git remote add origin"
abbr grau "git remote add upstream"
abbr grv "git remote -v"
abbr gs "git status"
abbr gst "git status"
abbr hd "history delete --exact --case-sensitive \'(history | fzf-tmux -p -m --reverse)\'"
abbr l "lsd  --group-dirs first -A"
abbr ld "lazydocker"
abbr lg "lazygit"
abbr ll "lsd  --group-dirs first -Al"
abbr lt "lsd  --group-dirs last -A --tree"
abbr nb "npm run build"
abbr nd "npm run dev"
abbr ni "npm install"
abbr nt "npm run test"
abbr rmr "rm -rf"
abbr sa "SwitchAudioSource -t output -s (SwitchAudioSource -t output -a | fzf-tmux -p --reverse)"
abbr sai "SwitchAudioSource -t input -s (SwitchAudioSource -t input -a | fzf-tmux -p --reverse)"
abbr sao "SwitchAudioSource -t output -s (SwitchAudioSource -t output -a | fzf-tmux -p --reverse)"
abbr sf "source ~/.config/fish/config.fish"
abbr st "tmux source ~/.config/tmux/tmux.conf"
abbr t "sh t"
abbr tt "sh tt"
abbr ta "tmux a"
abbr tat "tmux attach -t"
abbr td "t dotfiles"
abbr tn "tmux new -s (pwd | sed 's/.*\///g')"
abbr u "bash ~/.conifg/bin/update.sh"
abbr v "nvim (fd --type f --hidden --follow --exclude .git | fzf-tmux -p --reverse)"
abbr va "nvim ~/.config/alacritty/alacritty.yml"
abbr vf "nvim ~/.config/fish/config.fish"
abbr vp "nvim package.json"
abbr vpc "nvim +PackerClean"
abbr vpi "nvim +PackerInstall"
abbr vpu "nvim +PackerUpdate"
abbr vt "nvim ~/.config/tmux/tmux.conf"
abbr y "yarn"
abbr ya "yarn add"
abbr yad "yarn add -D"
abbr yb "yarn build"
abbr yd "yarn dev"
abbr ye "yarn e2e"
abbr yg "yarn generate"
abbr yl "yarn lint"
abbr yt "yarn test"
abbr yu "yarn ui"
