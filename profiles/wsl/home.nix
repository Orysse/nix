{ config, pkgs, inputs, ... }:

{
  home.username = "nixos";
  home.homeDirectory = "/home/nixos";

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
    ../../user/apps/shell/zsh/zsh.nix
    ../../user/apps/editor/nvim/nvim.nix
    ../../user/apps/utils/tmux.nix
    ../../user/apps/utils/git.nix
  ];

  colorScheme = inputs.nix-colors.colorSchemes.everforest;

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
    lsd

    #utils
    gnumake
    cmake
    xclip
    tree

    # (callPackage ./packages/discord-screenaudio.nix {})

  ];

  home.sessionVariables = {
    EDITOR = "nvim";
  };

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
}
