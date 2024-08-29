{ config, lib, pkgs, ... } : { imports = [ ./hardware-configuration.nix ]; nixpkgs.config.allowUnfree = true; nix.settings.experimental-features = 
	"nix-command flakes"; networking.hostName = "Hisoka"; networking.networkmanager.enable = true; boot.loader.systemd-boot.enable = true; 
	boot.loader.efi.canTouchEfiVariables = true; security.polkit.enable = true;

#"caps:swapescape";

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


	time.timeZone = "Europe/Amsterdam"; i18n.defaultLocale = "en_US.UTF-8"; i18n.extraLocaleSettings = { LC_ADDRESS = "nl_NL.UTF-8"; 
		LC_IDENTIFICATION = "nl_NL.UTF-8"; LC_MEASUREMENT = "nl_NL.UTF-8"; LC_MONETARY = "nl_NL.UTF-8"; LC_NAME = "nl_NL.UTF-8"; LC_NUMERIC = 
			"nl_NL.UTF-8"; LC_PAPER = "nl_NL.UTF-8"; LC_TELEPHONE = "nl_NL.UTF-8"; LC_TIME = "nl_NL.UTF-8";
	};

#services.gnome.gnome-keyring.enable = true; 
	users.users.axel = { isNormalUser = true; extraGroups = ["wheel" "networkmanager"];
	};

	environment.systemPackages = with pkgs ; [
		kitty
		git
		qutebrowser
		gnumake
		neovim
		htop
		neofetch	
		hyprpaper
	];
	system.stateVersion = "24.11"; # Did you read the comment?
			     }
