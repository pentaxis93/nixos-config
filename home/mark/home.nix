{ pkgs, ... }:

{

  # Basic user settings
  home.username = "mark";
  home.homeDirectory = "/home/mark";

  imports = [
    ./git.nix
    ./vscode.nix
  ];

  # Install extra packages here
  home.packages = with pkgs; [
  ];

  # We shouldn't change this ever; it's for backwards compatibility
  home.stateVersion = "23.11";

}
