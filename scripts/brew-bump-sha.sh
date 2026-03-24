#!/usr/bin/env bash
# Usage: ./scripts/brew-bump-sha.sh <github_username> <version_without_v>
# Example: ./scripts/brew-bump-sha.sh octocat 0.1.0
# Prints sha256 for the GitHub source tarball — paste into Formula/rtff.rb.

set -euo pipefail

if [ "${#}" -ne 2 ]; then
  echo "Usage: $0 <github_username> <version_without_v>" >&2
  echo "Example: $0 octocat 0.1.0" >&2
  exit 1
fi

user="$1"
ver="$2"
url="https://github.com/${user}/rtff/archive/refs/tags/v${ver}.tar.gz"

echo "URL: ${url}" >&2
echo "sha256:" >&2
curl -fsL "${url}" | shasum -a 256 | awk '{print $1}'
