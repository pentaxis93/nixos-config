{config, ...}: {
  # Decrypt password as hash before user is logged in
  sops.secrets.mark-password.neededForUsers = true;
  # Required for sops to work; password can be set only by sops
  users.mutableUsers = false;

  users.users.mark = {
    extraGroups = ["networkmanager" "wheel"];
    isNormalUser = true;
    hashedPasswordFile = config.sops.secrets.mark-password.path;
  };
}
