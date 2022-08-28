ARG VARIANT=ubuntu-20.04
FROM mcr.microsoft.com/vscode/devcontainers/base:0-${VARIANT}
COPY library-scripts/ocaml-opam.sh /tmp/library-scripts/
RUN set -eux;\
 sh /tmp/library-scripts/ocaml-opam.sh;\
 apt-get clean -y;rm -rf /var/lib/apt/lists/* /tmp/library-scripts\
 echo DONE
COPY library-scripts/ocaml-opam-init.sh /tmp/library-scripts/
ARG USERNAME=vscode
RUN set -exu;\
 sh /tmp/library-scripts/ocaml-opam-init.sh;\
 apt-get clean -y;rm -rf /var/lib/apt/lists/* /tmp/library-scripts\
 echo DONE
COPY library-scripts/ocaml-opam-packages.sh /tmp/library-scripts/
ARG USERNAME=vscode
RUN set -exu;\
 sh /tmp/library-scripts/ocaml-opam-packages.sh;\
 apt-get clean -y;rm -rf /var/lib/apt/lists/* /tmp/library-scripts\
 echo DON
