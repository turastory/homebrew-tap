# Homebrew Tap

Personal Homebrew tap for QuickTodo and other tools published by `turastory`.

## Install

```bash
brew tap turastory/tap
brew install --cask quicktodo
```

## Structure

- `Casks/*.rb`: macOS app casks
- `Formula/*.rb`: CLI/package formulas if needed later
- `Scripts/*.sh`: cask 생성/검증 스크립트
- `.github/workflows/*`: cask 검증과 자동 publish workflow

QuickTodo cask is generated from `turastory/quicktodo` releases and validated in CI before or while it is published.
