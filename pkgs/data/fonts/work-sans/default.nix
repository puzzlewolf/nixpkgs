{ lib, mkFont, fetchFromGitHub }:

mkFont rec {
  pname = "work-sans";
  version = "1.6";

  src = fetchFromGitHub {
    owner = "weiweihuanghuang";
    repo = "Work-Sans";
    rev = "v${version}";
    sha256 = "01kjidk6zv80rqxapcdwhd9wxzrjfc6lj4gkf6dwa4sskw5x3b8a";
  };

  meta = with lib; {
    description = "A grotesque sans";
    homepage = "https://weiweihuanghuang.github.io/Work-Sans/";
    license = licenses.ofl;
    maintainers = [ maintainers.marsam ];
    platforms = platforms.all;
  };
}
