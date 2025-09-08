{
  imports = [
    ./nix
    ./desktop
    ./security
    ./services
    ./users.nix
  ];
  services.fwupd.enable = true;
}
