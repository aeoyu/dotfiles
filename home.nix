{ config, pkgs, ... }:

{
  programs.home-manager.enable = true;
  programs.fzf = {
    enable = true;
    enableZshIntegration = true;
    fileWidgetCommand = "fd --type f";
  };
  programs.zsh = {
    enable = true;
    enableCompletion = true;
    enableAutosuggestions = true;
    history.extended = true;
    initExtra = ''
      ${builtins.readFile ./zshrc}
    '';
    sessionVariables = rec {
      EDITOR = "vim";
    };
    oh-my-zsh = {
      enable = true;
      plugins = [
        "docker"
        "docker-compose"
        "git"
        "brew"
        "history"
        "node"
        "npm"
        "kubectl"
      ];
    };
    plugins = [
      {
        # will source zsh-autosuggestions.plugin.zsh
        name = "zsh-autosuggestions";
        src = pkgs.fetchFromGitHub {
          owner = "zsh-users";
          repo = "zsh-autosuggestions";
          rev = "v0.4.0";
          sha256 = "0z6i9wjjklb4lvr7zjhbphibsyx51psv50gm07mbb0kj9058j6kc";
        };
      }
      {
        name = "zsh-syntax-highlighting";
        file = "zsh-syntax-highlighting.zsh";
        src = builtins.fetchGit {
          url = "https://github.com/zsh-users/zsh-syntax-highlighting/";
          rev = "932e29a0c75411cb618f02995b66c0a4a25699bc";
        };
      }
    ];
  };

  # ---------------------------------------------------------
  # Managed files
  # ---------------------------------------------------------
  home.file.".gitconfig".source = ./gitconfig;
  home.file.".zshrc".source = ./zshrc;
  home.file.".config/base16-shell" = {
    recursive = true;
    source = pkgs.fetchFromGitHub {
      owner = "chriskempson";
      repo = "base16-shell";
      rev = "ce8e1e540367ea83cc3e01eec7b2a11783b3f9e1";
      sha256 = "1yj36k64zz65lxh28bb5rb5skwlinixxz6qwkwaf845ajvm45j1q";
    };
  };

  home.packages = [
    # SYSTEM
    pkgs.htop
    pkgs.exa
    pkgs.fasd
    pkgs.ripgrep
    pkgs.jq
    pkgs.httpie
    pkgs.fd
    pkgs.diff-so-fancy
    pkgs.docker
    pkgs.youtube-dl
    pkgs.fzf
    pkgs.wget
    pkgs.bat

    # NODE
    pkgs.nodejs

    # GOLANG
    pkgs.go

    # FONTS
    pkgs.fontconfig
  ];
}