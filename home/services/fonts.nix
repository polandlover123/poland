{
  config,
  pkgs,
  inputs,
  ...
}: {
  nixpkgs.overlays = [ inputs.apple-fonts.overlays.default ];
  home.packages = with pkgs; [
    noto-fonts
    noto-fonts-cjk-sans
    jetbrains-mono
    nerd-fonts.jetbrains-mono
    twemoji-color-font
    fira-sans
    atkinson-hyperlegible-next
    inputs.apple-fonts.packages.${pkgs.system}.sf-pro
  ];
  fonts.fontconfig = {
    enable = true;
    antialiasing = true;
    defaultFonts = {
      serif = ["Atkinson Hyperlegible Next"];
      sansSerif = ["Atkinson Hyperlegible Next"];
      monospace = ["Jetbrains Mono"];
    };
  };
}
