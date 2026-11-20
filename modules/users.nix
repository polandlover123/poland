{pkgs, ...}: {
  users.users.admin = {
    isNormalUser = true;
    description = "admin";
    shell = pkgs.zsh;
    extraGroups = ["networkmanager" "wheel" "input" "librepods"];
  };
  programs.zsh.enable = true;
}
