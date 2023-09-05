{ config, pkgs, ... }:

{
  # Enable KDE.
    services.xserver = {
      enable = true;
      displayManager.sddm.enable = true;
      desktopManager.plasma5.enable = true;
    };
}
