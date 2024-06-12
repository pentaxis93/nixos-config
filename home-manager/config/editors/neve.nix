{
  pkgs,
  inputs,
  ...
}: {
  home.packages = with pkgs; [
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
}
