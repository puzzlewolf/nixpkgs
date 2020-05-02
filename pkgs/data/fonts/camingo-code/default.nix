{ lib, mkFont, fetchzip }:

mkFont {
  pname = "camingo-code";
  version = "1.0";

  src = fetchzip {
    url = "https://github.com/chrissimpkins/codeface/releases/download/font-collection/codeface-fonts.zip";
    sha256 = "09ah1x7g77s7x9xncsbpp88kxhjnxwncy88r52225wfq8ph85v9v";
  };

  meta = with lib; {
    homepage = "https://www.myfonts.com/fonts/jan-fromm/camingo-code/";
    description = "A monospaced typeface designed for source-code editors";
    platforms = platforms.all;
    license = licenses.cc-by-nd-30;
  };
}
