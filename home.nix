{ config, pkgs, desktop_environment, host, ... }:

{
  imports =
    [
      (./. + "/desktop_environments/${desktop_environment}/home.nix") # Desktop environment import
    ];

  home = {
    # Packages that should be installed to the user profile.
    packages = [                               
      pkgs.htop
    ];

    # This value determines the Home Manager release that your
    # configuration is compatible with. This helps avoid breakage
    # when a new Home Manager release introduces backwards
    # incompatible changes.
    #
    # You can update Home Manager without changing this value. See
    # the Home Manager release notes for a list of state version
    # changes in each release.
    stateVersion = "23.05";

    # Home Manager needs a bit of information about you and the
    # paths it should manage.
    username = "michael";
    homeDirectory = "/home/michael";
  };

  programs = {
    # Let Home Manager install and manage itself.
    home-manager.enable = true;

    zsh = {
      enable = true;
      enableCompletion = true;
      enableAutosuggestions = true;
      syntaxHighlighting.enable = true;
      initExtra = ''eval "$(direnv hook zsh)"'';
      oh-my-zsh = {
        enable = true;
        plugins = [ "git" ];
        theme = "robbyrussell";
      };
      # shellAliases = {
      #   ll = "ls -l";
      #   update = "sudo nixos-rebuild switch";
      # };
    };

    direnv = {
      enable = true;
      enableZshIntegration = true;
      nix-direnv.enable = true;
    };
  };
}
