# thanks fufexan!
# security tweaks borrowed from @hlissner
{
  security = {
    # userland niceness
    rtkit.enable = true;
    pam = {
      sshAgentAuth.enable = true;
      services = {
        astal-auth = {};
        hyprlock.text = "auth include login";
        greetd.enableGnomeKeyring = true;
        login = {
          enableGnomeKeyring = true;
        };
      };
    };

    sudo.wheelNeedsPassword = false;
  };
}
