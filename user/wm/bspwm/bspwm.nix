{ pkgs, config, ... }:

{
  imports = [
    ./sxhkd.nix
    ./polybar.nix
    ../picom/picom.nix
  ];

  xsession.windowManager.bspwm = {
    enable = true;
    settings = {
      border_width = 2;
      gapless_monocle = true;
      split_ratio = 0.5;
      window_gap = 12;
      focused_border_color = "#${config.colorScheme.colors.base0E}";
      normal_border_color = "#${config.colorScheme.colors.base0D}";
    };
    monitors = {
      eDP-1 = [
        "一"
        "二"
        "三"
        "四"
        "五"
        "六"
        "七"
        "八"
      ];
    };
    startupPrograms = [
      "feh --bg-fill /home/abelc/.dotfiles/user/wallpaper/wallpaper.jpg"
      "~/.config/polybar/launch.sh"
    ];
  };
}
