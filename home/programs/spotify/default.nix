{
  pkgs,
  inputs,
  ...
}: {
  imports = [
    inputs.spicetify.homeManagerModules.default
  ];
  programs.spicetify = let
    spicetifypkg = inputs.spicetify.legacyPackages.${pkgs.system};
  in {
    enable = true;
    enabledExtensions = with spicetifypkg.extensions; [
        copyToClipboard
      {
        src = pkgs.fetchFromGitHub {
          owner = "spikerko";
          repo = "spicy-lyrics";
          rev = "9dce768818f522a6e37c9bd77536a56d2c1cc62b";
          hash = "sha256-F9JQadIPBUNordak9g/gsy7kH/GEo6uuU4/FaIQ/wwA=";
        };
        name = "builds/spicy-lyrics.mjs";
      }
    ];
  };
}
