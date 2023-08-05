{ config, pkgs, ... }:

{
  home.packages = with pkgs; [                               
    
    gamemode
    gnomeExtensions.gamemode
  ];
}