{ lib, mkFont, fetchFromGitHub, libfaketime, fonttosfnt }:

mkFont rec {
  pname = "creep";
  version = "0.31";

  src = fetchFromGitHub {
    owner = "romeovs";
    repo = pname;
    rev = version;
    sha256 = "0zs21kznh1q883jfdgz74bb63i4lxlv98hj3ipp0wvsi6zw0vs8n";
  };

  nativeBuildInputs = [ libfaketime fonttosfnt ];
  dontBuild = false;
  buildPhase = ''
    faketime -f "1970-01-01 00:00:01" fonttosfnt -g 2 -m 2 -o creep.otb creep.bdf
  '';

  meta = with lib; {
    description = "A pretty sweet 4px wide pixel font";
    homepage = "https://github.com/romeovs/creep";
    license = licenses.mit;
    platforms = platforms.all;
    maintainers = with maintainers; [ buffet ];
  };
}
