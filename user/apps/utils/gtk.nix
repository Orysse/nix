{ config, pkgs, ... }:

{
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
