{pkgs, ...}: {
  stylix = {
    base16Scheme = "${pkgs.base16-schemes}/share/themes/solarized-dark.yaml";
    image = pkgs.fetchurl {
      url = "https://www.pixelstalk.net/wp-content/uploads/2016/05/Epic-Anime-Awesome-Wallpapers.jpg";
      sha256 = "enQo3wqhgf0FEPHj2coOCvo7DuZv+x5rL/WIo4qPI50=";
    };
    polarity = "dark";
    fonts = {
      sizes = {
        applications = 12;
        terminal = 20;
        desktop = 12;
        popups = 12;
      };
    };
    cursor = {
      package = pkgs.bibata-cursors;
      name = "Bibata-Original-Classic";
    };
  };
}
