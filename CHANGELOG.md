# Changelog

All notable changes to this project are documented in this file.

## [0.1.0] - 2026-03-24

### Changed
- Deduplicated arrow-key menu into `arrow_menu_interactive`.
- Respect **`NO_COLOR`** to disable ANSI colors.

### Added
- Interactive **add remote** (`git remote add`) when you push but no remotes exist.
- Initial `rtff` CLI with heavy-metal interactive release flow.
- Arrow-key release mode selection for `major`, `minor`, and `patch`.
- First-commit helper flow for repos with no `HEAD`.
- Semver-based latest tag detection (`vX.Y.Z` and `X.Y.Z`).
- Push flow with remote selection (`origin` when present) and push confirmation.
- Optional tag message for annotated tags (`git tag -a`).
- Installer script (`install.sh`) and themed README.
