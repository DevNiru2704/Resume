#!/usr/bin/env bash
# Build every Markdown study document in this folder into a PDF.
# Usage: ./build.sh            (builds all *.md)
#        ./build.sh 04_dsa...  (builds one file, with or without .md)

set -euo pipefail
cd "$(dirname "$0")"

build_one() {
  local md="$1"
  local pdf="${md%.md}.pdf"
  echo "==> $md -> $pdf"
  pandoc "$md" -o "$pdf" \
    --pdf-engine=xelatex \
    --highlight-style=tango \
    --toc --toc-depth=2 \
    -H header.tex \
    -V geometry:margin=0.85in \
    -V fontsize=11pt \
    -V linkcolor=blue \
    -V urlcolor=blue \
    -V toccolor=black \
    -V colorlinks=true \
    -V linestretch=1.12
}

if [ "$#" -ge 1 ]; then
  arg="$1"
  [ "${arg%.md}" = "$arg" ] && arg="$arg.md"
  build_one "$arg"
else
  for md in [0-9]*.md; do
    build_one "$md"
  done
fi

echo "Done."
