{
	description = "Akzel nixos config yuhh";
	inputs = {
		nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
	};
	outputs = { self, nixpkgs, ...} @inputs: {
  		nixosConfigurations.Hisoka = nixpkgs.lib.nixosSystem {
		specialArgs = { inherit inputs; };
			system = "x86_64-linux";
			modules = [
				./configuration.nix	
			];
		};
	};
}

