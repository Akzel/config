{pkgs, ...}: {
  fonts.packages = with pkgs; [
    nerdfonts
  ];

  environment.systemPackages = with pkgs; [
    kitty
    arp-scan
    git
    bash-language-server
    lazygit
    gh
    neovim
    unzip
    gcc
    ripgrep
    fd
    tealdeer
    android-tools

    alejandra

    rustc
    cargo
    rust-analyzer
    pkg-config
    openssl

    lua
    nil
    luarocks
    lua-language-server
    stylua
    luajitPackages.luacheck
    marksman
    taplo
  ];
  users.users.axel.shell = pkgs.fish;
  programs = {
    fish = {
      enable = true;
    };
  };
             }
