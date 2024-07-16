{pkgs, ...}: {
  imports = [
    ./waybar.nix
  ];

  wayland.windowManager.hyprland = {
    enable = true;
    settings = {
      # Monitors
      monitor = [
        "eDP-1, 1920x1080@60, 0x0, 1"
      ];

      # Applications
      "$terminal" = "kitty";
      "$fileManager" = "lf";
      "$menu" = "rofi -show drun -show-icons -theme android_notification";

      # Autostart
      exec-once = [
        "dunst"
        "nm-applet"
        "pypr --config /home/mark/.dotfiles/home-manager/profiles/mark/pyprland.toml"
        "waybar"
      ];

      # Keybindings
      "$mainMod" = "SUPER";
      bind = [
        # Main actions
        "$mainMod, Q, exec, $terminal"
        "$mainMod, W, exec, code"
        "$mainMod, E, exec, firefox"
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
        "$mainMod, H, movefocus, l"
        "$mainMod, J, movefocus, d"
        "$mainMod, K, movefocus, u"
        "$mainMod, L, movefocus, r"

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
      ];
    };
    extraConfig = ''
      general {
        border_size = 2
        col.inactive_border = rgb(646464)
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

      input {
        touchpad {
          disable_while_typing = false
          natural_scroll = true
        }
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
    pyprland # Hyprland extensions
    rofi-wayland # App launcher
  ];
}
