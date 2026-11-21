#!/usr/bin/env bash
# Compile-based test runner. tests/pass/*.typ must compile (they use #assert);
# tests/fail/*.typ must fail with the message given on their `// expect:` line.
# Usage: tests/run.sh [extra typst args, e.g. --font-path fonts]
set -uo pipefail
cd "$(dirname "$0")/.."
TYPST="${TYPST:-typst}"
out="$(mktemp -d)"
status=0
shopt -s nullglob
for f in tests/pass/*.typ; do
  if "$TYPST" compile --root . "$@" "$f" "$out/out.pdf" 2>"$out/err"; then
    echo "ok    $f"
  else
    echo "FAIL  $f"; cat "$out/err"; status=1
  fi
done
for f in tests/fail/*.typ; do
  expected="$(sed -n 's|^// expect: ||p' "$f")"
  if "$TYPST" compile --root . "$@" "$f" "$out/out.pdf" 2>"$out/err"; then
    echo "FAIL  $f (compiled, expected error: $expected)"; status=1
  elif grep -qF -- "$expected" "$out/err"; then
    echo "ok    $f"
  else
    echo "FAIL  $f (wrong error, expected: $expected)"; cat "$out/err"; status=1
  fi
done
rm -rf "$out"
exit $status
