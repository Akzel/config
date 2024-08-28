.PHONY: update
switch:
	nixos-rebuild --flake switch .#Hisoka

.PHONY: clean
clean:
	nix-collect-garbage -d

.PHONY: build
update:
	nixos-rebuild build --flake .#Hisoka
