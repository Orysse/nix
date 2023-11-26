{ config, pkgs, ... }:

{
  gtk = {
    enable = true;
    theme = {
      name = "Everforest-GTK-Theme";
      package = ../../../packages/everforest-gtk.nix;/* .override {
        accents = [ "mauve" ];
        size = "standard";
        tweaks = [ ];
        variant = "macchiato"; 
      }; */
    };
  };
}
