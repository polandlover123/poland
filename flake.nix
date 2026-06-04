{
  description = "poland";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    niri-scratchpad-flake = {
      url = "github:gvolpe/niri-scratchpad";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    niri.url = "github:sodiboo/niri-flake";
    spicetify.url = "github:gerg-l/spicetify-nix";
    determinate.url = "https://flakehub.com/f/DeterminateSystems/determinate/*";
    dms = {
      url = "github:AvengeMedia/DankMaterialShell/stable";
      inputs.nixpkgs.follows = "nixpkgs";
    };
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
          determinate.nixosModules.default
          ./configuration.nix
          ./hosts/amg/default.nix
          # determinate.nixosModules.default
        ];
      };
    };
  };
}
