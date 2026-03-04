{pkgs,...}:{
    home.packages = [
        pkgs.nixd
    ];
    programs = {
        vscode = {
            enable = true;
            package = pkgs.vscode.fhs;
        };
    };
}