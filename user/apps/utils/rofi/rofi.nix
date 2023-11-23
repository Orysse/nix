{ pkgs, config, ... }:

{
    home.packages = with pkgs; [ rofi ];

    home.file = {
        ".config/rofi/config.rasi".text = with config.colorScheme.colors; 
        ''
        configuration {
          font: "Iosevka Nerd Font Medium 15";

          drun {
            display-name: "[ ]";
            display-format: "{name}";
          }

          run {
            display-name: "[ ]";
          }

          window {
            display-name: "[ ]";
          }

          dmenu {
              display-name: "[ ]";
          }

          modi: "window,run,drun";
        }

        @theme "/dev/null"

        * {
          border: 0;
          margin: 0;
          padding: 0;
          spacing: 0;

          bg: #${base00}a0;
          bg-alt: #${base00}d0;

          fg: #${base06};
          fg-alt: #${base03};

          background-color: @bg;
          separatorcolor: @fg;
          text-color: @fg;
        }

        window {
          width: 45%;
        }

        mainbox {
          children: [inputbar, listview];
        }

        inputbar {
          children: [prompt, entry];
          background-color: @bg-alt;
        }

        entry {
          padding: 12px 0;
        }

        prompt {
          padding: 12px;
        }

        listview {
          lines: 8;
          background-color: @bg;
        }

        element {
          children: [element-text];
        }

        element-text {
          padding: 12px;
          text-color: @fg-alt;
        }

        element-text selected {
          text-color: @fg;
        }
        '';
    };

    home.file.".config/rofi/leave.sh".source = ./leave.sh;
    home.file.".config/rofi/music.sh".source = ./music.sh;
}
