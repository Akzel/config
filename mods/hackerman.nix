{ config, lib, pkgs, inputs, ... }:
{
	environment.systemPackages = with pkgs; [
		kitty
		git
		gh
		neovim
	];
	programs = {
	};
}
