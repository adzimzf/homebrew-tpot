# homebrew-tpot
A home brew tap/formula for the tpot

## a-test

A test formula: a tiny Go CLI (`a-test/`) that prints `install succeed` (and its version with `a-test --version`). It installs from a bottle where one exists, or builds from source with Go. `--with-color` builds it from source so the message prints in green.
Intel Macs get no bottle: Homebrew stopped supporting them in September 2026.

```bash
brew install adzimzf/tpot/a-test                       # bottle
brew install --build-from-source adzimzf/tpot/a-test   # from source
brew install --with-color adzimzf/tpot/a-test          # from source, colored output
```

To release a version, run the **a-test release** workflow (Actions → a-test release → Run workflow) with a version like `0.1.0`. It creates the `a-test-v<version>` release with the source tarball, builds bottles for macOS on Apple Silicon and Linux (x86_64 and arm64), adds them to `Formula/a-test.rb`, pushes that, then checks both install paths.
