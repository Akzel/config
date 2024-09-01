{ config, lib, pkgs, inputs, ... }:
{


	fonts.packages = with pkgs; [
		nerdfonts
	];

	environment.systemPackages = with pkgs; [
		kitty
		git
		lazygit
		gh
		neovim
		unzip
		gcc
		ripgrep
		fd
		oh-my-zsh
		tealdeer
	];
	users.users.axel.shell = pkgs.zsh;
	programs = {
		zsh = { 
			enable = true;
		};
	};
}
