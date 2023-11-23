{ pkgs, ... }:

{
  home.packages = with pkgs; [
    ripgrep
    fd
    lua-language-server
  ];

  programs.neovim = 
  let
    toLua = str: "lua << EOF\n${str}\nEOF\n";
    toLuaFile = file: "lua << EOF\n${builtins.readFile file}\nEOF\n";
  in
  {
    enable = true;
    vimAlias = true;
    coc.enable = false;

    plugins = with pkgs.vimPlugins; [

        {
            plugin = alpha-nvim;
            config = toLuaFile ./plugin/alpha.lua;
        }

        {
          plugin = (nvim-treesitter.withPlugins (p: [
            p.tree-sitter-nix
            p.tree-sitter-vim
            p.tree-sitter-bash
            p.tree-sitter-lua
            p.tree-sitter-python
            p.tree-sitter-json
            p.tree-sitter-c
        ]));
        config = toLua "require('nvim-treesitter.configs').setup";
      }

    ];
  };

  home.file."./.config/nvim/" = {
    source = ./nvim;
    recursive = true;
  };

}
