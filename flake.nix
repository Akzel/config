{
  description = "Akzel nixos config yuhh";
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
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
          ./hwcfgs/hw-hisoka.nix
          {
            networking.hostName = "Hisoka";
          } 
        ];
      };

      Killua = nixpkgs.lib.nixosSystem {
        specialArgs = { inherit inputs; };
        system = "x86_64-linux";
        modules = [ 
          ./mods/hackerman.nix
          ./mods/configuration.nix
          ./hwcfgs/hw-killua.nix
          {
            networking.hostName = "Killua";
          }
        ];
      };
    };
  };
}

