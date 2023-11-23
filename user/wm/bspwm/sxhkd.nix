{
  services.sxhkd = {
    enable = true;
    keybindings = {
      "super + {Return, d, p, r, m}" = "{alacritty, rofi -show drun, ~/.config/rofi/leave.sh, rofi -show run, ./.config/rofi/music.sh}";
      "super + {_,shift + }q" = "bspc node -{c,k}";
      "super + {_,shift + }{1-9,0}" = "bspc {desktop -f,node -d} '^{1-9,10}'";
      "super + {_,shift + }{h, j, k, l}" = "bspc node -{f,s} {west,south,north,east}";
      "alt + Tab" = "rofi -show window";
      "alt + {j, k}" = "{amixer -q sset Master 5%-, amixer -q sset Master 5%+}";
      "super + f" = "bspc node -t \"~\"{floating,tiled}";
    };
  };
}
