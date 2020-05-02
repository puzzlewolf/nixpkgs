{ lib, fetchzip, mkFont }:

mkFont rec {
  version = "0.112";
  name = "Amiri-${version}";

  src = fetchzip {
    url = "https://github.com/alif-type/amiri/releases/download/${version}/${name}.zip";
    sha256 = "0simwv5yhv74z95lkf6pfp107a93nlh43can4y1flpx99hz4riyi";
  };

  meta = with lib; {
    description = "A classical Arabic typeface in Naskh style";
    homepage = "https://www.amirifont.org/";
    license = licenses.ofl;
    maintainers = [ maintainers.vbgl ];
    platforms = platforms.all;
  };
}

