{pkgs, ...}: {
  imports = [
    ./browsers/default.nix
    ./dev-tools/default.nix
    ./fonts.nix
    ./network-tools/default.nix
    ./stylix.nix
    ./thunar.nix
    ./utilities/default.nix
    ./zsh.nix
  ];

  environment.systemPackages = with pkgs; [
    gimp # Image manipulation
    vlc # Video player
  ];
}
