{
  description = "Akzel nixos config yuhh";
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    rose-pine-hyprcursor.url = "github:ndom91/rose-pine-hyprcursor";
  };

  outputs = { self, nixpkgs, ...} @inputs:
  {
    nixosConfigurations = {
      Hisoka = nixpkgs.lib.nixosSystem {
        specialArgs = { inherit inputs; };
        system = "x86_64-linux";
        modules = [ 
          ./mods/gamer.nix
	  ./mods/hackerman.nix
          ./mods/configuration.nix	
          ./mods/hw-hisoka.nix
          {
            networking.hostName = "Hisoka";
          } 
        ];
      };

      Killua = nixpkgs.lib.nixosSystem {
        specialArgs = { inherit inputs; };
        system = "x86_64-linux";
        modules = [ 
          ./mods/configuration.nix
	  ./mods/hackerman.nix
      	  ./mods/hw-killua.nix
	  {
            networking.hostName = "Killua";
          }
        ];
      };
    };
  };
}

