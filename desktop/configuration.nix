{ config, pkgs, ... }:

# Only desktop settings
{
  # Configure keymap in X11
  services.xserver = {
    layout = "gb";
    xkbVariant = "";
  };
}
