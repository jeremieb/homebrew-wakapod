# Wakapod Homebrew Tap

This is the official Homebrew tap for [Wakapod Terminal](https://github.com/jeremieb/wakapod-terminal).

Once the first release is published:

```sh
brew tap jeremieb/wakapod
brew install wakapod
```

Upgrade with `brew upgrade wakapod`; remove it with `brew uninstall wakapod`.

The formula installs upstream-built, checksummed macOS archives for Apple silicon and Intel. It does not build from source because the release client key is injected only in Wakapod's release CI. For optional Opus playback, install `mpv`:

```sh
brew install mpv
```
