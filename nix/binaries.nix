{pkgs, ...}: {
  extraBinPath = with pkgs; [
    # lsps
    lua-language-server
    nixd

    # formatters
    stylua
    alejandra
  ];
}
