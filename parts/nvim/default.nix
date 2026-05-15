{
  imports = [
    ./binaries.nix
    ./plugins.nix
  ];

  appName = "ricevim";
  aliases = ["vim" "vi"];

  plugins.dev.ricevim = {
    pure = ../../nvim;
    impure = "~/projects/ricevim/nvim";
  };

  initLua =
    # lua
    ''
      require('core')
    '';
}
