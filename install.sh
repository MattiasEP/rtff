#!/usr/bin/env bash

set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
SOURCE_SCRIPT="${SCRIPT_DIR}/rtff"
TARGET_DIR="${HOME}/bin"
TARGET_SCRIPT="${TARGET_DIR}/rtff"
SHELL_RC="${HOME}/.zshrc"
PATH_LINE='export PATH="$HOME/bin:$PATH"'

path_already_set() {
  local file="$1"

  if command -v rg >/dev/null 2>&1; then
    rg -q '(^|\s)export PATH="\$HOME/bin:\$PATH"' "${file}"
    return $?
  fi

  if command -v grep >/dev/null 2>&1; then
    grep -Eq '(^|[[:space:]])export PATH="\$HOME/bin:\$PATH"' "${file}"
    return $?
  fi

  while IFS= read -r line; do
    if [ "${line}" = "${PATH_LINE}" ]; then
      return 0
    fi
  done < "${file}"

  return 1
}

if [ ! -f "${SOURCE_SCRIPT}" ]; then
  echo "Error: could not find ${SOURCE_SCRIPT}" >&2
  exit 1
fi

mkdir -p "${TARGET_DIR}"
cp "${SOURCE_SCRIPT}" "${TARGET_SCRIPT}"
chmod +x "${TARGET_SCRIPT}"

if [ -f "${SHELL_RC}" ]; then
  if ! path_already_set "${SHELL_RC}"; then
    {
      echo ""
      echo "# Added by rtff installer"
      echo "${PATH_LINE}"
    } >> "${SHELL_RC}"
    echo "Added ~/bin to ${SHELL_RC}."
  fi
else
  {
    echo "# Added by rtff installer"
    echo "${PATH_LINE}"
  } > "${SHELL_RC}"
  echo "Created ${SHELL_RC} and added ~/bin to PATH."
fi

echo "Installed: ${TARGET_SCRIPT}"
echo "Run 'source ${SHELL_RC}' or restart the terminal."
