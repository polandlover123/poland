{
  xdg.dataFile."easyeffects/irs/impulse.irs".source = ./irs/impulse.irs;
  services.easyeffects = {
    enable = true;
    preset = "headphones";
    extraPresets = {
      headphones = builtins.fromJSON (builtins.readFile ./config.json);
    };
  };
}