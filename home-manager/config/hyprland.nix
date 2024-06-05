{
  pkgs,
  config,
  ...
}: {
  programs.hyprland = {
    enable = true;
    xwayland.enable = true;
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
    libnotify # Used by notification daemon
    rofi-wayland # App launcher
    waybar # Wayland bar
  ];
}
