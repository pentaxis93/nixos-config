{ pkgs, ... }:

{
  programs.git = {
    enable = true;
    userName = "pentaxis93";
    userEmail = "13393192+pentaxis93@users.noreply.github.com";
    extraConfig = {
      init.defaultBranch = "main";
    };
  };
}
