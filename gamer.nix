{ config, lib, pkgs, inputs, ... }:
{
	hardware.graphics.enable =true;
	services.xserver.videoDrivers = [ "nvidia" ];
	hardware.nvidia = {
		modesetting.enable = true;
		nvidiaSettings = true;
		open = false;    
		# Fine-grained power management. Turns off GPU when not in use.
		# Experimental and only works on modern Nvidia GPUs (Turing or newer).
		powerManagement.finegrained = false;
	};

	environment.systemPackages = with pkgs; [
		mpv
		obs-studio
		egl-wayland
		libva
	];
	programs = {
		steam = {
			enable = true;
		};
	};
}
