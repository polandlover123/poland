{
  inputs,
  pkgs,
  ...
}: {
  imports = [
    ./binds.nix
    ./monitors.nix
    ./settings.nix
    ./rules.nix
  ];
  wayland.windowManager.hyprland = {
    enable = true;
    package = inputs.hyprland.packages.${pkgs.system}.default;
    # systemd = {enable = true;};
  };
  home.packages = with pkgs; [
    grimblast
    clipse
    wl-clipboard
    swayosd
    swww
  ];
  home.sessionVariables = {
    NVD_BACKEND = "direct";
    QT_QPA_PLATFORM = "wayland";
    SDL_VIDEODRIVER = "wayland";
    XDG_SESSION_TYPE = "wayland";
  };
}
