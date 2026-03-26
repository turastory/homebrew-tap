# Homebrew Tap

Personal Homebrew tap for QuickTodo and other tools published by `turastory`.

## Install

```bash
brew tap turastory/tap
brew install qc
qc init
```

```bash
brew tap turastory/tap
brew install --cask quicktodo
```

## Structure

- `Casks/*.rb`: macOS app casks
- `Formula/*.rb`: CLI formulas
- `Scripts/*.sh`: cask/formula render and validation scripts
- `.github/workflows/*`: cask/formula validation and publish workflows

QuickTodo cask is generated from `turastory/quicktodo` releases and validated in CI before or while it is published.
The `qc` formula is generated from `turastory/quickcommand` GitHub releases and installs the prebuilt `qc` binary for Apple Silicon macOS.
