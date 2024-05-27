# This is your system's configuration file.
# Use this to configure your system environment (it replaces /etc/nixos/configuration.nix)
{
  inputs,
  lib,
  config,
  pkgs,
  ...
}: {
  # You can import other NixOS modules here
  imports = [
    # If you want to use modules from other flakes (such as nixos-hardware):
    # inputs.hardware.nixosModules.common-cpu-amd
    # inputs.hardware.nixosModules.common-ssd

    # You can also split up your configuration and import pieces of it here:
    # ./users.nix

    # Import your generated (nixos-generate-config) hardware configuration
    ./hardware-configuration.oreb.nix
    inputs.nixvim.nixosModules.nixvim
  ];

  nixpkgs = {
    # You can add overlays here
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
      # Disable if you don't want unfree packages
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

  # FIXME: Add the rest of your current configuration

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

  # TODO: Implement modular config structure
  # Note: This causes a 'file not found' error, I have no idea why
  # Nixvim setup
  programs.nixvim = {
    enable = true;
    defaultEditor = true;

    opts = {
      number = true;
      relativenumber = true;
      shiftwidth = 2;
      undofile = true;
    };

    plugins = {
      cmp = {
	enable = true;
	autoEnableSources = true;
      };	

      cmp-buffer.enable = true;
      
      cmp-nvim-lsp.enable = true;

      cmp-path.enable = true;
      
      comment.enable = true;

      conform-nvim = {
	enable = true;
	# Map of filetype to formatters
	formattersByFt = {
	  lua = [ "stylua" ];
	  # Conform will run multiple formatters sequentially
	  python = [ "isort" "black" ];
	  # Use a sub-list to run only the first available formatter
	  javascript = [ [ "prettierd" "prettier" ] ];
	  # Use the "*" filetype to run formatters on all filetypes.
	  "*" = [ "codespell" ];
	  # Use the "_" filetype to run formatters on filetypes that don't
	  # have other formatters configured.
	  "_" = [ "trim_whitespace" ];
	 };
	formatOnSave = ''
	  require("conform").format({
	    async = true,
	    timeout_ms = 1000,
	  })
	'';
      };

      gitsigns.enable = true;

      flash.enable = true;

      lazygit.enable = true;

      leap.enable = true;

      lightline.enable = true;

      lsp = {
        enable = true;
	servers = {
	  nil_ls.enable = true;
	  tsserver.enable = true;
        };
      };

      mini = {
	enable = true;
	modules = {
	  pairs = {};
	  ai = {};
	};
      };

      neo-tree.enable = true;

      telescope.enable = true;

      todo-comments.enable = true;

      treesitter.enable = true;

      trouble.enable = true;
    };
  };

  # Install additional packages  
  environment.systemPackages = with pkgs; [
    curl	# Transfer data with urls
    fd		# File finder
    gcc		# GNU compiler collection for C/C++
    git		# Version control
    kate	# KDE text editor
    lazygit	# UI for git
    mc		# Midnight Commander, a terminal file manager
    nodejs	# Runtime for JavaScript
    python3	# Python programming language
    ranger	# Ranger, a vim-style file manager
    ripgrep	# Fast search tool
    tree	# Handy directory tree tool
    wget	# Download files from the web
    xsel	# Clipboard utility
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
  services.xserver.desktopManager.plasma5.enable = true;

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

  # TODO: Configure your system-wide user settings (groups, etc), add more users as needed.
  users.users = {
    pentaxis93 = {
      # TODO: You can set an initial password for your user.
      # If you do, you can skip setting a root password by passing '--no-root-passwd' to nixos-install.
      # Be sure to change it (using passwd) after rebooting!
      initialPassword = "password";
      isNormalUser = true;
      # openssh.authorizedKeys.keys = [
        # TODO: Add your SSH public key(s) here, if you plan on using SSH to connect
      # ];
      # TODO: Be sure to add any other groups you need (such as networkmanager, audio, docker, etc)
      extraGroups = ["networkmanager" "wheel" "sudo"];
    };
  };

  # Configure sudo to not require a password for users in the 'sudo' group
  security.sudo.extraConfig = ''
    %sudo ALL=(ALL:ALL) NOPASSWD: ALL
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
