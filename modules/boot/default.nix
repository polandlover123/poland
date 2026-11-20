{
  config,
  pkgs,
  ...
}: {
  # ...
  boot = {
    zfs.forceImportRoot = false;
    loader = {
      grub = {
        enable = true;
        device = "nodev";
        useOSProber = true;
        efiSupport = true;
      };
      efi = {
        canTouchEfiVariables = true;
      };
    };
  };
}
