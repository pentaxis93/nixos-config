{...}: {
  programs.waybar = {
    enable = true;

    settings = {
      mainbar = {
        layer = "top";
        output = "eDP-1";
        position = "top";
        margin-top = 10;
        height = 40;

        modules-left = [
          "hyprland/workspaces"
          "tray"
        ];
        modules-center = [
          "hyprland/window"
        ];
        modules-right = [
          "cpu"
          "memory"
          "network#wlp41s0"
          "clock"
        ];
      };
    };
  };
}
