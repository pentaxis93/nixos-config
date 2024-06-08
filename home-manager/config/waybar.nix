{...}: {
  programs.waybar = {
    enable = true;

    settings = {
      mainbar = {
        layer = "top";
        output = "HDMI-A-1";
        position = "top";
        margin-top = 10;
        height = 40;
        modules-left = [
          "hyprland/window"
        ];
        modules-center = [
          "hyprland/workspaces"
        ];
        modules-right = [
          "clock"
        ];
      };
    };
  };
}
