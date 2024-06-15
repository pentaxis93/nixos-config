{pkgs, ...}: {
  imports = [
    ./git.nix
    ./python.nix
  ];

  environment.systemPackages = with pkgs; [
    gcc # GNU compiler collection for C/C++
    nodejs # Runtime for JavaScript
  ];

  programs.npm.enable = true; # Package manager for web dev
}
