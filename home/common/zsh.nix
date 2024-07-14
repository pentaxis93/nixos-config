{pkgs, ...}: {
  programs.zsh = {
    enable = true;
    enableCompletion = true;
    autosuggestion.enable = true;
    syntaxHighlighting.enable = true;

    oh-my-zsh = {
      enable = true;
      plugins = [
        "copybuffer"
        "copyfile"
        "dirhistory"
        "git"
        "history"
        "sudo"
        "vi-mode"
        "web-search"
        "z"
      ];
    };

    shellAliases = {
      cd = "z";
      ls = "eza";
      vi = "nvim";
    };
  };

  home = {
    packages = with pkgs; [
      eza
    ];
    sessionVariables = {
      ZSH_THEME = "robbyrussell";
    };
  };
}
