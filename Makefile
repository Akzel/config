.PHONY: hisoka
hisoka:
	sudo nixos-rebuild switch --flake .#Hisoka

.PHONY: killua
hisoka:
	sudo nixos-rebuild switch --flake .#Killua

.PHONY: clean
clean:
	nix-collect-garbage -d
