{pkgs, ...}: {
  programs = {
    thunar = {
      enable = true;
      plugins = with pkgs.xfce; [
        thunar-archive-plugin
        thunar-volman
      ];
    };
  };

  # Add support for compressed files
  environment.systemPackages = with pkgs; [
    xarchiver # Compress and decompress files
    p7zip # handle 7z files
    unrar # handle rar files
    zip # handle zip files
    unzip # handle zip files
    gzip # handle gz files
    bzip2 # handle bz2 files
    gnutar # handle tar files
    xz # handle xz files
    lrzip # handle lrz files
    arj # handle arj files
    lha # handle lha files
    cabextract # handle cab files
  ];
}
