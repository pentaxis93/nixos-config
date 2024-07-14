{...}: {
  programs.waybar = {
    enable = true;
    settings = {
      mainbar = {
        layer = "top";
        output = "eDP-1";
        position = "top";
        margin-top = 10;
        margin-left = 10;
        margin-right = 10;
        height = 40;
        modules-left = [
          "hyprland/workspaces"
        ];
        modules-center = [
          "hyprland/window"
        ];
        modules-right = [
          "tray"
          "clock"
        ];
        tray = {
          spacing = 10;
          icon-size = 21;
          show-passive-items = true;
        };
      };
    };
    style = ''
      * {
        border-radius: 7px;
      }
      window#waybar {
        border: 2px solid rgba(100, 100, 100, 1);
      }
    '';
  };
}
