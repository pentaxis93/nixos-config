{
  config,
  inputs,
  ...
}: {
  # Decrypt password as hash before user is logged in
  sops.secrets.pentaxis93-password.neededForUsers = true;
  # Required for sops to work; password can be set only by sops
  users.mutableUsers = false;

  users.users.pentaxis93 = {
    extraGroups = ["networkmanager" "wheel" "sudo"];
    isNormalUser = true;
    hashedPasswordFile = config.sops.secrets.pentaxis93-password.path;
    # openssh.authorizedKeys.keys = [
    # TODO: Add your SSH public key(s) here, if you plan on using SSH to connect
    # ];
  };

  # This setups a SSH server. Very important if you're setting up a headless system.
  # Feel free to remove if you don't need it.
  # services.openssh = {
  #   enable = true;
  #   settings = {
  # Opinionated: forbid root login through SSH.
  #     PermitRootLogin = "no";
  # Opinionated: use keys only.
  # Remove if you want to SSH using passwords
  #     PasswordAuthentication = false;
  #   };
  # };
}
