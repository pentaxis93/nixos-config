{
  pkgs,
  config,
  ...
}: {
  programs.hyprland.enable = true;
  environment.systemPackages = with pkgs; [
    kitty # Terminal
    rofi # App launcher
    waybar # System status bar
  ];
}
