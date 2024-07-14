{
  description = "Flake of pentaxis93 + CatsAreCuteAndFast";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-24.05";

    home-manager = {
      url = "github:nix-community/home-manager/release-24.05";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    # Neovim configuration
    neve.url = "github:pentaxis93/Neve";

    # Secrets management
    sops-nix = {
      url = "github:mic92/sops-nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    # System-wide themes
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
            home-manager = {
              useUserPackages = true;
              backupFileExtension = "backup";
              extraSpecialArgs = {inherit inputs;};
              users = {
                mark = import ./home/mark/home.nix;
                # pentaxis93 = import ./home/pentaxis93/home.nix;
              };
            };
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
            home-manager = {
              useUserPackages = true;
              backupFileExtension = "backup";
              extraSpecialArgs = {inherit inputs;};
              users = {
                mark = import ./home/mark/home.nix;
                pentaxis93 = import ./home/pentaxis93/home.nix;
              };
            };
          }
          stylix.nixosModules.stylix
        ];
        specialArgs = {inherit inputs outputs;};
      };
    };
  };
}
