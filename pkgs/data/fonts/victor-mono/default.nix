{ lib, mkFont, fetchFromGitHub }:

mkFont rec {
  pname = "victor-mono";
  version = "1.3.1";

  src = fetchFromGitHub rec {
    owner = "rubjo";
    repo = pname;
    rev = "v${version}";
    sha256 = "0lrdz7vxpk1lpp5f34nsgmmd9381cpxcrwh8j59jbi80l014iq37";

  # Upstream prefers we download from the website,
  # but we really insist on a more versioned resource.
  # Happily, tagged releases on github contain the same
  # file `VictorMonoAll.zip` as from the website,
  # so we extract it from the tagged release.
  # Both methods produce the same file, but this way
  # we can safely reason about what version it is.
  postFetch = ''
    tar xvf $downloadedFile --strip-components=2 ${pname}-${version}/public/VictorMonoAll.zip
  '';
  };


  meta = with lib; {
    description = "Free programming font with cursive italics and ligatures";
    homepage = "https://rubjo.github.io/victor-mono";
    license = with licenses; [ mit ];
    maintainers = with maintainers; [ jpotier dtzWill ];
    platforms = platforms.all;
  };
}

