{ config, pkgs, ... }:

{
  #TODO: add gnome config files here

  home.packages = with pkgs; [                               
    
    gamemode
    gnomeExtensions.gamemode
  ];
}