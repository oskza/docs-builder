#!/bin/bash
set -e

rm -rf pdf
mkdir -p pdf

find docs -type f -name "*.md" | while read -r f; do
  name=$(basename "$f" .md)

  pandoc "$f" \
    -o "pdf/${name}.pdf" \
    --pdf-engine=xelatex \
    --resource-path="docs:img" \
    -V mainfont="DejaVu Serif" \
    -V sansfont="DejaVu Sans" \
    -V monofont="DejaVu Sans Mono" \
    -V header-includes="\pagenumbering{gobble}" \
    -V geometry:margin=1in
done
