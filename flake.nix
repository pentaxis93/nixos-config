{
  description = "Flake of pentaxis93 + CatsAreCuteAndFast";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-24.05";

    home-manager = {
      url = "github:nix-community/home-manager/release-24.05";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    neve.url = "github:pentaxis93/Neve";
    # neve.url = "github:redyf/Neve";

    stylix.url = "github:danth/stylix";
  };

  outputs = {
    self,
    nixpkgs,
    home-manager,
    ...
  } @ inputs: let
    inherit (self) outputs;
  in {
    nixosConfigurations = {
      hedwig = nixpkgs.lib.nixosSystem {
        specialArgs = {inherit inputs outputs;};
        modules = [
          ./nixos/hosts/hedwig/configuration.nix
          # inputs.stylix.nixosModules.stylix
          home-manager.nixosModules.home-manager
          {
            home-manager.useUserPackages = true;
            home-manager.backupFileExtension = "backup";
            home-manager.users.mark = import ./home-manager/profiles/mark/home.nix;
            home-manager.users.pentaxis93 = import ./home-manager/profiles/pentaxis93/home.nix;
          }
        ];
      };

      oreb = nixpkgs.lib.nixosSystem {
        specialArgs = {inherit inputs outputs;};
        modules = [
          ./nixos/hosts/oreb/configuration.nix
          # inputs.stylix.nixosModules.stylix
          home-manager.nixosModules.home-manager
          {
            home-manager.useUserPackages = true;
            home-manager.backupFileExtension = "backup";
            home-manager.users.pentaxis93 = import ./home-manager/profiles/pentaxis93/home.nix;
          }
        ];
      };
    };
  };
}
