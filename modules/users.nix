{pkgs, ...}: {
  users.users.admin = {
    isNormalUser = true;
    description = "admin";
    shell = pkgs.zsh;
    extraGroups = ["networkmanager" "wheel"];
  };
  programs.zsh.enable = true;
}
