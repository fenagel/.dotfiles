if [ -f ~/.bashrc ]; then
    source ~/.bashrc
fi

export XDG_CONFIG_HOME="$HOME"/.config
. "$HOME/.cargo/env"
