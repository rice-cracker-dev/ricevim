{
  pins,
  stdenv,
  python3Minimal,
}:
stdenv.mkDerivation {
  name = "hyprland-lua-stub";
  version = "0.55";

  buildInputs = [python3Minimal];

  src = pins.hyprland;

  buildPhase = ''
    python ./meta/generateLuaStubs.py
  '';

  installPhase = ''
    mkdir -p $out/share/hypr/stubs/
    cp ./meta/hl.meta.lua $out/share/hypr/stubs/
  '';
}
