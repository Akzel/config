{pkgs, ...}: {
  fonts.packages = with pkgs; [
    nerdfonts
  ];

  environment.systemPackages = with pkgs; [
    kitty
    git
    lazygit
    gh
    neovim
    unzip
    gcc
    ripgrep
    fd
    tealdeer

    alejandra

    lua
    nil
    luarocks
    lua-language-server
    stylua
    luajitPackages.luacheck
  ];
  users.users.axel.shell = pkgs.zsh;
  programs = {
    zsh = {
      enable = true;
    };
  };
}
