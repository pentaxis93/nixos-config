{ config, pkgs, ... }:

{
  imports =
    [
      ./hardware-configuration.nix
    ];

  # User accounts
  users.users.pentaxis93 = {
    isNormalUser = true;
    description = "Robert Grossman";
    extraGroups = [ "networkmanager" "wheel" ];
    packages = with pkgs; [
      kate
    ];
  };

  users.users.mark = {
    isNormalUser = true;
    description = "Mark Grossman";
    extraGroups = [ "networkmanager" "wheel" ];
    packages = with pkgs; [
      kate
    ];
  };

  users.users.meli = {
    isNormalUser = true;
    description = "Melinda Kovacs";
    extraGroups = [ "networkmanager" "wheel" ];
    packages = with pkgs; [
      kate
    ];
  };

  # Firefox
  programs.firefox.enable = true;

  # nh, a nix command helper
  # TODO: Make default flake work
  programs.nh = {
    enable = true;
    clean.enable = true;
    clean.extraArgs = "--keep-since 4d --keep 3";
    flake = "/home/pentaxis93/.dotfiles";
  };

  # Install additional packages  
  environment.systemPackages = with pkgs; [
    curl	# Transfer data with urls
    fd		# File finder
    gcc		# GNU compiler collection for C/C++
    git		# Version control
    lazygit	# UI for git
    mc		# Midnight Commander, a terminal file manager
    neovim	# Editor
    ripgrep	# Fast search tool
    tree	# Handy directory tree tool
    wget	# Download files from the web
    xsel	# Clipboard utility
  ];

  # Default editor
  environment.variables.EDITOR = "nvim";

  # Enable the X11 windowing system.
  services.xserver.enable = true;

  # Enable the KDE Plasma Desktop Environment.
  services.xserver.displayManager.sddm.enable = true;
  services.xserver.desktopManager.plasma5.enable = true;

  # Bootloader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  # Define your hostname.
  networking.hostName = "hedwig";

  # Enable networking
  networking.networkmanager.enable = true;

  # Set your time zone.
  time.timeZone = "Europe/Budapest";

  # Select internationalisation properties.
  i18n.defaultLocale = "en_US.UTF-8";

  i18n.extraLocaleSettings = {
    LC_ADDRESS = "en_US.UTF-8";
    LC_IDENTIFICATION = "en_US.UTF-8";
    LC_MEASUREMENT = "en_US.UTF-8";
    LC_MONETARY = "en_US.UTF-8";
    LC_NAME = "en_US.UTF-8";
    LC_NUMERIC = "en_US.UTF-8";
    LC_PAPER = "en_US.UTF-8";
    LC_TELEPHONE = "en_US.UTF-8";
    LC_TIME = "en_US.UTF-8";
  };

  # Configure keymap in X11
  services.xserver = {
    layout = "us";
    xkbVariant = "";
  };

  # Enable sound with pipewire.
  sound.enable = true;
  hardware.pulseaudio.enable = false;
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
  };

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  # This is the original NixOS release from which default settings were taken. Don't change it.
  system.stateVersion = "23.11";

  # Enable Flakes and the new CLI tools that go with it
  nix.settings.experimental-features = [
    "flakes"
    "nix-command"
  ];

}
