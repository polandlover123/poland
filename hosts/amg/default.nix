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
  hardware.graphics = {
    enable = true;
    extraPackages = with pkgs; [
      intel-media-driver # Enable Hardware Acceleration
    ];
  };
  environment.systemPackages = [
    pkgs.spotify
  ];
  programs = {
    seahorse.enable = true;
    ssh.startAgent = true;
  };
  services.upower.enable = true;
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
