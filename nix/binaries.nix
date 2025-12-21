{pkgs, ...}: {
  extraBinPath = with pkgs; [
    # lsps
    lua-language-server

    # formatters
    stylua
  ];
}
