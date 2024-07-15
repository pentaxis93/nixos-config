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
          "pulseaudio"
          "battery"
          "clock"
        ];
        "hyprland/workspaces" = {
          # You can add any specific settings for workspaces here if needed
        };
        "hyprland/window" = {
          # You can add any specific settings for window here if needed
        };
        tray = {
          spacing = 10;
          icon-size = 21;
          show-passive-items = true;
        };
        pulseaudio = {
          format = "{volume}% {icon}";
          format-bluetooth = "{volume}% {icon}";
          format-muted = "0% 󰖁";
          format-icons = ["󰕿" "󰖀" "󰕾"];
          on-click = "sh -c 'if command -v pavucontrol >/dev/null; then pavucontrol; else alacritty -e alsamixer; fi'";
          tooltip = true;
        };

        battery = {
          format = "{capacity}% {icon}";
          format-icons = ["󰂎" "󰁺" "󰁻" "󰁼" "󰁽" "󰁾" "󰁿" "󰂀" "󰂁" "󰂂" "󰁹"];
          format-charging = "{capacity}% 󰂄";
          format-plugged = "{capacity}% 󰂄";
          interval = 1;
          states = {
            warning = 15;
            critical = 5;
          };
          on-update = ''
            capacity=$(cat /sys/class/power_supply/BAT0/capacity)
            warning_file="/waybar/tmp/battery_warning_sent"
            critical_file="/waybar/tmp/battery_critical_sent"
            if [ $capacity -le 5 ]; then
              if [ ! -f "$critical_file" ]; then
                notify-send -u critical "Battery Critical" "Battery level is $capacity%!"
                touch "$critical_file"
              fi
            elif [ $capacity -le 15 ]; then
              if [ ! -f "$warning_file" ]; then
                notify-send -u normal "Battery Warning" "Battery level is $capacity%"
                touch "$warning_file"
              fi
            elif [ $capacity -gt 15 ]; then
              rm -f "$warning_file" "$critical_file"
            fi
          '';
        };
        clock = {
          format = "{:%H:%M}";
          format-alt = "{:%Y-%m-%d}";
          tooltip-format = "{:%Y-%m-%d | %H:%M}";
        };
      };
    };
    style = ''
      * {
        border-radius: 7px;
        font-family: "Your Preferred Font", monospace;
      }
      window#waybar {
        background-color: rgba(43, 48, 59, 0.5);
        border: 2px solid rgba(100, 100, 100, 1);
        color: #ffffff;
      }
      #workspaces button {
        padding: 0 5px;
        background-color: transparent;
        color: #ffffff;
        border-bottom: 3px solid transparent;
      }
      #workspaces button.active {
        background-color: #64727D;
        border-bottom: 3px solid #ffffff;
      }
      #clock,
      #battery,
      #pulseaudio,
      #tray {
        padding: 0 10px;
        margin: 0 4px;
        color: #ffffff;
      }
      #battery.charging, #battery.plugged {
        color: #ffffff;
      }
      #battery.charging > label, #battery.plugged > label {
        color: #26A65B;
      }
      #battery.warning:not(.charging) {
        color: #ffbe61;
      }
      #battery.critical:not(.charging) {
        color: #ff5555;
      }
      #pulseaudio {
        color: #ffffff;
      }
      #pulseaudio.muted {
        color: #ff5555;
      }
    '';
  };
}
