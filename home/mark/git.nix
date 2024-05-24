{ ... }:

{
  programs.git = {
    enable = true;
    # userName = userSettings.mark.username;
    # userEmail = userSettings.mark.gitHubNoReplyEmail;
    extraConfig = {
      init.defaultBranch = "main";
    };
  };
}
