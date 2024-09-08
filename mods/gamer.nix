{pkgs, ...}: {
  hardware = {
    graphics.enable = true;
    nvidia = {
      modesetting.enable = true;
      nvidiaSettings = true;
      open = false;
      powerManagement.finegrained = false;
    };
  };
  services.xserver.videoDrivers = ["nvidia"];

  environment.systemPackages = with pkgs; [
    efibootmgr
    mpv
    discord
    obs-studio
    egl-wayland
  ];
  programs.steam = {
    enable = true;
  };
  programs.kdeconnect = {
    enable = true;
  };
}
