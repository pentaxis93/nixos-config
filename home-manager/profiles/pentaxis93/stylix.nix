{pkgs, ...}: {
  stylix = {
    base16Scheme = "${pkgs.base16-schemes}/share/themes/gruvbox-dark-medium.yaml";
    # image = /home/pentaxis93/Angel_Images/ClearLight.jpg;
    polarity = "dark";
    fonts = {
      sizes = {
        applications = 12;
        terminal = 24;
        desktop = 12;
        popups = 12;
      };
    };
  };
}
