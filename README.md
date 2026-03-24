# RTFF - Release The Fucking Fury

Heavy-metal CLI for tag releases.

> "How can less be more? More is more!" - Yngwie Malmsteen

**Where RTFF comes from:** the name is a shout-out to the moment Yngwie Malmsteen yells *“You released the fucking fury!”* — [watch it on YouTube](https://www.youtube.com/watch?v=KcXCqQ_-gMI) for the full context. This CLI is that energy, but for Git tags.

`rtff` helps you forge and push semver tags without leaving the terminal solo.

## Why This Exists

Tagging releases in Git is simple, but doing it cleanly every single time is not.
`rtff` turns that repeated release ritual into one loud, guided, zero-nonsense flow.

## Quickstart

```bash
./install.sh
source ~/.zshrc
rtff
```

## Install

From the project directory:

```bash
./install.sh
source ~/.zshrc
```

## Usage

```bash
rtff
```

## Demo

![RTFF demo](docs/demo.gif)

## What It Does

- Finds the latest **semver** tag (supports both `v1.2.3` and `1.2.3`).
- Lets you **bump** version with arrow keys and Enter (`major` / `minor` / `patch`).
- Creates the new tag after confirmation.
- Optional **tag message** — if you enter one, RTFF creates an **annotated** tag (`git tag -a`); empty means a lightweight tag.
- Offers to push the tag to a **remote** (`origin` when it exists, or one you pick).

## Full Flow

1. Shows the RTFF heavy-metal banner.
2. Validates git + repository context.
3. If repo has no commits:
   - asks to create the first commit
   - asks for commit message (default: `Initial commit`)
   - asks before staging all files
4. If no semver tags exist:
   - offers to forge the first tag
5. If semver tags exist:
   - shows latest tag
   - asks if you want to bump
6. Shows interactive release mode menu:
   - `major` -> `X+1.0.0`
   - `minor` -> `X.Y+1.0`
   - `patch` -> `X.Y.Z+1`
7. If target tag already exists, RTFF sends you back to choose another bump.
8. Asks for an optional tag message (annotated vs lightweight).
9. Creates tag.
10. Asks whether to push to `origin` or another remote.

## Push Behavior

- Push targets a Git **remote** by name (defaults to `origin` when present).
- If **no remotes** exist, RTFF can walk you through `git remote add` (name + URL) before pushing.
- If one remote exists, RTFF uses it.
- If multiple remotes exist, RTFF lets you choose with arrow keys.
- If `origin` exists, it is preselected.
- If push fails, RTFF tells you and keeps the local tag.

## Notes

- On successful tag flow exit, RTFF signs off with `✈️ See you in Tokyo, bitch!`
- Set **`NO_COLOR`** (to any value) to disable ANSI colors — same idea as [no-color.org](https://no-color.org/).
- Designed for interactive terminal use.
- Non-interactive mode has fallback behavior for menu selection.
- Theme is intentionally loud, fast, and unapologetically metal.

## Known Limitations

- Semver support is intentionally strict to `vX.Y.Z` or `X.Y.Z`.
- First commit flow stages all files when you confirm.
- Push assumes you want one remote per release action (selectable when multiple exist).
