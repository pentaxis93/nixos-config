{pkgs, ...}: {
  imports = [
    ./nh.nix
  ];

  environment.systemPackages = with pkgs; [
    cowsay # Cow says something
    fortune # A fortune cookie generator
    gimp # Image manipulation
    nerdfonts # Awesome fonts with icons
  ];
}
