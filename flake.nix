{
  description = "poland";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    ags.url = "github:aylur/ags";
    astal.url = "github:aylur/astal";
    hyprland.url = "github:hyprwm/Hyprland";
    determinate.url = "https://flakehub.com/f/DeterminateSystems/determinate/*";
  };

  outputs = {
    self,
    nixpkgs,
    determinate,
    ...
  } @ inputs: {
    nixosConfigurations = {
      amg = nixpkgs.lib.nixosSystem {
        specialArgs = {inherit self inputs;};
        modules = [
          ./configuration.nix
          ./hosts/amg/default.nix
          determinate.nixosModules.default
        ];
      };
    };
  };
}
