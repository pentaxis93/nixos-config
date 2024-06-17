{pkgs, ...}: {
  home.packages = with pkgs; [
    age # Encryption tool
  ];
}
