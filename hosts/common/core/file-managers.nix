{pkgs, ...}: {
  environment.systemPackages = with pkgs; [
    fd # File finder
    mc # Midnight Commander, a terminal file manager
    ripgrep # Fast search tool
    tree # Handy directory tree tool
  ];
}
