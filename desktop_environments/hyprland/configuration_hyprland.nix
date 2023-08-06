{ config, pkgs, ... }:

{
  programs.hyprland = {
    enable = true;
    xwayland.enable = true;
  };

  # enable GDM
  services.xserver.displayManager.gdm.enable = true;

  # Hint to electron apps to use Wayland
  environment.sessionVariables.NIXOS_OZONE_WL = "1";

  # XDG Portal is needed for Flatpak apps to work
  xdg.portal = {
    enable = true;
    extraPortals = [ pkgs.xdg-desktop-portal-gtk ];
  };
}