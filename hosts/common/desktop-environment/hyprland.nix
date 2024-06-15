{
  lib,
  config,
  ...
}: {
  options = {
    hyprland.enable = lib.mkEnableOption "enables Hyprland";
  };

  config = lib.mkIf config.hyprland.enable {
    programs.hyprland.enable = true;
    # xdg.portal.enable = true;
  };
}
