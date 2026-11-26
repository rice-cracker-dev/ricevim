{
  pkgs,
  inputs,
  system,
  self',
  ...
}: {
  plugins = {
    start = with pkgs.vimPlugins; [
      lz-n
      plenary-nvim
      friendly-snippets
      nvim-lspconfig
      nui-nvim
      SchemaStore-nvim
      nvim-treesitter.withAllGrammars
      nvim-ts-context-commentstring
      nvim-treesitter-context
      nvim-lint
      which-key-nvim
      diffview-nvim
      oil-nvim
    ];

    # lazy plugins
    opt = with pkgs.vimPlugins;
      [
        lazydev-nvim
        edgy-nvim
        neocord
        trouble-nvim
        markdown-preview-nvim
        render-markdown-nvim
        persistence-nvim
        typst-preview-nvim
        conform-nvim
        inputs.blink-cmp.packages.${system}.default
        inputs.blink-pairs.packages.${system}.default
        diagflow-nvim
        lualine-nvim
        nvim-ts-autotag
        fidget-nvim
        snacks-nvim
        mini-nvim
        catppuccin-nvim
        blame-nvim
        competitest-nvim
        direnv-nvim
      ]
      ++ (with self'.legacyPackages.vimPlugins; [
        neonuget
        clip-paste-nvim
      ]);
  };
}
