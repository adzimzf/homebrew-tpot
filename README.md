# homebrew-tpot
A home brew tap/formula for the tpot

## a-test

A test formula: a tiny Go CLI (`a-test/`) that prints `install succeed`. It installs from a bottle where one exists, or builds from source with Go.

```bash
brew install adzimzf/tpot/a-test                       # bottle
brew install --build-from-source adzimzf/tpot/a-test   # from source
```

To release a version, run the **a-test release** workflow (Actions → a-test release → Run workflow) with a version like `0.1.0`. It creates the `a-test-v<version>` release with the source tarball, builds bottles for macOS (arm64 and Intel) and Linux (x86_64 and arm64), adds them to `Formula/a-test.rb`, pushes that, then checks both install paths.
