{ config, lib, pkgs, inputs, ... } : { 
nixpkgs.config.allowUnfree = true; nix.settings.experimental-features = "nix-command flakes";  networking.networkmanager.enable = true; boot.loader.systemd-boot.enable = true;boot.loader.efi.canTouchEfiVariables = true; security.polkit.enable = true;
	hardware.bluetooth.enable = true; 
	hardware.bluetooth.powerOnBoot = true;
	services.pipewire = { enable = true; pulse.enable = true;};
	services.greetd = {
		enable = true;
		settings = {
			default_session = {
				command = "${pkgs.greetd.tuigreet}/bin/tuigreet --time --remember --cmd Hyprland";
				user = "greeter";
			};
		};
	};


	programs.hyprland = {
		enable = true;
		xwayland.enable = true;
	}


time.timeZone = "Europe/Amsterdam";

services.gnome.gnome-keyring.enable = true; # fauwefojawioefjw was it this?? 
	users.users.axel = { isNormalUser = true; extraGroups = ["wheel" "networkmanager" "audio" "video"];
	};

	security.sudo.wheelNeedsPassword = false;
	environment.systemPackages = with pkgs ; [
		qutebrowser
		firefox
		gnumake
		stow
		dunst
		spotify
		ncspot
		neofetch
		bitwarden
		wofi
		hyprpaper
		waybar
		rustup
		coppwr
		zoom-us
gpu-screen-recorder
hyprpicker
btop
networkmanager
wl-clipboard

	];
	system.stateVersion = "24.11"; # Did you read the comment?
				     }
