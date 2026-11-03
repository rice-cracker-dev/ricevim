{
  pkgs,
  inputs,
  system,
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

  neonuget-source = pkgs.vimUtils.buildVimPlugin {
    name = "neonuget";
    src = inputs.neonuget;
    dependencies = with pkgs; [vimPlugins.plenary-nvim];
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
      nvim-treesitter-context
      nvim-lint
      which-key-nvim
      diffview-nvim
      oil-nvim
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
      conform-nvim
      inputs.blink-cmp.packages.${system}.default
      inputs.blink-pairs.packages.${system}.default
      diagflow-nvim
      lualine-nvim
      nvim-ts-autotag
      direnv-nvim-source
      fidget-nvim
      snacks-nvim
      mini-nvim
      catppuccin-nvim
      blame-nvim
      neonuget-source
      competitest-nvim
    ];
  };
}
