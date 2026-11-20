{pkgs, ...}: {
  imports = [
    ../../.
  ];
  home.packages = with pkgs; [
    gh
    readest
  ];
}
