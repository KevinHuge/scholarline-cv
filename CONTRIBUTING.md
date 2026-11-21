# Contributing

Scholarline CV welcomes issues and pull requests.

1. Discuss major API changes in an issue.
2. Keep the public examples anonymous and avoid personal contact information.
3. Keep the core minimal: prefer a plugin or a component built on the public primitives over a new `cv()` option. Add a test for any new feature.
4. Run `tests/run.sh --font-path fonts` and compile `main.typ` and `examples/*.typ` with `--root .`.
5. For visual changes, run `assets/gallery/build.sh` and commit the updated `assets/images/`.

Priorities: readable APIs, accessible PDF text, stable pagination, user-controlled contact links and academic publication formatting.

All contributions are MIT licensed.
