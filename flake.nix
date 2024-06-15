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
    stylix,
    ...
  } @ inputs: let
    inherit (self) outputs;
  in {
    nixosConfigurations = {
      hedwig = nixpkgs.lib.nixosSystem {
        modules = [
          ./hosts/hedwig/configuration.nix
          home-manager.nixosModules.home-manager
          {
            home-manager.useUserPackages = true;
            home-manager.backupFileExtension = "backup";
            home-manager.extraSpecialArgs = {inherit inputs;};
            home-manager.users.mark = import ./home/mark/home.nix;
            home-manager.users.pentaxis93 = import ./home/pentaxis93/home.nix;
          }
          inputs.stylix.nixosModules.stylix
        ];
        specialArgs = {inherit inputs outputs;};
      };

      oreb = nixpkgs.lib.nixosSystem {
        modules = [
          ./hosts/oreb/configuration.nix
          home-manager.nixosModules.home-manager
          {
            home-manager.useUserPackages = true;
            home-manager.backupFileExtension = "backup";
            home-manager.extraSpecialArgs = {inherit inputs;};
            home-manager.users.mark = import ./home/mark/home.nix;
            home-manager.users.pentaxis93 = import ./home/pentaxis93/home.nix;
          }
          stylix.nixosModules.stylix
        ];
        specialArgs = {inherit inputs outputs;};
      };
    };
  };
}
