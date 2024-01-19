{ config, pkgs, ... }:

{
  home.packages = [ pkgs.dconf ];
  gtk = {
    enable = true;
    theme = {
      name = "Everforest-Dark-BL";
      package = pkgs.callPackage ./everforest-gtk-theme.nix { };/* .override {
        accents = [ "mauve" ];
        size = "standard";
        tweaks = [ ];
        variant = "macchiato"; 
      }; */
    };
  };
}
