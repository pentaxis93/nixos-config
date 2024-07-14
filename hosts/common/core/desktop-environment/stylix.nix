{pkgs, ...}: {
  stylix = {
    enable = true;
    base16Scheme = "${pkgs.base16-schemes}/share/themes/dracula.yaml";
    image = pkgs.fetchurl {
      url = "https://wallpapersmug.com/download/3840x2400/781f69/fantasy-flying-city-dark-art.jpg";
      sha256 = "11e9f9158a00129d779dcc4b9d90bf76e848f4c4edccac881a039be2e875bf36";
    };
    polarity = "dark";
    fonts = {
      sizes = {
        applications = 14;
        terminal = 22;
        desktop = 14;
        popups = 14;
      };
    };
    cursor = {
      package = pkgs.bibata-cursors;
      name = "Bibata-Original-Classic";
    };
  };
}
