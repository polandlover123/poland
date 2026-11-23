{
  description = "poland";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    apple-fonts = {
      url = "github:lyndeno/apple-fonts.nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    niri-scratchpad-flake = {
      url = "github:gvolpe/niri-scratchpad";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    niri.url = "github:epireyn/niri-flake";
    spicetify.url = "github:gerg-l/spicetify-nix";
    determinate.url = "https://flakehub.com/f/DeterminateSystems/determinate/*";
    dms = {
      url = "github:duxlabs-dev/dux-shell/stable";
    };
    dfiles = {
      url = "github:duxlabs-dev/dux-files";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    dsearch = {
      url = "github:duxlabs-dev/dux-search";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nix-index-database.url = "github:nix-community/nix-index-database";
    nix-index-database.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs = {
    self,
    nixpkgs,
    determinate,
    ...
  } @ inputs: {
    nixosConfigurations = {
      dingus = nixpkgs.lib.nixosSystem {
        specialArgs = {inherit self inputs;};
        modules = [
          determinate.nixosModules.default
          ./hosts/amg/default.nix
          # determinate.nixosModules.default
        ];
      };
    };
  };
}
