{pkgs, ...}: {
  imports = [
    ./nix
    ./desktop
    ./security
    ./services
    ./boot
    ./users.nix
  ];
  networking.networkmanager.enable = true;
  services.tailscale = {
    enable = true;
    useRoutingFeatures = "both";
  };
  services.power-profiles-daemon.enable = true;
  programs.librepods.enable = true;
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
      {
        from = 1714;
        to = 1764;
      }
    ];
    allowedUDPPortRanges = [
      {
        from = 30000;
        to = 60000;
      }
      {
        from = 1714;
        to = 1764;
      }
    ];
  };
}
