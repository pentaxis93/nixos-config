{...}: {
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
      vi = "nvim";
    };
  };

  home.sessionVariables = {
    ZSH_THEME = "random";
    ZSH_THEME_RANDOM_IGNORED = "()";
  };
}
