{
  description = "Flake of pentaxis93 & mark";

  inputs = {
    # NixOS official package source, hopefully the most recent stable version
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { self, nixpkgs, home-manager, ... }@inputs: {
    nixosConfigurations.oreb = nixpkgs.lib.nixosSystem {
      system = "x86_64-linux";
      modules = [
        ./hosts/oreb/configuration.nix
	home-manager.nixosModules.home-manager
        {
          home-manager.useGlobalPkgs = true;
          home-manager.useUserPackages = true;
          home-manager.users.pentaxis93 = import ./home/pentaxis93/home.nix;
          home-manager.users.mark = import ./home/mark/home.nix;
        }
      ];
    };

    nixosConfigurations.hedwig = nixpkgs.lib.nixosSystem {
      system = "x86_64-linux";
      modules = [
        ./hosts/hedwig/configuration.nix
	home-manager.nixosModules.home-manager
        {
          home-manager.useGlobalPkgs = true;
          home-manager.useUserPackages = true;
          home-manager.users.pentaxis93 = import ./home/pentaxis93/home.nix;
          home-manager.users.mark = import ./home/mark/home.nix;
        }
      ];
    };
  };
}
