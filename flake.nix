{
  description = "Nixos config flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

     home-manager = {
       url = "github:nix-community/home-manager";
       inputs.nixpkgs.follows = "nixpkgs";
     };
  };

  outputs = { self, nixpkgs, ... }@inputs: {
    nixosConfigurations.default = nixpkgs.lib.nixosSystem {
      	specialArgs = { inherit inputs; 
		pkgs = import nixpkgs { system = "x86_64-linux"; config.allowUnfree = true;
		};
	};
	 modules = [
        ./configuration.nix
         inputs.home-manager.nixosModules.default
      ];
    };
  };
}
