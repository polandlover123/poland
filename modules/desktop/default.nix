{
  inputs,
  pkgs,
  ...
}: {
  imports = [inputs.hyprland.nixosModules.default];
  environment.systemPackages = [pkgs.kitty];
  environment.sessionVariables.NIXOS_OZONE_WL = "1";
  # enable hyprland and required options
  programs.hyprland = {
    package = inputs.hyprland.packages.${pkgs.system}.hyprland;
    portalPackage =
      inputs.hyprland.packages.${pkgs.system}.xdg-desktop-portal-hyprland;
    enable = true;
  };
}
