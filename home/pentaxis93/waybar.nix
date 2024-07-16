{...}: {
  programs.waybar = {
    enable = true;
    settings = {
      mainbar = {
        layer = "top";
        output = "HDMI-A-1";
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
            power_supply_status=$(cat /sys/class/power_supply/BAT0/status)
            warning_file="/tmp/battery_warning_sent"
            critical_file="/tmp/battery_critical_sent"

            if [ "$power_supply_status" = "Charging" ] || [ "$power_supply_status" = "Full" ]; then
              if [ -f "$critical_file" ]; then
                dunstify -C 9000  # Assuming 9000 is the ID for the critical notification
                rm -f "$critical_file"
              fi
              if [ -f "$warning_file" ]; then
                dunstify -C 9001  # Assuming 9001 is the ID for the warning notification
                rm -f "$warning_file"
              fi
            elif [ $capacity -le 5 ] && [ ! -f "$critical_file" ]; then
              dunstify -r 9000 -u critical -t 0 "Battery Critical" "Battery level is critical!\nPlug you're device in NOW!!!"
              touch "$critical_file"
              if [ -f "$warning_file" ]; then
                dunstify -C 9001
                rm -f "$warning_file"
              fi
            elif [ $capacity -le 15 ] && [ ! -f "$warning_file" ] && [ ! -f "$critical_file" ]; then
              dunstify -r 9001 -u normal -t 0 "Battery Warning" "Battery level is low.\nPlease plug you're device in!"
              touch "$warning_file"
            elif [ $capacity -gt 15 ] && [ "$power_supply_status" = "Discharging" ]; then
              if [ -f "$warning_file" ]; then
                dunstify -C 9001
                rm -f "$warning_file"
              fi
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
