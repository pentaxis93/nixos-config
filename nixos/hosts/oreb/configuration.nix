{
  inputs,
  lib,
  config,
  pkgs,
  ...
}: {
  imports = [
    # If you want to use modules from other flakes (such as nixos-hardware):
    # inputs.hardware.nixosModules.common-cpu-amd
    # inputs.hardware.nixosModules.common-ssd

    # You can also split up your configuration and import pieces of it here:
    # ./users.nix

    ./hardware-configuration.nix
    ../../config/hyprland.nix
    ../../config/stylix.nix
  ];

  nixpkgs = {
    overlays = [
      # If you want to use overlays exported from other flakes:
      # neovim-nightly-overlay.overlays.default

      # Or define it inline, for example:
      # (final: prev: {
      #   hi = final.hello.overrideAttrs (oldAttrs: {
      #     patches = [ ./change-hello-to-hi.patch ];
      #   });
      # })
    ];
    # Configure your nixpkgs instance
    config = {
      allowUnfree = true;
    };
  };

  nix = let
    flakeInputs = lib.filterAttrs (_: lib.isType "flake") inputs;
  in {
    settings = {
      # Enable flakes and new 'nix' command
      experimental-features = "nix-command flakes";
      # Opinionated: disable global registry
      flake-registry = "";
      # Workaround for https://github.com/NixOS/nix/issues/9574
      nix-path = config.nix.nixPath;
    };
    # Opinionated: disable channels
    channel.enable = false;

    # Opinionated: make flake registry and nix path match flake inputs
    registry = lib.mapAttrs (_: flake: {inherit flake;}) flakeInputs;
    nixPath = lib.mapAttrsToList (n: _: "${n}=flake:${n}") flakeInputs;
  };

  environment.sessionVariables = {
    FLAKE = "/home/pentaxis93/.dotfiles";
  };

  # Automatic login
  services.xserver.displayManager.autoLogin.enable = true;
  services.xserver.displayManager.autoLogin.user = "pentaxis93";

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
    cowsay # Cow says something
    curl # Transfer data with urls
    fd # File finder
    fortune # A fortune cookie generator
    gcc # GNU compiler collection for C/C++
    gimp # Image manipulation
    git # Version control
    kate # KDE text editor
    lazygit # UI for git
    mc # Midnight Commander, a terminal file manager
    nerdfonts # Awesome fonts with icons
    nodejs # Runtime for JavaScript
    python3 # Python programming language
    ranger # Ranger, a vim-style file manager
    ripgrep # Fast search tool
    tree # Handy directory tree tool
    wget # Download files from the web
    xsel # Clipboard utility

    inputs.neve.packages.${pkgs.system}.default

    # Formatters
    alejandra
    black
    google-java-format
    nodePackages.prettier
    prettierd
    rustfmt
    stylua
  ];

  # Enable zsh and make default for all users
  programs.zsh.enable = true;
  users.defaultUserShell = pkgs.zsh;

  # Default editor
  environment.variables.EDITOR = "nvim";

  # npm - "node package manager" for web dev
  programs.npm.enable = true;

  # Enable the X11 windowing system.
  services.xserver.enable = true;

  # Enable the KDE Plasma Desktop Environment.
  services.xserver.displayManager.sddm.enable = true;
  services.xserver.displayManager.sddm.wayland.enable = true;
  services.xserver.desktopManager.plasma6.enable = true;

  # Bootloader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

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

  networking.hostName = "oreb";

  users.groups.sudo = {};

  users.users = {
    pentaxis93 = {
      extraGroups = ["networkmanager" "wheel" "sudo"];
      initialPassword = "password";
      isNormalUser = true;
      # openssh.authorizedKeys.keys = [
      # TODO: Add your SSH public key(s) here, if you plan on using SSH to connect
      # ];
    };
  };

  # Configure sudo to not require a password for users in the 'sudo' group
  security.sudo.extraConfig = ''
    pentaxis93 ALL=(ALL:ALL) NOPASSWD: ALL
  '';

  # This setups a SSH server. Very important if you're setting up a headless system.
  # Feel free to remove if you don't need it.
  # services.openssh = {
  #   enable = true;
  #   settings = {
  # Opinionated: forbid root login through SSH.
  #     PermitRootLogin = "no";
  # Opinionated: use keys only.
  # Remove if you want to SSH using passwords
  #     PasswordAuthentication = false;
  #   };
  # };

  # https://nixos.wiki/wiki/FAQ/When_do_I_update_stateVersion
  system.stateVersion = "23.11";
}
