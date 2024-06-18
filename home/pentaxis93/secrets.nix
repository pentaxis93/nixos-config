{inputs, ...}: {
  imports = [
    inputs.sops-nix.homeManagerModules.sops
  ];

  sops = {
    # This is the pentaxis93 key and needs to have been copied to this location on the host
    age.keyFile = "/home/pentaxis93/.config/sops/age/keys.txt";

    defaultSopsFile = ../../secrets.yaml;
    validateSopsFiles = false;

    secrets = {
      "private_keys/pentaxis93" = {
        path = "/home/pentaxis93/.ssh/id_ed25519";
      };
    };
  };
}
