{
  pkgs,
  inputs,
  ...
}: let
  clang-tools-old = inputs.nixpkgs-25-05.legacyPackages.${pkgs.stdenv.hostPlatform.system}.clang-tools;
in {
  extraBinPath = with pkgs; [
    # lsps
    lua-language-server
    nixd
    astro-language-server
    typescript-language-server
    vscode-langservers-extracted
    svelte-language-server
    docker-language-server
    tailwindcss-language-server
    yaml-language-server
    basedpyright
    marksman
    clang-tools-old
    kdePackages.qtdeclarative

    # formatters
    stylua
    alejandra
    prettierd

    # linters
    selene
    eslint_d
    statix
    markdownlint-cli2
    ruff # also acts as formatter

    # runtimes
    nodejs

    # others
    curl
    lazygit
    gemini-cli
    wl-clipboard
    ripgrep
    fd
  ];
}
