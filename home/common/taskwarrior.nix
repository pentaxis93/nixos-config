{pkgs, ...}: {
  programs.taskwarrior = {
    enable = true;
  };

  home.packages = with pkgs; [
    vit # Visual interactive taskwarrior
  ];
}
