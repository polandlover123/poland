{
  pkgs,
  inputs,
  ...
}: {
  imports = [
    inputs.dms.homeModules.dank-material-shell
    inputs.dfiles.homeModules.dux-files
    inputs.dsearch.homeModules.dsearch
  ];
  programs = {
    dank-material-shell = {
      enable = true;
      enableSystemMonitoring = true;
      systemd.enable = true;
    };
    dsearch.enable = true;
    dux-files = {
      enable = true;
      systemd = {
        enable = true;
        target = "graphical-session.target";
        restartIfChanged = true;
      };
      portal = {
        enable = true;
        preferred = true;
        desktop = "niri";
      };
    };
  };

  home.packages = [
    pkgs.xwayland-satellite
    inputs.niri-scratchpad-flake.packages.${pkgs.system}.default
  ];
}
