{pkgs, ...}: {
  environment.systemPackages = with pkgs; [
    python312 # Python programming language
    black # Python formatter
  ];
}
