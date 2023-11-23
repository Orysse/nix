{ pkgs, config, ... }:

{
  programs.qutebrowser = {
    enable = true;
    settings = {
      colors = with config.colorScheme.colors; {
        hints = {
          bg = "#${base00}";
          fg = "#${base06}";
        };
        tabs.bar.bg = "#${base00}";
      };
      tabs.tabs_are_windows = true;
    };
  };
}
