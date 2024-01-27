{ pkgs, config, ... }:

{
  services.polybar = {
    enable = true;
    package = pkgs.polybar.override {
      alsaSupport = true;
    };
    script = ''
        polybar bar &
        echo yoooo &
    '';
    config = with config.colorScheme.colors; {
      "bar/main" = {
        width = "100%";
        height = "26pt";
        radius = 0;

        font-0 = "Iosevka Nerd Font:style=ExtraBold:size=16;4";
        font-1 = "Iosevka Nerd Font:style=ExtraBold:size=22;5";
        font-2 = "Iosevka Nerd Font:style=ExtraBold:size=24;6";
        font-3 = "Iosevka Nerd Font:style=ExtraBold:size=26;6";
        font-4 = "Rounded Mgen+ 1p:style=bold:size=13;4";

        background = "#e0${base01}";
        foreground = "#${base05}";

        line-size = "1pt";

        border-size = "5pt";
        border-color = "#e0${base01}";

        padding-left = 0;
        padding-right = 0;

        module-margin = 0;

        modules-left = "left date space sep space time space sep weather right space-alt left spotify right";
        modules-center = "left xworkspaces right";
        modules-right = "left temperature space sep space cpu space sep space memory space sep space wlan space sep space dunst space sep space alsa space sep space battery right";

        cursor-click = "pointer";
        cursor-scroll = "ns-resize";

        enable-ipc = true;

        wm-restack = "bspwm";
      };

      "module/xworkspaces" = {
        type = "internal/xworkspaces";
        strip-wsnumber = true;
        label-active-background = "#${base00}";
        label-occupied-background = "#${base00}";
        label-urgent-background = "#${base00}";
        label-empty-background = "#${base00}";

        label-active = "%name%";
        label-active-foreground = "#${base0E}";
        label-active-padding = 1;

        label-occupied = "%name%";
        label-occupied-foreground = "#${base0F}";
        label-occupied-padding = 1;

        label-urgent = "%name%";
        label-urgent-foreground = "#${base0A}";
        label-urgent-padding = 1;

        label-empty = "%name%";
        label-empty-padding = 1;
      };

      "module/date" = {
        type = "internal/date";
        interval = 100;
        date = "%a, %d %b";
        label = "%date%";
        label-foreground = "#${base0E}";
        label-background = "#${base00}";
      };

      "module/time" = {
        type = "internal/date";
        interval = 100;
        time = "%H:%M";
        label = "%time%";
        label-foreground = "#${base0C}";
        label-background = "#${base00}";
      };

      "module/battery" = {
        type = "internal/battery";

        full-at = 99;

        battery = "BAT1";
        adapter = "ADP1";

        poll-interval = 5;

        time-format = "%H:%M";

        format-charging = "<animation-charging> <label-charging>";
        format-charging-background = "#${base00}";

        format-discharging = "<ramp-capacity> <label-discharging>";
        format-discharging-background = "#${base00}";

        format-full = "<label-full>";
        format-full-foreground = "#${base08}";
        format-full-background = "#${base00}";

        label-charging = "%percentage%%";
        label-discharging = "%percentage%%";
        label-full = "%{F#${base08}} %{F-}100%";

        ramp-capacity-0 = " ";
        ramp-capacity-1 = " ";
        ramp-capacity-2 = " ";
        ramp-capacity-3 = " ";
        ramp-capacity-4 = " ";
        ramp-capacity-foreground = "#${base08}";

        bar-capacity-width = 10;

        animation-charging-0 = " ";
        animation-charging-1 = " ";
        animation-charging-2 = " ";
        animation-charging-3 = " ";
        animation-charging-4 = " ";
        animation-charging-foreground = "#${base08}";

        animation-charging-framerate = 750;
      };

      "module/space" = {
        type = "custom/text";
        content = " ";
        content-background = "#${base00}";
      };

      "module/space-alt" = {
        type = "custom/text";
        content = " ";
      };

      "module/sep" = {
        type = "custom/text";
        content = "/";
        content-padding = 0;
        content-foreground = "#e0${base01}";
        content-background = "#${base00}";
        content-font = 4;
      };

      "module/alsa" = {
        type = "internal/alsa";

        master-soundcard = "default";
        master-mixer = "Master";

        format-volume = "<ramp-volume><label-volume>";
        ramp-volume-foreground = "#${base0B}";
        format-volume-background = "#${base00}";

        label-volume = "%percentage%%";

        ramp-volume-0 = "󰕿 ";
        ramp-volume-1 = "󰖀 ";
        ramp-volume-2 = "󰕾 ";

        label-muted = "󰝟 Muted";
        label-muted-foreground = "#${base0E}";
        label-muted-background = "#${base00}";

        interval = 4;
      };

      "module/memory" = {
        type = "internal/memory";
        interval = 2;
        format-prefix = "󰑭 ";
        format-prefix-foreground = "#${base0A}";
        format-background = "#${base00}";
        label = "%percentage_used:2%%";
      };

      "module/temperature" = {
        type = "internal/temperature";

        interval = "0.5";

        format = "<ramp><label>";
        format-warn = "<ramp> <label-warn>";

        label = "%temperature-c%";
        label-warn = "%temperature-c%";

        label-warn-foreground = "#${base0E}";

        thermal-zone = 0;
        base-temperature = 20;
        warn-temperature = 60;
        format-background = "#${base00}";
        format-warn-background = "#${base00}";

        ramp-0 = " ";
        ramp-1 = " ";
        ramp-2 = " ";
        ramp-3 = " ";
        ramp-4 = " ";
        ramp-foreground = "#${base0E}";
      };

      "module/cpu" = {
        type = "internal/cpu";
        interval = 2;
        format-prefix = "󰍛 ";
        format-prefix-foreground = "#${base0C}";
        format-background = "#${base00}";
        label = "%percentage:2%%";
      };

      "module/left" = {
          type = "custom/text";
          content-background = "#e0${base01}";
          content-foreground = "#${base00}";
          content-font = 2;
          content = "%{T3}%{T-}";
      };

      "module/right" = {
          type = "custom/text";
          content-background = "#e0${base01}";
          content-foreground = "#${base00}";
          content-font = 2;
          content = "%{T3}%{T-}";
      };

      "module/wlan" = {
          type = "internal/network";
          interface-type = "wireless";
          interval = 1;

          label-disconnected = "Offline";
          format-disconnected-prefix = "󰤭 ";
          format-disconnected-prefix-foreground = "#${base0E}";
          format-disconnected-background = "#${base00}";

          format-connected = "<ramp-signal> <label-connected>";
          label-connected = "%essid:0:22:...%";
          format-connected-background = "#${base00}";
          ramp-signal-foreground = "#${base0D}";
          ramp-signal-0 = "󰤯 ";
          ramp-signal-1 = "󰤟 ";
          ramp-signal-2 = "󰤢 ";
          ramp-signal-3 = "󰤨 ";
          ramp-signal-4 = "󰤨 ";
      };

      "module/spotify" = {
          type = "custom/script";
          tail = true;
          interval = 1;
          format-prefix = " ";
          format-background = "#${base00}";
          exec = "bash ~/.config/polybar/polybar-scripts/get_spotify_status.sh";
          format-foreground = "#${base0D}";
          label = "%output:0:22:...%";
      };

      "module/weather" = {
          type = "custom/script";
          exec = "bash ~/.config/polybar/polybar-scripts/weather-plugin.sh || nope";
          tail = false;
          interval = 60;
          format-background = "#${base00}";
      };

      "module/dunst" = {
          type = "custom/ipc";
          initial = 1;
          format-foreground = "#${base0A}";
          format-background = "#${base00}";

          hook-0 = "echo \"%{A1:dunstctl set-paused true && polybar-msg hook dunst 2:} %{A}\" &";
          hook-1 = "echo \"%{A1:dunstctl set-paused false && polybar-msg hook dunst 1:} %{A}\" &";
      };
    };
  };
  
  home.packages = with pkgs; [
    zscroll
    playerctl
    jq
    bc
  ];

  home.file = {
      ".config/polybar/launch.sh".source = ./polybar/launch.sh;
      ".config/polybar/polybar-scripts".source = ./polybar/polybar-scripts;
      ".owm-key".text = "b98be36035a0d5af10e6a3c797de14f2";
  };
}
