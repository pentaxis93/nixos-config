{config, ...}: {
  # Decrypt password as hash before user is logged in
  sops.secrets."account-passwords/mark".neededForUsers = true;
  # Required for sops to work; password can be set only by sops
  users.mutableUsers = false;

  users.users.mark = {
    extraGroups = ["networkmanager" "wheel"];
    isNormalUser = true;
    hashedPasswordFile = config.sops.secrets."account-passwords/mark".path;
  };
}
