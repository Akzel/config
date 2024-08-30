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
          ./gamer.nix
          ./configuration.nix	
          ./hw-hisoka.nix
          {
            networking.hostName = "Hisoka";
          } 
        ];
      };

      Killua = nixpkgs.lib.nixosSystem {
        specialArgs = { inherit inputs; };
        system = "x86_64-linux";
        modules = [ 
          ./configuration.nix
      	  ./hw-killua.nix
	  {
            networking.hostName = "Killua";
          }
        ];
      };
    };
  };
}

