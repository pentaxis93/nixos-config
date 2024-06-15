{pkgs, ...}: {
  imports = [
    ./nh.nix # Nix command helper
  ];

  environment.systemPackages = with pkgs; [
    cowsay # Cow says something
    fortune # A fortune cookie generator
  ];
}
