{pkgs, ...}: {
  programs.zsh = {
    enable = true;
    enableCompletion = true;
    autosuggestion.enable = true;
    syntaxHighlighting.enable = true;

    oh-my-zsh = {
      enable = true;
      theme = "robbyrussell";
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
}
