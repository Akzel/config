.PHONY: hisoka
hisoka:
	sudo nixos-rebuild switch --flake .#Hisoka

.PHONY: killua
killua:
	sudo nixos-rebuild switch --flake .#Killua

.PHONY: clean
clean:
	nix-collect-garbage -d
