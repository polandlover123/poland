{pkgs, ...}: {
  imports = [
    ./programs
    ./services
  ];
  home = {
    stateVersion = "25.05"; # Please read the comment before changing.
    username = "admin";
    homeDirectory = "/home/admin";
  };
  programs.home-manager.enable = true;

  nixpkgs = {
    overlays = [
      (import ../overlays/default.nix)
    ];
    config = {
      allowUnfree = true;
      allowUnfreePredicate = _: true;
    };
  };
}
