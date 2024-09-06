{ pkgs,  ... }:
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

		nil
		lua-language-server
		stylua
		luajitPackages.luacheck
	];
	users.users.axel.shell = pkgs.zsh;
	programs = {
		zsh = { 
			enable = true;
		};
	};
}
