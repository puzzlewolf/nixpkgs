{ lib, fetchzip, mkFont }:

mkFont rec {
  version = "0.102";
  pname = "aileron";
  name = "${pname}-font-${version}";

  src = fetchzip {
    url = "http://dotcolon.net/DL/font/${pname}.zip";
    sha256 = "1hawb176dd90nq95q5blpmpv93v7qyl9fwldiqfpvbjr0a1krphy";
    stripRoot = false;
  };

  meta = with lib; {
    homepage = "http://dotcolon.net/font/${pname}/";
    description = "A helvetica font in nine weights";
    platforms = platforms.all;
    maintainers = with maintainers; [ leenaars ];
    license = licenses.cc0;
  };
}
