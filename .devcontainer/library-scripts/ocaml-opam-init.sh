#!/bin/sh
set -eu
set -x
username=${USERNAME}
uid=$(id -u ${username})
gid=$(id -g ${username})
chroot --skip-chdir --userspec=$uid:$gid / sh -eux <<'_EOS_'
env
opam init --disable-sandboxing -a
opam switch create 4.12.1
eval $(opam config env)
which ocaml;ocaml -version
opam install -y dune
_EOS_
