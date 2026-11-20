{
  inputs,
  pkgs,
  ...
}: {
  imports = [
    inputs.niri.nixosModules.niri
  ];
  xdg.portal.extraPortals = [pkgs.xdg-desktop-portal-gtk];
  environment.sessionVariables.NIXOS_OZONE_WL = "1";
  nixpkgs.overlays = [inputs.niri.overlays.niri];
  programs.niri = {
    enable = true;
    package = pkgs.niri;
  };
  security.polkit.enable = true;
  services.displayManager.dms-greeter = {
    enable = true;
    compositor.name = "niri";
  };
  systemd.user.services.niri-flake-polkit.enable = false;
}
