{pkgs, ...}: {
  environment.systemPackages = with pkgs; [
    python3 # Python programming language
    black # Python formatter
  ];
}
