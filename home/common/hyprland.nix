{pkgs, ...}: {
  wayland.windowManager.hyprland = {
    enable = true;
  };

  programs.zsh.sessionVariables = {
    NIXOS_OZONE_WL = "1";
  };

  xdg.portal = {
    enable = true;
    extraPortals = [pkgs.xdg-desktop-portal-gtk];
  };

  home.packages = with pkgs; [
    dunst # Notification daemon
    grimblast # Screenshot tool
    libnotify # Used by notification daemon
    networkmanagerapplet # Network manager
    pyprland # Hyprland extensions
    rofi-wayland # App launcher
    waybar # Wayland bar
  ];
}
