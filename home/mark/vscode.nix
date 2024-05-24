{ pkgs, ... }:

{
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
}

