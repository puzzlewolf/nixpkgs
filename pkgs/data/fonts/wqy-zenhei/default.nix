{ lib, mkFont, fetchzip }:

mkFont rec {
  pname = "wqy-zenhei";
  version = "0.9.45";

  src = fetchzip {
    url = "mirror://sourceforge/wqy/${pname}-${version}.tar.gz";
    sha256 = "0iikyr04kg76bn2qghg1mwm17ra0x3xgck8ly3lvhxpyibnl7zwd";
  };

  meta = {
    description = "A (mainly) Chinese Unicode font";
    homepage = "http://wenq.org";
    license = lib.licenses.gpl2; # with font embedding exceptions
    maintainers = [ lib.maintainers.pkmx ];
    platforms = lib.platforms.all;
  };
}
