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
  programs = {
    seahorse.enable = true;
    ssh.startAgent = true;
  };
  programs.steam.enable = true;
  networking.hostName = "amg";
  home-manager = {
    backupFileExtension = ".hmbak";
    users."admin" = import ../../home/homes/amg;
    extraSpecialArgs = {
      inherit inputs;
      inherit self;
    };
  };
}
