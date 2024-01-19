{ config, pkgs, inputs, username, theme, ... }:

{
  home.username = username;
  home.homeDirectory = "/home/${username}";

  # This value determines the Home Manager release that your configuration is
  # compatible with. This helps avoid breakage when a new Home Manager release
  # introduces backwards incompatible changes.
  #
  # You should not change this value, even if you update Home Manager. If you do
  # want to update the value, then make sure to first check the Home Manager
  # release notes.
  home.stateVersion = "23.05"; # Please read the comment before changing.

  imports = [
    inputs.nix-colors.homeManagerModules.default
    ../../user/wm/bspwm/bspwm.nix
    # ../../user/apps/shell/zsh/zsh.nix
    ../../user/apps/notify/dunst.nix
    ../../user/apps/terminal/alacritty/alacritty.nix
    ../../user/apps/editor/nvim/nvim.nix
    ../../user/apps/utils/default.nix
    # ../../user/apps/browser/qute.nix
  ];

  colorScheme = inputs.nix-colors.colorSchemes.${theme};

  nixpkgs.config.allowUnfree = true;

  home.packages = with pkgs; [
    #languages
    python3
    nixpkgs-fmt

    #lsp
    ccls
    lua-language-server
    python311Packages.python-lsp-server
    haskell-language-server
    rnix-lsp

    #apps
    alacritty
    btop
    discord
    dunst
    feh
    firefox
    lsd
    neofetch
    pavucontrol
    polybar
    rofi
    steam
    swww
    xmobar
    spotify

    #utils
    gnumake
    xclip

    # (callPackage ./packages/discord-screenaudio.nix {})

  ];

  home.sessionVariables = {
    EDITOR = "nvim";
  };

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
}
