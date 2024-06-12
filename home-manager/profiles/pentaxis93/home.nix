# This is your home-manager configuration file
# Use this to configure your home environment (it replaces ~/.config/nixpkgs/home.nix)
{...}: {
  imports = [
    ../../config/default.nix

    ./git.nix
    ./hyprland.nix
    ./stylix.nix
  ];

  nixpkgs = {
    overlays = [
    config = {
      # Disable if you don't want unfree packages
      allowUnfree = true;
      # Workaround for https://github.com/nix-community/home-manager/issues/2942
      allowUnfreePredicate = _: true;
    };
  };

  home = {
    username = "pentaxis93";
    homeDirectory = "/home/pentaxis93";
    sessionVariables = {
      EDITOR = "nvim";
      FLAKE = "/home/pentaxis93/.dotfiles";
    };
  };

  programs.home-manager.enable = true;
  programs.git.enable = true;

  # Nicely reload system units when changing configs
  systemd.user.startServices = "sd-switch";

  # https://nixos.wiki/wiki/FAQ/When_do_I_update_stateVersion
  home.stateVersion = "23.11";
}
