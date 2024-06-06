{
  pkgs,
  config,
  ...
}: {
  programs.hyprland.enable = true;

  # xdg.portal.enable = true;

  environment.systemPackages = with pkgs; [
    dunst # Notification daemon
    kitty # Terminal
    libnotify # Desktop notifications
    networkmanagerapplet # Network manager
    rofi-wayland # App launcher
    # swww # Wallpaper daemon
    waybar # System status bar
  ];
}
