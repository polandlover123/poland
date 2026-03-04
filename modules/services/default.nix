{
  imports = [
    ./bluetooth
    ./ssh
  ];
  services.fwupd.enable = true;
  services.logind.lidSwitch = "sleep";
}
