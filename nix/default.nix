{
  imports = [
    ./binaries.nix
    ./plugins.nix
  ];

  appName = "ricevim";

  aliases = ["vim" "vi"];
  initLua = "require('core')";
}
