{pkgs, ...}: {
  imports = [
    ../../.
  ];
  home.packages = with pkgs; [
    nautilus
  ];
  monitors = {
    "eDP-1" = {
      width = 1920;
      height = 1200;
      refreshRate = 60;
      x = 0;
      y = 0;
    };
  };
}
