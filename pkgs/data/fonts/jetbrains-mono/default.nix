{ lib, fetchzip, mkFont }:

mkFont rec {
  pname = "JetBrainsMono";
  version = "1.0.6";

  src = fetchzip {
    url = "https://github.com/JetBrains/JetBrainsMono/releases/download/v${version}/JetBrainsMono-${version}.zip";
    sha256 = "1198k5zw91g85h6n7rg3y7wcj1nrbby9zlr6zwlmiq0nb37n0d3g";
  };

  meta = with lib; {
    description = "A typeface made for developers";
    homepage = "https://jetbrains.com/mono/";
    license = licenses.asl20;
    maintainers = [ maintainers.marsam ];
    platforms = platforms.all;
  };
}
