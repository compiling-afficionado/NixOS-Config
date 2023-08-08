# To rebuild: sudo nixos-rebuild switch --flake .#laptop

{
  description = "My system configuration and home manager";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-23.05";
    home-manager = {
      url = "github:nix-community/home-manager/release-23.05";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { self, nixpkgs, home-manager }:
  let 
    system = "x86_64-linux";

    host = "laptop"; # Change this for new host configuration
    desktop_environment = "gnome"; # Change this for new DE configuration

    pkgs = import nixpkgs {
      inherit system;
      config.allowUnfree = true;
    };
  in {

    # need to supply nixosConfigurations
    # for system configuration
    nixosConfigurations = {
      laptop = nixpkgs.lib.nixosSystem {
        inherit system;
        
        # TODO: is this the best way to pass variables to modules? How does specialArgs work?
        specialArgs = { inherit desktop_environment host; };
        modules = [
          ./configuration.nix
          
          home-manager.nixosModules.home-manager {
            home-manager.extraSpecialArgs = { inherit desktop_environment host; };
            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;
            home-manager.users.michael = {
              imports = [ ./home.nix ];
            };
          }
        ];
      };
    };
  };
}
