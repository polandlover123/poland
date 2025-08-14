{
  description = "poland";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nh = {
      url = "github:viperml/nh";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    hyprland = {
      type = "git";
      url = "https://github.com/hyprwm/hyprland";
      ref = "refs/tags/v0.48.1";
      submodules = true;
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = {
    self,
    nixpkgs,
    ...
  } @ inputs: let
    pkgs = import nixpkgs {
      system = "x86_64-linux";
      overlays = [
        (import ./overlays/default.nix)
      ];
    };
  in {
    nixosConfigurations = {
      amg = nixpkgs.lib.nixosSystem {
        specialArgs = {inherit self inputs;};
        modules = [
          ./configuration.nix
          ./hosts/amg/default.nix
        ];
      };
    };
    packages.x86_64-linux = {
      default = self.packages.${pkgs.system}.mactahoe-icons;
      mactahoe-icons = pkgs.mactahoe-icons;
      mactahoe-theme = pkgs.mactahoe-theme;
    };
  };
}
