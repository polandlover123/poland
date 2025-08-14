{
  imports = [
    ./nix
    ./desktop
    ./security
  ];
  services.fwupd.enable = true;
}
