{pkgs, ...}: {
  services.blueman.enable = true;
  hardware.bluetooth = {
    enable = true;
    settings = {
      General = {
        Experimental = true;
      };
    };
  };

  systemd.user.services.telephony_client.enable = false;
}