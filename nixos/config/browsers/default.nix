{pkgs, ...}: {
  imports = [
    ./firefox.nix
  ];

  environment.systemPackages = with pkgs; [
    brave
  ];
}
