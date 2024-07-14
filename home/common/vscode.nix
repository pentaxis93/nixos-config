{pkgs, ...}: {
  programs.vscode = {
    enable = true;
    extensions = with pkgs.vscode-extensions; [
      # Theme and icons
      equinusocio.vsc-material-theme # Beautiful theme
      equinusocio.vsc-material-theme-icons # Icons to match the theme

      # Python support
      ms-python.python # Python support with linting, debugging, etc.
      ms-python.vscode-pylance # Python language server support

      # Development tools
      visualstudioexptteam.vscodeintellicode # AI-assisted coding
      wakatime.vscode-wakatime # Log your coding

      # Quality of life
      esbenp.prettier-vscode # Automatically formats your code
      christian-kohler.path-intellisense # Autocompletes filenames
    ];
  };
}
