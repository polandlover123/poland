{pkgs, ...}: {
  users.users.admin = {
    isNormalUser = true;
    description = "admin";
    shell = pkgs.zsh;
    extraGroups = ["networkmanager" "wheel"];
  };
  users.users.root.initialPassword = "change";
  programs.zsh.enable = true;
}
