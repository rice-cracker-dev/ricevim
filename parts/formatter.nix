{
  perSystem = {pkgs, ...}: {
    formatter = pkgs.writeShellApplication {
      name = "formatter";
      runtimeInputs = with pkgs; [stylua alejandra];
      text = ''
        stylua -v .
        alejandra .
      '';
    };
  };
}
