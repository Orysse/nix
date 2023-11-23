# sddm-rose-pine.nix

{ 
  stdenv
, fetchFromGitHub
}:

stdenv.mkDerivation {
  pname = "discord-screenaudio";
  version = "1.9.2";
  dontBuild = true;

  src = fetchFromGitHub {
    owner = "maltejur";
    repo = "discord-screenaudio";
    rev = "v1.9.2";
    sha256 = "+WOdazvkzpOKcoayk36VLq/6lLOHDWkDykDsy8p87JE=";
  };

  buildPhase = ''
    cmake -B build
    cmake --build build --config Release
    '';

  installPhase = ''
    mkdir -p $out/bin
    cp -aR $src $out/bin
  '';
}
