{pkgs, ...}: {
  imports = [
    ../../.
  ];
  home.packages = with pkgs; [
    nautilus
    gh
  ];
}
