{

    description = "Abelc's Flake";

    inputs ={
        nixpkgs.url = "nixpkgs/nixos-unstable";
        home-manager.url = "github:nix-community/home-manager/master";
        home-manager.inputs.nixpkgs.follows = "nixpkgs";

        nix-colors.url = "github:misterio77/nix-colors";
    };

    outputs = { self, nixpkgs, home-manager, ...}@inputs:
    let
	    # ---- SYSTEM SETTINGS ---- #
        system = "x86_64-linux"; # system arch
        hostname = "Camion-pizza-DGSE"; # hostname
        profile = "master"; # select a profile
        timezone = "Asia/Jakarta"; # select timezone
        locale = "en_US.UTF-8"; # select locale
	    username = "abelc";

        theme = "everforest";

	   # ------ OTHER STUFF ------- #
        lib = nixpkgs.lib;
        pkgs = nixpkgs.legacyPackages.${system};

    in {
        nixosConfigurations = {
            system = lib.nixosSystem {
                inherit system;
                modules = [ ./profiles/${profile}/configuration.nix ];
                specialArgs = { 
		            inherit hostname;
		            inherit locale;
		            inherit timezone;
		            inherit username;
                };
            };
        };

        homeConfigurations = {
            user = home-manager.lib.homeManagerConfiguration {
                extraSpecialArgs = { 
                    inherit inputs;
                    inherit username;
                    inherit theme;
                    };
                inherit pkgs;
                modules = [ ./profiles/${profile}/home.nix ];
            };
        };

    };

}
