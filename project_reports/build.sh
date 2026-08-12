#!/usr/bin/env bash
# Build every Markdown report in this folder into a PDF.
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
    -V colorlinks=true \
    -V linestretch=1.12
}

if [ "$#" -ge 1 ]; then
  arg="$1"; [ "${arg%.md}" = "$arg" ] && arg="$arg.md"
  build_one "$arg"
else
  for md in *.md; do build_one "$md"; done
fi
echo "Done."
