{pkgs, ...}: {
  services.blueman.enable = true;
  hardware.bluetooth = {
    enable = true;
    package = pkgs.bluez5-experimental;
    settings = {
      Policy = {
        AutoEnable = true;
      };
      General = {
        FastConnectable = true;
        Experimental = true;
        DeviceID = "bluetooth:004C:0000:0000";
      };
    };
  };

  systemd.user.services.telephony_client.enable = false;
}
