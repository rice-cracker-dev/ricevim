{
  imports = [
    ./binaries.nix
    ./plugins.nix
  ];

  enable = true;
  aliases = ["vim" "vi"];
  initLua = "require('core')";
}
