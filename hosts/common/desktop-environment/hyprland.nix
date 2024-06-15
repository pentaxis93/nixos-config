{
  pkgs,
  lib,
  config,
  ...
}: {
  options = {
    hyprland.enable = lib.mkEnableOption "enables Hyprland";
  };

  config = lib.mkIf config.hyprland.enable {
    programs.hyprland.enable = true;

    environment.systemPackages = with pkgs; [
      xdg-desktop-portal-gtk
      xdg-desktop-portal-hyprland
    ];
  };
}
