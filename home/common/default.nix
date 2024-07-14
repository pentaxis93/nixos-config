{pkgs, ...}: {
  imports = [
    ./hexchat.nix
    ./hyprland.nix
    ./kitty.nix
    ./neve.nix
    ./obs-studio.nix
    ./ranger.nix
    ./taskwarrior.nix
    ./vscode.nix
    ./zsh.nix
  ];

  home.packages = with pkgs; [
    kate # KDE text editor
  ];
}
