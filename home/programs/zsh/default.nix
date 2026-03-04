{
  programs.zsh = {
    enable = true;
    syntaxHighlighting.enable = true;
    defaultKeymap = "emacs";
    autosuggestion = {
      enable = true;
    };
  };
  programs.starship = {
    enable = true;
    enableZshIntegration = true;
  };
}
