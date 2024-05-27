{pkgs, ...}: {
  programs.git = {
    userName = "CatsAreCuteAndFast";
    userEmail = "132775888+CatsAreCuteAndFast@users.noreply.github.com";
    extraConfig = {
      init.defaultBranch = "main";
    };
  };
}
