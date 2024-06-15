{pkgs, ...}: {
  imports = [
    ./core
    ./dev-tools
    ./desktop-apps
    ./desktop-environment
  ];
}
