{
  packageOverrides = pkgs: with pkgs; {
    myPackages = pkgs.buildEnv {
      name = "dev-tools";
      paths = [
        bash-completion
        zsh
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
	      zsh-autosuggestions
	      zsh-syntax-highlighting
	      bat
	      eza
      ];
    };
  };
}
