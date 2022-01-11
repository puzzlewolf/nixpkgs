{ alsa-lib
, cmake
, docbook_xsl
, fetchFromGitHub
, fftwFloat
, gcc
, gettext
, imagemagick
, includeDemo ? true
, jackaudioSupport ? false
, lib
, libjack2
, libxslt
, perlPackages
, pkg-config
, stdenv
, udev
, wavpack
, wxGTK31
, zip
, zlib
}:

stdenv.mkDerivation rec {
  pname = "grandorgue";
  version = "3.5.0-1";

  src = fetchFromGitHub {
    owner = "GrandOrgue";
    repo = "grandorgue";
    rev = version;
    hash = "sha256:13hb4328cym9n4kwv3i1c1cl6pkayl90rl6c4j1wa8szhwm49300";
    fetchSubmodules = true;
  };

  nativeBuildInputs = [
    cmake
    docbook_xsl
    gettext
    imagemagick
    libxslt
    perlPackages.Po4a
    pkg-config
    zip
  ];

  buildInputs = [
    alsa-lib
    fftwFloat
    pkg-config
    udev
    wavpack
    wxGTK31
    zlib
  ] ++ lib.optional jackaudioSupport libjack2;

  cmakeFlags = [
    "-DDOCBOOK_DIR=${docbook_xsl}/share/xml/docbook-xsl-nons"
  ] ++ lib.optional (!jackaudioSupport) [
    "-DGO_USE_JACK=OFF"
    "-DRTAUDIO_USE_JACK=OFF"
    "-DRTMIDI_USE_JACK=OFF"
  ] ++ lib.optional (!includeDemo) "-DINSTALL_DEMO=OFF";

  meta = {
    description = "Virtual Pipe Organ Software";
    homepage = "https://sourceforge.net/projects/ourorgan";
    license = lib.licenses.gpl2;
    platforms = lib.platforms.linux;
    maintainers = [ lib.maintainers.puzzlewolf ];
  };
}
