{
  description = "Flake of pentaxis93 + CatsAreCuteAndFast";

  inputs = {
    # Nixpkgs
    nixpkgs.url = "github:nixos/nixpkgs/nixos-24.05";

    # Home manager
    home-manager = {
      url = "github:nix-community/home-manager/release-24.05";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    # Neve
    neve.url = "github:pentaxis93/Neve";
  };

  outputs = {
    self,
    nixpkgs,
    home-manager,
    neve,
    ...
  } @ inputs: let
    inherit (self) outputs;
  in {
    nixosConfigurations = {
      hedwig = nixpkgs.lib.nixosSystem {
        specialArgs = {inherit inputs outputs;};
        modules = [
          ./nixos/configuration.hedwig.nix
          home-manager.nixosModules.home-manager
          {
            home-manager.useUserPackages = true;
            home-manager.backupFileExtension = "backup";
            home-manager.users.mark = import ./home-manager/home.mark.nix;
            home-manager.users.pentaxis93 = import ./home-manager/home.pentaxis93.nix;
          }
        ];
      };

      oreb = nixpkgs.lib.nixosSystem {
        specialArgs = {inherit inputs outputs;};
        modules = [
          ./nixos/configuration.oreb.nix
          home-manager.nixosModules.home-manager
          {
            home-manager.useUserPackages = true;
            home-manager.backupFileExtension = "backup";
            home-manager.users.pentaxis93 = import ./home-manager/home.pentaxis93.nix;
          }
        ];
      };
    };
  };
}
