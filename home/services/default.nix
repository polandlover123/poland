{
  imports = [
    ./gtk.nix
    ./polkit.nix
    ./printing.nix
    ./fonts.nix
  ];
  services.mpris-proxy.enable = true;
}