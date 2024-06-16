{pkgs, ...}: {
  programs.ranger = {
    enable = true;
  };

  home.packages = with pkgs; [
    file # for determining file types
    libcaca # for ASCII-art image previews
    imagemagick # for image previews
    librsvg # for SVG image previews
    ffmpeg # for video thumbnails
    highlight # for syntax highlighting of code
    atool # to preview archives
    poppler_utils # for PDF previews
    mediainfo # for viewing information about media files
    jq # for JSON files
  ];
}
