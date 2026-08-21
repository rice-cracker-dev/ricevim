{
  description = "ricevim";

  outputs = {self, ...} @ args: let
    inputs = (import ./.tack) {overrides = args.tackOverrides or {};};
    inherit (inputs) flake-parts;
  in
    flake-parts.lib.mkFlake {
      inherit inputs;
      self = self // {inherit inputs;};
    } {
      imports = [./parts];
    };
}
