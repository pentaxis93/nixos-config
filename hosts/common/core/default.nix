{pkgs, ...}: {
  imports = [
    ./desktop-apps
    ./desktop-environment
    ./dev-tools
    ./file-managers.nix
    ./nh.nix # Nix command helper
    ./zsh.nix # Z shell
  ];

  environment.systemPackages = with pkgs; [
    pavucontrol # Volume control
    cowsay # Cow says something
    curl # Transfer data with urls
    fortune # A fortune cookie generator
    gparted # Partition editor
    wget # Download files from the web
    zoom-us # Video conferencing
  ];

  networking.networkmanager.enable = true;
  programs.nm-applet.enable = true;
}
