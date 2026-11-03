{
  pkgs,
  lib,
  ...
}: let
  inherit (lib) mkOption;
  inherit (lib.types) listOf package;
in {
  options.extraBinaries = mkOption {
    type = listOf package;
    default = with pkgs; [
      # lsps
      lua-language-server
      nixd
      astro-language-server
      vscode-langservers-extracted
      svelte-language-server
      docker-language-server
      tailwindcss-language-server
      yaml-language-server
      basedpyright
      marksman
      clang-tools
      kdePackages.qtdeclarative
      tinymist
      rust-analyzer
      nushell
      zls
      typescript-language-server
      tombi # lsp, formatter, linter
      roslyn-ls

      # formatters
      stylua
      alejandra
      prettierd
      rustfmt
      nufmt
      zig # zig fmt
      csharpier
      oxfmt

      # linters
      selene
      statix
      ruff # also acts as formatter
      cargo # clippy
      oxlint
    ];
  };
}
