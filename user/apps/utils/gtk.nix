{ config, pkgs, ... }:

{
  gtk = {
    enable = true;
    theme = {
      name = "Everforest-GTK-Theme";
      package = pkgs.callPackage ../../../packages/everforest-gtk.nix;/* .override {
        accents = [ "mauve" ];
        size = "standard";
        tweaks = [ ];
        variant = "macchiato"; 
      }; */
    };
  };
}
