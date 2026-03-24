# rtff

Small CLI utility that prints the latest Git tag in the current repository.

## Usage

```bash
rtff
```

## Install

From the project directory:

```bash
./install.sh
source ~/.zshrc
```

## Behavior

- Prints the most recent tag by tag creation date.
- Prints a clear error message if `git` is not installed.
- Prints a clear error message if you are not inside a Git repository.
- Prints an info message if the repository has no tags.
