{
	description = "Akzel nixos config yuhh";
	inputs = {
		nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
	};
	outputs = { self, nixpkgs, ...} : {
  		nixosConfigurations.Hisoka = nixpkgs.lib.nixosSystem {
			system = "x86_64-linux";
			modules = [
				self.realpath ./configuration.nix	
			];
		};
	};
}

