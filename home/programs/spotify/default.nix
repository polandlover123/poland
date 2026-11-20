{
  pkgs,
  inputs,
  ...
}: {
  # imports = [
  #   inputs.spicetify.homeManagerModules.default
  # ];
  # programs.spicetify = {
  #   enable = true;
  # };
  home.packages = [
    pkgs.spotify
  ];
}
