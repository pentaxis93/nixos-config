{config, ...}: {
  users.users.meli = {
    extraGroups = ["networkmanager" "wheel"];
    isNormalUser = true;
    initialPassword = "password";
  };
}
