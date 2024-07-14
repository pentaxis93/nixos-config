{pkgs, ...}: {
  imports = [
    ./compression-utilities.nix # Curated compression utilities
    ./firefox.nix # Browser
    ./media-creation-apps.nix # Curated media creation apps
    ./thunar.nix # GUI file manager
    ./virtualbox.nix # Virtualization
  ];

  environment.systemPackages = with pkgs; [
    calibre # E-book library and reader
    nvtop # GPU monitor
    okular # PDF viewer
    vlc # Video player
  ];
}
