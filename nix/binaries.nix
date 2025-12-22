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
  ];
}
