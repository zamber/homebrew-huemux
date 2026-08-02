# Homebrew tap for HueMux

[HueMux](https://github.com/zamber/huemux) — screen-synced lights for
Philips Hue. This tap works on macOS (Homebrew) and Linux (Linuxbrew).

## Install

```sh
brew tap zamber/huemux

# the desktop build — a real window, real screen capture
brew install huemux-desktop

# or the plain server — serves the web UI at http://127.0.0.1:7654
brew install huemux
```

First launch of `huemux-desktop` downloads Electron (~150MB) into your OS
cache directory — needs internet access once, cached after that.

## Update

```sh
brew update && brew upgrade huemux-desktop
```

The formulas track the [latest release](https://github.com/zamber/huemux/releases)
automatically: `.github/workflows/auto-bump.yml` in this repo runs every
six hours, and each new huemux release is picked up without a human
touching the tap. Run it sooner with the "Run workflow" button on the
[Actions tab](https://github.com/zamber/huemux-tap/actions) — or locally:

```sh
gh repo clone zamber/homebrew-huemux && cd homebrew-huemux
python3 scripts/bump.py
```

Formulas install the signed release binaries directly, per OS and arch,
with checksums taken from the release's own `SHA256SUMS`.
