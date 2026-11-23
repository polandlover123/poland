{
  imports = [
    ./gtk.nix
    ./fonts.nix
    ./easyeffects
  ];
  services.mpris-proxy.enable = true;
}
