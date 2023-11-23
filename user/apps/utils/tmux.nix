{ config, pkgs, ... }:

{
  programs.tmux = {
    enable = true;
    clock24 = true;
    mouse = true;
    plugins = with pkgs; [
      tmuxPlugins.catppuccin
    ];
    extraConfig = ''
        set-option -sa terminal-overrides ",term*:Tc"
    '';
  };
}
