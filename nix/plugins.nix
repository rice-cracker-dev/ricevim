{
  pkgs,
  inputs,
  ...
}: let
  nvim-treesitter-with-grammars = pkgs.vimPlugins.nvim-treesitter.withPlugins (p:
    with p; [
      vim
      vimdoc
      lua
      query
      nix
      javascript
      typescript
      json
      jsonc
      svelte
      yaml
      css
      scss
      html
      markdown
      astro
      vue
      dockerfile
      python
      qmljs
      jsdoc
      tsx
    ]);

  ts-error-translator = pkgs.vimUtils.buildVimPlugin {
    name = "ts-error-translator";
    src = inputs.ts-error-translator;
  };

  direnv-nvim = pkgs.vimUtils.buildVimPlugin {
    name = "direnv-nvim";
    src = inputs.ts-error-translator;
  };
in {
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
      nvim-treesitter-with-grammars
      SchemaStore-nvim
      nvim-treesitter
    ];

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
      smartcolumn-nvim

      # lazy
      lazydev-nvim
      which-key-nvim
      edgy-nvim
      copilot-lua
      codecompanion-nvim
      blink-cmp
      blink-copilot
      neocord
    ];
  };
}
