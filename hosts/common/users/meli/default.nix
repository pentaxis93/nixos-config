{config, ...}: {
  # Decrypt password as hash before user is logged in
  sops.secrets."account-passwords/meli".neededForUsers = true;
  # Required for sops to work; password can be set only by sops
  users.mutableUsers = false;

  users.users.meli = {
    extraGroups = ["networkmanager" "wheel"];
    isNormalUser = true;
    hashedPasswordFile = config.sops.secrets."account-passwords/meli".path;
  };
}
