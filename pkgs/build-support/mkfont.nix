{ lib, stdenv }:

args:

stdenv.mkDerivation ({
  dontConfigure = true;
  dontBuild = true;
  doCheck = false;
  dontFixup = true;

  installPhase = ''
    find -iname '*.ttf' -print0 | xargs -0 -r install -v -m644 --target $out/share/fonts/truetype/ -D
    find -iname '*.otf' -print0 | xargs -0 -r install -v -m644 --target $out/share/fonts/opentype/ -D
    find -iname '*.eot' -print0 | xargs -0 -r install -v -m644 --target $out/share/fonts/eot/ -D
    find -iname '*.woff' -print0 | xargs -0 -r install -v -m644 --target $out/share/fonts/woff/ -D
    find -iname '*.woff2' -print0 | xargs -0 -r install -v -m644 --target $out/share/fonts/woff2/ -D
    find -iname '*.bdf' -print0 | xargs -0 -r install -v -m644 --target $out/share/fonts/misc/ -D
    find -iname '*.otb' -print0 | xargs -0 -r install -v -m644 --target $out/share/fonts/misc/ -D
    # find $src -iname '*.txt' -print0 | xargs -0 -r install -v -m644 --target $out/share/doc/ -D
  '';
} // args)
