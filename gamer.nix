{ config, lib, pkgs, inputs, ... }:
{

environment.systemPackages = with pkgs; [
	mpv
	obs-studio
	egl-wayland
];
# services.xserver.videoDrivers = ["nvidia"];
	programs = {
		steam = {
			enable = true;
		};
	};
}
