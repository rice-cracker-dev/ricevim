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
      lz-n
      plenary-nvim
      friendly-snippets
      nvim-lspconfig
      nui-nvim
      SchemaStore-nvim
      nvim-treesitter.withAllGrammars
      nvim-ts-context-commentstring
      nvim-lint
      which-key-nvim
      diffview-nvim
    ];

    # lazy plugins
    opt = with pkgs.vimPlugins; [
      lazydev-nvim
      edgy-nvim
      neocord
      trouble-nvim
      markdown-preview-nvim
      render-markdown-nvim
      persistence-nvim
      typst-preview-nvim
      opencode-nvim-source
      neogit
      conform-nvim
      inputs'.blink-cmp.packages.default
      inputs'.blink-pairs.packages.default
      diagflow-nvim
      lualine-nvim
      nvim-ts-autotag
      oil-nvim
      direnv-nvim-source
      fidget-nvim
      snacks-nvim
      mini-nvim
      catppuccin-nvim
    ];
  };
}
