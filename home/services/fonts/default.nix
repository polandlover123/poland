{
  config,
  pkgs,
  ...
}: {
  home.packages = with pkgs; [
    jetbrains-mono
    nerd-fonts.jetbrains-mono
    twemoji-color-font
    fira-sans
    sf-pro
  ];
  fonts.fontconfig = {
    enable = true;
    defaultFonts = {
      serif = ["SF Pro Display"];
      sansSerif = ["SF Pro Display"];
      monospace = ["JetBrains Mono"];
    };
  };
}
