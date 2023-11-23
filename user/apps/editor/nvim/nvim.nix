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
        
      nvim-lspconfig
      nvim-cmp
      cmp-nvim-lsp
      cmp-luasnip
      friendly-snippets

      {
        plugin = lsp-zero;
        config = toLuaFile ./nvim/plugin/lsp.lua;
      }


    ];
  };

/*   home.file."./.config/nvim/" = {
    source = ./nvim;
    recursive = true;
  }; */

  # Treesitter is configured as a locally developed module in lazy.nvim
  # we hardcode a symlink here so that we can refer to it in our lazy config
/*   home.file."./.local/share/nvim/nix/nvim-treesitter/" = {
    recursive = true;
    source = treesitterWithGrammars;
  }; */

}
