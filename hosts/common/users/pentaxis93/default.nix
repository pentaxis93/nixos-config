{...}: {
  users.users.pentaxis93 = {
    extraGroups = ["networkmanager" "wheel" "sudo"];
    isNormalUser = true;
    initialPassword = "password";

    openssh.authorizedKeys.keys = [
      (builtins.readFile ./keys/id_ed25519.pub)
    ];
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
