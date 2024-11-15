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
  networking.firewall = { 
    enable = true;
    allowedTCPPortRanges = [ 
      { from = 1714; to = 1764; } # KDE Connect
    ];  
    allowedUDPPortRanges = [ 
      { from = 1714; to = 1764; } # KDE Connect
    ];  
  };
}
