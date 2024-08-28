.PHONY: switch
switch:
	nixos-rebuild switch --flake .#Hisoka

.PHONY: clean
clean:
	nix-collect-garbage -d

.PHONY: build
build:
	nixos-rebuild build --flake .#Hisoka
