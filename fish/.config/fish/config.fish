# ███████╗██╗███████╗██╗  ██╗
# ██╔════╝██║██╔════╝██║  ██║
# █████╗  ██║███████╗███████║
# ██╔══╝  ██║╚════██║██╔══██║
# ██║     ██║███████║██║  ██║
# ╚═╝     ╚═╝╚══════╝╚═╝  ╚═╝
# A smart and user-friendly command line
# https://fishshell.com
# cSpell:words ajeetdsouza cppflags ldflags pkgconfig pnpm nvim Nord gopath nvimpager ripgreprc ripgrep zoxide joshmedeski sharkdp neovim lucc

starship init fish | source # https://starship.rs/
zoxide init fish | source # 'ajeetdsouza/zoxide'

set -gx fish_greeting # disable fish greeting
set -gx CPPFLAGS -I/opt/homebrew/opt/sqlite/include
set -gx LDFLAGS -L/opt/homebrew/opt/sqlite/lib
set -gx PKG_CONFIG_PATH /opt/homebrew/opt/sqlite/lib/pkgconfig
set -Ux BAT_THEME Nord # 'sharkdp/bat' cat clone 
set -Ux EDITOR nvim # 'neovim/neovim' text editor 
set -Ux FZF_DEFAULT_COMMAND "fd -H -E '.git'"

set -Ux FZF_DEFAULT_OPTS "--reverse --no-info --pointer='' --marker='' \
--ansi --color='16,bg+:-1,gutter:-1,prompt:4,pointer:5,marker:6'"

set -Ux FZF_TMUX_OPTS "-p --reverse --no-info --pointer='' --marker='' \
--ansi --color='16,bg+:-1,gutter:-1,prompt:4,pointer:5,marker:6'"

set -Ux FZF_CTRL_R_OPTS "--border-label=' History ' --prompt=' '"

set -U GOPATH (go env GOPATH) # https://golang.google.cn/
set -U KIT_EDITOR /opt/homebrew/bin/nvim # https://www.scriptkit.com/
set -U LANG en_US.UTF-8
set -U LC_ALL en_US.UTF-8
set -U NODE_PATH "~/.nvm/versions/node/v16.19.0/bin/node" # 'nvm-sh/nvm'
set -U PAGER ~/.local/bin/nvimpager # 'lucc/nvimpager'
set -U RIPGREP_CONFIG_PATH "$HOME/.config/rg/ripgreprc"
set -U VISUAL nvim

# ordered by priority - bottom up
fish_add_path /opt/homebrew/bin # https://brew.sh/
fish_add_path /opt/homebrew/sbin
fish_add_path /opt/homebrew/opt/sqlite/bin
fish_add_path /opt/homebrew/opt/openjdk/bi
fish_add_path $GOPATH/bin
fish_add_path $PNPM_HOME
fish_add_path $HOME/.local/bin
fish_add_path $HOME/.config/tmux/plugins/tmux-nvr/bin
fish_add_path $HOME/.config/tmux/plugins/t-smart-tmux-session-manager/bin
fish_add_path $HOME/.config/bin # my custom scripts

# enable rbenv
status --is-interactive; and rbenv init - fish | source

# pnpm autocomplete
[ -f ~/.config/tabtab/fish/__tabtab.fish ]; and . ~/.config/tabtab/fish/__tabtab.fish; or true

# fish colors
set -U fish_color_autosuggestion '#a5abb6'
set -U fish_color_command normal
set -U fish_color_error red
set -U fish_color_param cyan
set -U fish_color_redirections yellow
set -U fish_color_terminators white
set -U fish_color_valid_path green

# abbreviations
abbr :bd exit
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
abbr c clear
abbr cl clear
abbr claer clear
abbr clera clear
abbr cx "chmod +x"
abbr dc "docker compose"
abbr dcd "docker compose down"
abbr dcdv "docker compose down -v"
abbr dcr "docker compose restart"
abbr dcu "docker compose up -d"
abbr dps "docker ps --format 'table {{.Names}}\t{{.Status}}'"
abbr e exit
abbr g "git status"
abbr ga "git add ."
abbr gb "git branch -v"
abbr gc "git commit -m "
abbr gca "git commit -av"
abbr gcl "git clone"
abbr gco "git checkout -b"
abbr gcod "git checkout develop"
abbr gcoms "git checkout master"
abbr gcomi "git checkout master"
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
abbr ld lazydocker
abbr lg lazygit
abbr ll "lsd  --group-dirs first -Al"
abbr lt "lsd  --group-dirs last -A --tree"
abbr nb "npm run build"
abbr nd "npm run dev"
abbr ni "npm install"
abbr nt "npm run test"
# Obsidian
abbr oo 'cd $HOME/Library/Mobile\\ Documents/iCloud~md~obsidian/Documents/Second\\ Brain/'
abbr or 'nvim $HOME/Library/Mobile\\ Documents/iCloud~md~obsidian/Documents/Second\\ Brain/inbox/*.md'
abbr rmr "rm -rf"
abbr pd "pnpm dev"
abbr pi "pnpm install"
abbr pb "pnpm build"
abbr sf "source ~/.config/fish/config.fish"
abbr st "tmux source ~/.config/tmux/tmux.conf"
abbr ta "tmux a"
abbr tat "tmux attach -t"
abbr td "sh t dotfiles"
abbr tn "tmux new -s (pwd | sed 's/.*\///g')"
abbr u "bash ~/.conifg/bin/update.sh"
abbr v "nvim (fd --type f --hidden --follow --exclude .git | fzf-tmux -p --reverse)"
abbr vf "nvim ~/.config/fish/config.fish"
abbr vp "nvim package.json"
abbr vt "nvim ~/.config/tmux/tmux.conf"
abbr y yarn
abbr ya "yarn add"
abbr yad "yarn add -D"
abbr yb "yarn build"
abbr yd "yarn dev"
abbr ye "yarn e2e"
abbr yg "yarn generate"
abbr yl "yarn lint"
abbr yt "yarn test"
abbr yu "yarn ui"
