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
  services.xserver.videoDrivers = [ "modesetting" ];
  environment.sessionVariables = {
    LIBVA_DRIVER_NAME = "iHD";     # Prefer the modern iHD backend
  };
  hardware.graphics = {
    enable = true;
    extraPackages = with pkgs; [
      intel-media-driver
      vpl-gpu-rt
    ];
  };
  environment.systemPackages = [
    pkgs.spotify
  ];
  programs = {
    seahorse.enable = true;
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
  swapDevices = [{
    device = "/swapfile";
    size = 32 * 1024; # 16GB
  }];
}
