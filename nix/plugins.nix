{pkgs, ...}: {
  plugins = {
    dev.ricevim = {
      pure = ../.;
      impure = "/home/khoa/projects/ricevim";
    };

    start = with pkgs.vimPlugins; [
      lazy-nvim
      plenary-nvim
      friendly-snippets
      nvim-lspconfig
      nui-nvim
      nvim-web-devicons
    ];

    opt = with pkgs.vimPlugins; [
      # non-lazy
      neo-tree-nvim
      snacks-nvim
      catppuccin-nvim
      conform-nvim

      # lazy
      lazydev-nvim
      blink-cmp
      which-key-nvim
    ];
  };
}
