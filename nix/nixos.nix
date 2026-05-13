{
  inputs,
  lib,
  config,
  ...
}: let
  inherit (lib) mkIf mkEnableOption;

  cfg = config.programs.ricevim;
in {
  imports = [inputs.mnw.nixosModules.default];

  options.programs.ricevim = {
    enable = mkEnableOption "ricevim";
  };

  config.programs.mnw = mkIf cfg.enable {
    enable = true;
    config = ./default.nix;
  };
}
