{
  pkgs,
  inputs',
  ...
}: {
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
    clang-tools
    #kdePackages.qtdeclarative # replaced by qml-language-server
    inputs'.qml-language-server.packages.default
    tinymist
    rust-analyzer

    # formatters
    stylua
    alejandra
    prettierd
    rustfmt

    # linters
    selene
    eslint_d
    statix
    ruff # also acts as formatter
    clippy

    # runtimes
    nodejs

    # others
    curl
    lazygit
    wl-clipboard
    ripgrep
    fd
    opencode
    lsof
  ];
}
