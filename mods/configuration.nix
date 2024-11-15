{pkgs, ...}: {
  nixpkgs.config.allowUnfree = true;
  nix.settings.experimental-features = "nix-command flakes";
  networking.networkmanager.enable = true;
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;
  security.polkit.enable = true;
  hardware.bluetooth.enable = true;
  hardware.bluetooth.powerOnBoot = true;
  services.pipewire = {
    enable = true;
    pulse.enable = true;
  };
  services.greetd = {
    enable = true;
    settings = {
      default_session = {
        command = "${pkgs.greetd.tuigreet}/bin/tuigreet --time --remember --cmd sway";
        user = "greeter";
      };
    };
  };

  services.gnome.gnome-keyring.enable = true;

  programs.sway = {
    enable = true;
    wrapperFeatures.gtk = true;
  };

  time.timeZone = "Europe/Amsterdam";

  users.users.axel = {
    isNormalUser = true;
    extraGroups = ["wheel" "networkmanager" "audio" "video"];
  };

  security.sudo.wheelNeedsPassword = false;
  environment.systemPackages = with pkgs; [
    fzf
    firefox
    gnumake
    stow
    dunst
    spotify
    wofi
    rustup
    zoom-us
    gpu-screen-recorder
    btop
    networkmanager
    wl-clipboard
    bat
    i3status-rust

  ];
  system.stateVersion = "24.11"; # Did you read the comment?
}
