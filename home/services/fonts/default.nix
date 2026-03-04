{
  config,
  pkgs,
  ...
}: {
  home.packages = with pkgs; [
    noto-fonts
    noto-fonts-cjk-sans
    jetbrains-mono
    nerd-fonts.jetbrains-mono
    twemoji-color-font
    fira-sans
    sf-pro
    victor-mono
    nerd-fonts.victor-mono
  ];
  fonts.fontconfig = {
    enable = true;
    antialiasing = true;
    subpixelRendering = "rgb";
    defaultFonts = {
      serif = ["SF Pro Display"];
      sansSerif = ["SF Pro Display"];
      monospace = ["Jetbrains Mono"];
    };
  };
}
