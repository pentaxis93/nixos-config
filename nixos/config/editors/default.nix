{pkgs, ...}: {
  imports = [
    ./neve.nix
  ];

  environment.systemPackages = with pkgs; [
    kate # KDE text editor
  ];
}
