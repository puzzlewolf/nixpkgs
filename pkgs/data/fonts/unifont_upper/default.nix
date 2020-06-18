{ lib, mkFont, fetchurl }:

mkFont rec {
  version = "12.1.03";
  name = "unifont_upper-${version}";

  src = fetchurl {
    url = "mirror://gnu/unifont/unifont-${version}/${name}.ttf";
    sha256 = "0f12kf1vxajlm88sqj0dpw8vmfbx2r353yw0z3q138rla1zmd874";
  };

  sourceRoot = ".";
  unpackCmd = ''
    filename=$(basename $(stripHash "$curSrc"))
    cp $curSrc ./$filename
  '';

  meta = with lib; {
    description = "Unicode font for glyphs above the Unicode Basic Multilingual Plane";
    homepage = "https://unifoundry.com/unifont.html";

    # Basically GPL2+ with font exception.
    license = "http://unifoundry.com/LICENSE.txt";
    maintainers = [ maintainers.mathnerd314 maintainers.vrthra ];
    platforms = platforms.all;
  };
}
