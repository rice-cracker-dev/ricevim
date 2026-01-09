{
  pkgs,
  inputs,
  ...
}: let
  nvim-treesitter-with-grammars = pkgs.vimPlugins.nvim-treesitter.withPlugins (_:
    with pkgs.vimPlugins.nvim-treesitter.grammarPlugins; [
      vim
      vimdoc
      lua
      query
      nix
      javascript
      typescript
      json
      svelte
      yaml
      css
      scss
      html
      markdown
      markdown_inline
      astro
      vue
      dockerfile
      python
      qmljs
      jsdoc
      tsx
      c
      cpp
      latex
    ]);

  nvim-treesitter-queries = with pkgs.vimPlugins.nvim-treesitter.queries; [
    ecma
    html_tags
    jsx
  ];

  ts-error-translator = pkgs.vimUtils.buildVimPlugin {
    name = "ts-error-translator.nvim";
    src = inputs.ts-error-translator;
  };

  direnv-nvim = pkgs.vimUtils.buildVimPlugin {
    name = "direnv.nvim";
    src = inputs.direnv-nvim;
  };
in {
  plugins = {
    dev.ricevim = {
      pure = ../.;
      impure = "/home/khoa/projects/ricevim";
    };

    start = with pkgs.vimPlugins;
      [
        lazy-nvim
        plenary-nvim
        friendly-snippets
        nvim-lspconfig
        nui-nvim
        SchemaStore-nvim
        nvim-treesitter-with-grammars
      ]
      ++ nvim-treesitter-queries;

    opt = with pkgs.vimPlugins; [
      # non-lazy
      neo-tree-nvim
      snacks-nvim
      mini-nvim
      catppuccin-nvim
      conform-nvim
      nvim-lint
      direnv-nvim
      ts-error-translator
      lualine-nvim
      nvim-cursorline
      fidget-nvim
      nvim-ts-autotag

      # lazy
      lazydev-nvim
      which-key-nvim
      edgy-nvim
      copilot-lua
      blink-cmp
      blink-copilot
      neocord
      trouble-nvim
      markdown-preview-nvim
      render-markdown-nvim
      persistence-nvim
      avante-nvim
    ];
  };
}
