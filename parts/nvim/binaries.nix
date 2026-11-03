{pkgs, ...}: let
  binaries = with pkgs; [
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
    typescript
    typescript-language-server
    tombi # lsp, formatter, linter
    roslyn-ls
    deno

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
    clippy
    oxlint

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
    ffmpeg # for image conversion
    lazygit
  ];
in {
  # the plan is to not include binaries to PATH later.
  extraBinPath = binaries;
}
