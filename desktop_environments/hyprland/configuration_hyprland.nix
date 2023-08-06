{ config, pkgs, ... }:

{
  programs.hyprland = {
    enable = true;
    xwayland.enable = true;
  };

  # enable GDM
  services.xserver.displayManager.gdm.enable = true;

  # XDG Portal is needed for Flatpak apps to work
  xdg.portal = {
    enable = true;
    extraPortals = [ pkgs.xdg-desktop-portal-gtk ];
  };
}