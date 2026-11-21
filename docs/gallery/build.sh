#!/usr/bin/env bash
# Renders every built-in plugin combination of the sample CVs to PNG.
# Usage: docs/gallery/build.sh [output-dir] [extra typst args]
# Default output: docs/images. Fonts in ./fonts are picked up automatically.
set -euo pipefail
cd "$(dirname "$0")/../.."
out="${1:-docs/images}"
shift || true
mkdir -p "$out"
tmp="$(mktemp -d ./.gallery-XXXXXX)"
trap 'rm -rf "$tmp"' EXIT

# name | source file | plugins dictionary
combos=(
  "default|main.typ|(:)"
  "margin-section|main.typ|(section: margin-section)"
  "underline-links|main.typ|(links: underline-links)"
  "margin-section-underline-links|main.typ|(section: margin-section, links: underline-links)"
  "zh-default|examples/zh.typ|(:)"
  "zh-margin-section|examples/zh.typ|(section: margin-section)"
)

for combo in "${combos[@]}"; do
  IFS='|' read -r name src plugins <<<"$combo"
  file="$tmp/$name.typ"
  # Inject the plugins and point the import at the repository's lib.typ.
  sed -e "s|#show: cv.with(|#show: cv.with(plugins: $plugins,|" \
      -e 's|#import "\(\.\./\)\{0,1\}lib.typ"|#import "/lib.typ"|' "$src" > "$file"
  typst compile --root . --font-path fonts "$@" "$file" "$out/$name.png" --ppi 144
  echo "rendered $out/$name.png"
done

typst compile --root . --font-path fonts "$@" examples/custom-links.typ "$out/custom-plugins.png" --ppi 144
echo "rendered $out/custom-plugins.png"
