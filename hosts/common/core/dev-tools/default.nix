{pkgs, ...}: {
  imports = [
    ./direnv.nix
    ./git.nix
    ./python.nix
  ];

  environment.systemPackages = with pkgs; [
    cloc # Count lines of code
    gcc # GNU compiler collection for C/C++
    nodejs # Runtime for JavaScript
  ];

  programs.npm.enable = true; # Package manager for web dev
}
