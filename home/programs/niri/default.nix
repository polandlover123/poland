{
  pkgs,
  inputs,
  ...
}: {
  imports = [
    inputs.dms.homeModules.dank-material-shell
  ];
  programs.dank-material-shell = {
    enable = true;
    systemd.enable = true;
  };
  home.packages = [
    pkgs.xwayland-satellite
    inputs.niri-scratchpad-flake.packages.${pkgs.system}.niri-scratchpad
  ];
}
