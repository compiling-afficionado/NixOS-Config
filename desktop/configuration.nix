{ config, pkgs, ... }:

# Only desktop settings
{
  # Configure keymap in X11
  services.xserver = {
    layout = "gb";
    xkbVariant = "";
  };

  boot.initrd.kernelModules = [ "amdgpu" ];
  hardware.opengl = {
    # Mesa
    enable = true;

    # Vulkan
    driSupport = true;
  };

  environment = {
      variables = {
        MANGOHUD_CONFIG = "no_display";
      };
  };
}
