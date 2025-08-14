{
  pkgs,
  inputs,
  config,
  ...
}: {
  # nh default flake
  environment.variables.NH_FLAKE = "${config.users.users.admin.home}/poland";

  programs.nh = {
    enable = true;
    package = inputs.nh.packages.${pkgs.system}.default;

    clean = {
      enable = true;
      extraArgs = "--keep-since 30d";
    };
  };
}
