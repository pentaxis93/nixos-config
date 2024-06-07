{pkgs, ...}: {
  wayland.windowManager.hyprland = {
    enable = true;
    settings = {
      # Monitors
      monitor = [
        "HDMI-A-1, 2560x1440, 1080x0, 1"
        "DP-1, 1920x1080, 0x0, 1, transform, 1"
      ];

      # Applications
      "$terminal" = "kitty";
      "$fileManager" = "lf";
      "$menu" = "rofi -show drun -show-icons";

      # Autostart
      exec-once = [
        "dunst"
        "nm-applet"
        "waybar"
      ];

      # Workspaces
      workspace = [
        "1, monitor:HDMI-A-1"
        "2, monitor:HDMI-A-1"
        "3, monitor:HDMI-A-1"
        "4, monitor:HDMI-A-1"
        "5, monitor:HDMI-A-1"
        "6, monitor:HDMI-A-1"
        "7, monitor:HDMI-A-1"
        "8, monitor:DP-1"
        "9, monitor:DP-1"
        "10, monitor:DP-1"
      ];

      # Keybindings
      "$mainMod" = "SUPER";
      bind = [
        # Main actions
        "$mainMod, Q, exec, $terminal"
        "$mainMod, C, killactive"
        "$mainMod, M, exit"
        "$mainMod, E, exec, $fileManager"
        "$mainMod, V, togglefloating"
        "$mainMod, R, exec, $menu"
        "$mainMod, P, pseudo"
        "$mainMod, J, togglesplit"

        # Move focus
        "$mainMod, left, movefocus, l"
        "$mainMod, right, movefocus, r"
        "$mainMod, up, movefocus, u"
        "$mainMod, down, movefocus, d"
        "$mainMod, h, movefocus, l"
        "$mainMod, j, movefocus, d"
        "$mainMod, k, movefocus, u"
        "$mainMod, l, movefocus, r"

        # Switch workspaces
        "$mainMod, 1, workspace, 1"
        "$mainMod, 2, workspace, 2"
        "$mainMod, 3, workspace, 3"
        "$mainMod, 4, workspace, 4"
        "$mainMod, 5, workspace, 5"
        "$mainMod, 6, workspace, 6"
        "$mainMod, 7, workspace, 7"
        "$mainMod, 8, workspace, 8"
        "$mainMod, 9, workspace, 9"
        "$mainMod, 0, workspace, 10"

        # Move active window to workspace
        "$mainMod SHIFT, 1, movetoworkspace, 1"
        "$mainMod SHIFT, 2, movetoworkspace, 2"
        "$mainMod SHIFT, 3, movetoworkspace, 3"
        "$mainMod SHIFT, 4, movetoworkspace, 4"
        "$mainMod SHIFT, 5, movetoworkspace, 5"
        "$mainMod SHIFT, 6, movetoworkspace, 6"
        "$mainMod SHIFT, 7, movetoworkspace, 7"
        "$mainMod SHIFT, 8, movetoworkspace, 8"
        "$mainMod SHIFT, 9, movetoworkspace, 9"
        "$mainMod SHIFT, 0, movetoworkspace, 10"

        # Dotfiles
        "$mainMod, D, togglespecialworkspace, magic"
        "$mainMod, SHIFT D, movetoworkspace, special:magic"

        # Hyprland
        "$mainMod, H, togglespecialworkspace, magic"
        "$mainMod, SHIFT H, movetoworkspace, special:magic"

        # Neve
        "$mainMod, N, togglespecialworkspace, magic"
        "$mainMod, SHIFT N, movetoworkspace, special:magic"

        # Gallery
        "$mainMod, G, togglespecialworkspace, magic"
        "$mainMod, SHIFT G, movetoworkspace, special:magic"
      ];
    };
    extraConfig = ''
      general {
        border_size = 2
        gaps_in = 5
        gaps_out = 10
        layout = master
        no_border_on_floating = true
        resize_on_border = true
      }

      decoration {
        drop_shadow = true
        rounding = 5
        shadow_range = 4
        shadow_render_power = 3
      }

      animations {
        enabled = true
        animation = global, 1, 2, default
      }
    '';
  };

  home.packages = with pkgs; [
    dunst # Notification daemon
    kitty # Terminal
    libnotify # Desktop notifications
    networkmanagerapplet # Network manager
    rofi-wayland # App launcher
    waybar # Status bar
  ];
}
