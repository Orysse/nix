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
      eDP-1-1 = [
        "ܐ "
        "ܒ "
        "ܓ "
        "ܕ "
        "ܗ "
        "ܘ "
        "ܙ "
        "ܚ "
      ];
    };
    startupPrograms = [
      "feh --bg-fill /home/abelc/.dotfiles/user/wallpaper/wallpaper.jpg"
      "~/.config/polybar/launch.sh"
      "xinput set-prop 'Logitech USB Receiver' 'libinput Accel Speed' -0.7"
      "setxkbmap us intl"
    ];
  };
}
