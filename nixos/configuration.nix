# This is your system's configuration file.
# Use this to configure your system environment (it replaces /etc/nixos/configuration.nix)
{
  inputs,
  lib,
  config,
  pkgs,
  ...
}: {
  # You can import other NixOS modules here
  imports = [
    # If you want to use modules from other flakes (such as nixos-hardware):
    # inputs.hardware.nixosModules.common-cpu-amd
    # inputs.hardware.nixosModules.common-ssd

    # You can also split up your configuration and import pieces of it here:
    # ./users.nix

    # Import your generated (nixos-generate-config) hardware configuration
    ./hardware-configuration.nix
  ];

  nixpkgs = {
    # You can add overlays here
    overlays = [
      # If you want to use overlays exported from other flakes:
      # neovim-nightly-overlay.overlays.default

      # Or define it inline, for example:
      # (final: prev: {
      #   hi = final.hello.overrideAttrs (oldAttrs: {
      #     patches = [ ./change-hello-to-hi.patch ];
      #   });
      # })
    ];
    # Configure your nixpkgs instance
    config = {
      allowUnfree = true;
    };
  };

  nix = let flakeInputs = lib.filterAttrs (_: lib.isType "flake") inputs;
  in { settings = {
      experimental-features = "nix-command flakes";
      # Opinionated: disable global registry
      flake-registry = "";
      # Workaround for https://github.com/NixOS/nix/issues/9574
      nix-path = config.nix.nixPath;
    };
    # Opinionated: disable channels
    channel.enable = false;
    # Opinionated: make flake registry and nix path match flake inputs
    registry = lib.mapAttrs (_: flake: {inherit flake;}) flakeInputs;
    nixPath = lib.mapAttrsToList (n: _: "${n}=flake:${n}") flakeInputs;
  	};

  networking = {
  	hostName = "Hisoka";
	networkmanager.enable = true;
	  };

  boot.loader = {
	systemd-boot.enable = true;
	efi.canTouchEfiVariables = true;
	};

  time.timeZone = "Europe/Amsterdam";
  i18n = {
	defaultLocale = "en_US.UTF-8";
	extraLocaleSettings = {
    		LC_ADDRESS = "nl_NL.UTF-8";
		LC_IDENTIFICATION = "nl_NL.UTF-8";
    		LC_MEASUREMENT = "nl_NL.UTF-8";
	    	LC_MONETARY = "nl_NL.UTF-8";
	    	LC_NAME = "nl_NL.UTF-8";
	    	LC_NUMERIC = "nl_NL.UTF-8";
	    	LC_PAPER = "nl_NL.UTF-8";
    		LC_TELEPHONE = "nl_NL.UTF-8";
    		LC_TIME = "nl_NL.UTF-8";
  		};
#  services.gnome.gnome-keyring.enable = true;
  security.polkit.enable = true;
  users.users.axel = {
      description = "Axel";
      isNormalUser = true;
      extraGroups = ["wheel" "networkmanager" "audio" "video"];};
   
   programs = {
	git.enable = true;
	nvim.enable = true;
	sway = {
		enable = true;
		wrapperFeatures.gtk = true;
		};
	};

  environment.systemPackages = with pkgs [
	grim
	wl-clipboard
	mako
  ];

  # https://nixos.wiki/wiki/FAQ/When_do_I_update_stateVersion
  system.stateVersion = "24.05";
};
