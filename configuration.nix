{ config, lib, pkgs, inputs, ... } : { imports = [ ./hardware-configuration.nix ]; nixpkgs.config.allowUnfree = true; nix.settings.experimental-features = "nix-command flakes";  networking.networkmanager.enable = true; boot.loader.systemd-boot.enable = true;boot.loader.efi.canTouchEfiVariables = true; security.polkit.enable = true;
	networking.hostName = "Hisoka";
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


	programs.hyprland.enable = true;



services.gnome.gnome-keyring.enable = true; # fauwefojawioefjw was it this?? 
	users.users.axel = { isNormalUser = true; extraGroups = ["wheel" "networkmanager" "audio" "video"];
	};

	environment.systemPackages = with pkgs ; [
		kitty
			git
			qutebrowser
			firefox
			gnumake
			stow
			neovim
			dunst
			htop
			neofetch
			bitwarden
			wofi
			hyprpaper
			hyprcursor
			inputs.rose-pine-hyprcursor.packages.${pkgs.system}.default
	];
	system.stateVersion = "24.11"; # Did you read the comment?
				     }
