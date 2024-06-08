{pkgs, ...}: {
  environment.systemPackages = with pkgs; [
    curl # Transfer data with urls
    wget # Download files from the web
  ];

  networking.networkmanager.enable = true;
}
