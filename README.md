# XIYO Homebrew tap

Official Homebrew Formulae for XIYO command-line software.

## Sherpa

Sherpa is a local-first macOS personal assistant. It requires macOS 14 or
later.

```bash
brew tap xiyo/tap
brew install xiyo/tap/sherpa
```

Check the installation and inspect supported agent hosts without making
changes:

```bash
sherpa --version
sherpa install --agent-plugin
```

Install the native plugin into a supported host, then start a new agent
session:

```bash
sherpa install --agent-plugin codex
sherpa install --agent-plugin claude
sherpa install --agent-plugin all
```

Update or remove Sherpa with:

```bash
brew update
brew upgrade xiyo/tap/sherpa
brew uninstall sherpa
```
