{pkgs, ...}: {
  imports = [
    ./compression-utilities.nix # Curated compression utilities
    ./firefox.nix # Browser
    ./media-creation-apps.nix # Curated media creation apps
    ./thunar.nix # GUI file manager
  ];

  environment.systemPackages = with pkgs; [
    nvtop # GPU monitor
    vlc # Video player
  ];
}
