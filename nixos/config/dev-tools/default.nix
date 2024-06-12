{pkgs, ...}: {
  imports = [
    ./git.nix
    ./python.nix
  ];

  environment.systemPackages = with pkgs; [
    gcc # GNU compiler collection for C/C++
    nodejs # Runtime for JavaScript
  ];

  # npm - "node package manager" for web dev
  programs.npm.enable = true;
}
