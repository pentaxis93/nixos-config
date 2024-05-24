{ pkgs, ... }:

{

  # Basic user settings
  home.username = "pentaxis93";
  home.homeDirectory = "/home/pentaxis93";

  imports = [
    ./git.nix
    ./zsh.nix
  ];

  # User-specific packages
  home.packages = with pkgs; [
    cowsay	# Talking cow
  ];

  # Set environment variables
  home.sessionVariables = {
    FLAKE = "/home/pentaxis93/.dotfiles";
  };

  # Do not change - this is the originally installed version for backwards compatibility
  home.stateVersion = "23.11"; # Please read the comment before changing.

}
