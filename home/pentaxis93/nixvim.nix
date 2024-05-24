{ config, pkgs,  ... }:

{
  imports = [
    # nixvim.homeManagerModules.nixvim
  ];

  programs.nixvim = {
    enable = true;
    defaultEditor = true;

    opts = {
      number = true;
      relativenumber = true;
      shiftwidth = 2;
      undofile = true;
    };

    plugins = {
      cmp = {
	enable = true;
	autoEnableSources = true;
      };	

      lazygit.enable = true;

      leap.enable = true;

      lightline.enable = true;

      lsp = {
        enable = true;
	servers = {
	  nil_ls.enable = true;
	  tsserver.enable = true;
        };
      };

      neo-tree.enable = true;

      telescope.enable = true;

      treesitter.enable = true;
    };
  };
}
