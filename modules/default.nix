{
  imports = [
    ./nix
    ./desktop
    ./security
    ./services
    ./users.nix
  ];
  services.fwupd.enable = true;
  services.avahi = {
    enable = true;
    nssmdns = true; # printing
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
