{
  packageOverrides = pkgs: with pkgs; {
    myPackages = pkgs.buildEnv {
      name = "dev-tools";
      paths = [
        bash-completion
        neovim
        go
        nodejs_22
        starship
        fd
        ripgrep
        fzf
        lazygit
        kubectl
        kubectx
        k9s
        fluxcd
        tmux
        sesh
        zoxide
        zsh
        zsh-autosuggestions
        zsh-syntax-highlighting
        eza
        bat
      ];
    };
  };
}
