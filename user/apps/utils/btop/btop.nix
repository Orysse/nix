{
  programs.btop = {
    enable = true;
    settings = {
      color_theme = "rose-pine-moon";
      theme_background = false;
      truecolor = true;
      presets = "cpu:1:default,proc:0:default cpu:0:default,mem:0:default,net:0:default cpu:0:block,net:0:tty";
      vim_keys = false;
      rounded_corner = true;
      graph_symbol = "braille";
    };
  };

  home.file.".config/btop/themes".source = ./themes;
}
