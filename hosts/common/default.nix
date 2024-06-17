{pkgs, ...}: {
  imports = [
    ./core
    ./users
    ./secrets.nix
  ];
}
