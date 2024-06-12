{pkgs, ...}: {
  programs.hexchat = {
    enable = true;
    channels = {
      irchighway = {
        autojoin = [
          "#ebooks"
        ];
        charset = "UTF-8 (Unicode)";
        nickname = "zazie";
        nickname2 = "blackie";
        options = {
          acceptInvalidSSLCertificates = false;
          autoconnect = true;
          bypassProxy = true;
          connectToSelectedServerOnly = true;
          useGlobalUserInformation = false;
          forceSSL = false;
        };
        servers = [
          "irc.irchighway.net"
        ];
        userName = "heisenberg";
      };
    };
    theme = pkgs.fetchzip {
      url = "https://dl.hexchat.net/themes/Monokai.hct#Monokai.zip";
      sha256 = "sha256-WCdgEr8PwKSZvBMs0fN7E2gOjNM0c2DscZGSKSmdID0=";
      stripRoot = false;
    };
  };
}
