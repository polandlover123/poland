{
  imports = [
    ./nix
    ./desktop
    ./security
    ./services
    ./boot
    ./users.nix
  ];
  services.power-profiles-daemon.enable = true;
  services.flatpak.enable = true;
  services.fwupd.enable = true;
  services.avahi = {
    enable = true;
    nssmdns4 = true; # printing
    publish = {
      enable = true;
      addresses = true;
      workstation = true;
      userServices = true;
    };
  };
  networking.firewall = {
    enable = true;

    allowedTCPPortRanges = [
      {
        from = 30000;
        to = 60000;
      }
    ];
    allowedUDPPortRanges = [
      {
        from = 30000;
        to = 60000;
      }
    ];
  };
}
