{
  inputs,
  self,
  pkgs,
  ...
}: {
  imports = [
    ./hardware-configuration.nix
    inputs.home-manager.nixosModules.default
    ../../modules
  ];
  environment.systemPackages = [
    pkgs.spotify
  ];
  networking.hostName = "amg";
  home-manager = {
    users."admin" = import ../../home/homes/amg;
    extraSpecialArgs = {
      inherit inputs;
      inherit self;
    };
  };
}
