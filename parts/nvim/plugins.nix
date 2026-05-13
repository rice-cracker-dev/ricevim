{
  pkgs,
  inputs,
  inputs',
  ...
}: let
  direnv-nvim-source = pkgs.vimUtils.buildVimPlugin {
    name = "direnv.nvim";
    src = inputs.direnv-nvim;
  };

  opencode-nvim-source = pkgs.vimUtils.buildVimPlugin {
    name = "opencode.nvim";
    src = inputs.opencode-nvim;
    dependencies = with pkgs; [vimPlugins.plenary-nvim];
    buildInputs = with pkgs; [opencode];
  };
in {
  plugins = {
    start = with pkgs.vimPlugins; [
      lazy-nvim
      plenary-nvim
      friendly-snippets
      nvim-lspconfig
      nui-nvim
      SchemaStore-nvim
      nvim-treesitter.withAllGrammars
      nvim-ts-context-commentstring
      inputs'.blink-cmp.packages.default
      snacks-nvim
      mini-nvim
      oil-nvim
      catppuccin-nvim
      conform-nvim
      nvim-lint
      direnv-nvim-source
      lualine-nvim
      nvim-cursorline
      fidget-nvim
      nvim-ts-autotag
      diagflow-nvim
      diffview-nvim
    ];

    # lazy plugins
    opt = with pkgs.vimPlugins; [
      lazydev-nvim
      which-key-nvim
      edgy-nvim
      neocord
      trouble-nvim
      markdown-preview-nvim
      render-markdown-nvim
      persistence-nvim
      typst-preview-nvim
      opencode-nvim-source
      neogit
    ];
  };
}
