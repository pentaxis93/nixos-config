{pkgs, ...}: {
  imports = [
    ./nh.nix # Nix command helper
    ./zsh.nix # Z shell
  ];

  environment.systemPackages = with pkgs; [
    cowsay # Cow says something
    curl # Transfer data with urls
    fortune # A fortune cookie generator
    wget # Download files from the web
  ];

  networking.networkmanager.enable = true;
}
