{config, ...}: {
  users.users.mark = {
    extraGroups = ["networkmanager" "wheel"];
    isNormalUser = true;
    initialPassword = "password";
  };
}
