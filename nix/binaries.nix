{pkgs, ...}: {
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
    kdePackages.qtdeclarative
    tinymist
    rust-analyzer
    nushell

    # formatters
    stylua
    alejandra
    prettierd
    rustfmt
    nufmt

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
