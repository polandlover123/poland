{
  services.fprintd.enable = true;
  security = {
    rtkit.enable = true;
    pam = {
      sshAgentAuth.enable = true;
      services = {
        greetd = {
          fprintAuth = true;
          u2fAuth = true;
          enableGnomeKeyring = true;
        };
        greetd-password.enableGnomeKeyring = true;
        login.enableGnomeKeyring = true;
      };
    };

    sudo.wheelNeedsPassword = false;
  };
}
