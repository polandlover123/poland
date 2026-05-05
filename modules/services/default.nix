{
  imports = [
    ./bluetooth
    ./ssh
  ];
  services.fwupd.enable = true;
  services.logind.settings.Login.HandleLidSwitch = "sleep";
}
