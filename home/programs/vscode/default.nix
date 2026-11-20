{pkgs, ...}: {
  home.packages = [
    pkgs.nixd
    pkgs.nixfmt
  ];
  programs = {
    vscode = {
      enable = true;
      package = pkgs.vscode.fhs;
    };
  };
}
