{
  imports = [
    ./bluetooth
    ./ssh
    ./audio.nix
    ./printing.nix
  ];
  services.fwupd.enable = true;
  services.logind.settings.Login.HandleLidSwitch = "sleep";
}
