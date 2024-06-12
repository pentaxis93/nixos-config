{pkgs, ...}: {
  home.packages = with pkgs; [
    fd # File finder
    mc # Midnight Commander, a terminal file manager
    ranger # Ranger, a vim-style file manager
    ripgrep # Fast search tool
    tree # Handy directory tree tool
  ];
}
