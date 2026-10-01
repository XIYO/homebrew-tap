---
uuid: 01a0f39a-bc17-7392-934b-9da7a8b9d986
type: guide
audience: People installing XIYO command-line tools through Homebrew.
goal: Install and verify Sherpa and add its agent skills separately.
tone: Plain English with short steps and exact commands.
manner: Keep CLI and plugin setup distinct and link to the product guide.
---

# XIYO Homebrew tap

Homebrew Formulae for XIYO command-line software.

## Sherpa

Sherpa provides local planning and context tools on Apple Silicon Macs.
It requires macOS 14 or later.

```bash
brew install xiyo/tap/sherpa
sherpa --version
sherpa --help
```

The CLI and agent skills are installed separately. Choose your host.

For Claude Code:

```bash
claude plugin marketplace add https://github.com/XIYO/sherpa.git
claude plugin install sherpa@sherpa
```

For Codex:

```bash
codex plugin marketplace add https://github.com/XIYO/sherpa.git
codex plugin add sherpa@sherpa
```

Open sessions keep the plugin version they loaded. Sherpa asks for macOS
Calendar, Reminders, or automation access when a command needs it.
See the [Sherpa guide](https://github.com/XIYO/sherpa#readme) for commands,
permissions, and the CLI/plugin version contract.

Update or remove the CLI with:

```bash
brew update
brew upgrade xiyo/tap/sherpa
brew uninstall sherpa
```

Removing the CLI does not remove the agent plugin.
