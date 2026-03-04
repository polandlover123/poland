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
    package = pkgs.niri-unstable;
  };
}
