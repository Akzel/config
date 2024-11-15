{pkgs, ...}: {
  hardware = {
    graphics.enable = true;
  };

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
