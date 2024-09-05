{ config, lib, pkgs, inputs, ... }:
{
	hardware.graphics.enable = true;
	services.xserver.videoDrivers = [ "nvidia" ];
	hardware.nvidia = {
		modesetting.enable = true;
		nvidiaSettings = true;
		open = false;    
		powerManagement.finegrained = false;
	};

	environment.systemPackages = with pkgs; [
		efibootmgr
		mpv
		discord
		obs-studio
		egl-wayland
	];
	programs = {
		steam = {
			enable = true;
		};
		kdeconnect = {
			enable = true;
	};
};
}
