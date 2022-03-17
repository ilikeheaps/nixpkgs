{ stdenv
, dpkg
, fetchurl
, autoPatchelfHook
}:

stdenv.mkDerivation rec {
  pname = "renode";
  version = "1.12";

  src = fetchurl {
    url = "https://github.com/renode/renode/releases/download/v1.12.0/renode_1.12.0_amd64.deb";
    sha256 = "0rbla9fj1cc248q7579rvhqgq7ayf6f4j031c6b65iwxgp9nwavb";
  };

  unpackCmd = "${dpkg}/bin/dpkg-deb -x $curSrc .";
  sourceRoot = ".";

  nativeBuildInputs = [
    autoPatchelfHook
  ];

  buildInputs = [
  ];

  runtimeDependencies = [
  ];

  installPhase = ''
    mkdir -p $out
    cp -r . $out/
  '';

}