{self, ...}: {
  nixpkgs = {
    hostPlatform = "x86_64-linux";
    overlays = [
      (import ../../overlays/default.nix)
    ];
    config.allowUnfree = true;
    config.allowUnfreePredicate = _: true;
  };
}
