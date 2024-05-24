{ pkgs, ... }:

{

  # Basic user settings
  home.username = "mark";
  home.homeDirectory = "/home/mark";

  # VS Code
  programs.vscode = {
    enable = true;
    extensions = with pkgs.vscode-extensions; [
      # Theme and icons
      equinusocio.vsc-material-theme 		# Beautiful theme
      equinusocio.vsc-material-theme-icons 	# Icons to match the theme

      # Python support
      ms-python.python 				# Python support with linting, debugging, etc.
      ms-python.vscode-pylance 			# Python language server support
      
      # Development tools
      ritwickdey.liveserver 			# Development local server with live reload
      visualstudioexptteam.vscodeintellicode 	# AI-assisted coding

      # Quality of life
      esbenp.prettier-vscode 			# Automatically formats your code
      _2gua.rainbow-brackets 			# Color your brackets
      christian-kohler.path-intellisense 	# Autocompletes filenames
    ];
  };

  # Git
  programs.git = {
    enable = true;
    # userName = userSettings.mark.username;
    # userEmail = userSettings.mark.gitHubNoReplyEmail;
    extraConfig = {
      init.defaultBranch = "main";
    };
  };
  
  # Install extra packages here
  home.packages = with pkgs; [
  ];

  # We shouldn't change this ever; it's for backwards compatibility
  home.stateVersion = "23.11";

}
