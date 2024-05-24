{ pkgs, ... }:

{

  # Basic user settings
  home.username = "pentaxis93";
  home.homeDirectory = "/home/pentaxis93";

  imports = [
    ./zsh.nix
  ];

  # User-specific packages
  home.packages = with pkgs; [
    cowsay	# Talking cow
  ];

  # Git configuration
  programs.git = {
    enable = true;
    userName = "pentaxis93";
    userEmail = "13393192+pentaxis93@users.noreply.github.com";
    extraConfig = {
      init.defaultBranch = "main";
    };
  };

  # Set environment variables
  home.sessionVariables = {
    FLAKE = "/home/pentaxis93/.dotfiles";
  };

  # Do not change - this is the originally installed version for backwards compatibility
  home.stateVersion = "23.11"; # Please read the comment before changing.

}
