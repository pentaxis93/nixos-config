{
  lib,
  config,
  ...
}: {
  options = {
    kde-plasma.enable = lib.mkEnableOption "enables KDE Plasma";
  };

  config = lib.mkIf config.kde-plasma.enable {
    services.xserver.enable = true;
    services.xserver.displayManager.sddm.enable = true;
    services.xserver.displayManager.sddm.wayland.enable = true;
    services.xserver.desktopManager.plasma5.enable = true;
  };
}
