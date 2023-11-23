{ pkgs, config, ... }:

{
  services.dunst = {
    enable = true;
    settings = with config.colorScheme.colors; {
      global = {
        frame_color = "#${base08}";
        separator_color = "frame";
      };

      urgency_low = {
        background = "${base00}";
        foreground = "#${base06}";
      };

      urgency_normal = {
        background = "#${base00}";
        foreground = "#${base06}";
      };

      urgency_critical = {
        background = "#${base00}";
        foreground = "#${base06}";
        frame_color = "#${base0E}";
      };
    };
  };

}
