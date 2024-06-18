{
  inputs,
  pkgs,
  ...
}: {
  imports = [
    inputs.sops-nix.nixosModules.sops
  ];

  sops = {
    defaultSopsFile = ../../secrets.yaml;
    validateSopsFiles = false;

    age = {
      # Automatically import host ssh keys as age keys
      sshKeyPaths = ["/etc/ssh/ssh_host_ed25519_key"];
      # Use an age key expected to already be in the filesystem
      keyFile = "/var/lib/sops-nix/key.txt";
      # Generate a new key if the key specified above doesn't exist
      generateKey = true;
    };

    # These secrets will be output to /run/secrets
    secrets = {
      "smtp/rdg-gmail" = {};
    };
  };

  environment.systemPackages = with pkgs; [
    age # Modern encryption tool
    sops # To access and edit encryped secrets file
  ];
}
