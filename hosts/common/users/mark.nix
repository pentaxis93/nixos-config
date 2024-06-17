{...}: {
  users.users.mark = {
    extraGroups = ["networkmanager" "wheel"];
    initialPassword = "password";
    isNormalUser = true;
  };
}
