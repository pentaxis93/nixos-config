{pkgs, ...}: {
  imports = [
    ./neve.nix
  ];

  home.packages = with pkgs; [
    kate # KDE text editor
  ];
}
