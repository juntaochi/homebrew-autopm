#!/usr/bin/env bash
# One-line installer for the AutoPM CLI (@jacfrost/autopm).
#
#   curl -fsSL https://raw.githubusercontent.com/juntaochi/homebrew-autopm/main/install.sh | bash
#
# AutoPM is a Node.js CLI, so Node/npm must be present. This script installs
# the published npm package globally and links the `autopm` command.
set -euo pipefail

PKG="@jacfrost/autopm"

if ! command -v npm >/dev/null 2>&1; then
  echo "error: npm (Node.js) is required but was not found." >&2
  echo "Install Node.js 18+ first:" >&2
  echo "  - macOS:  brew install node" >&2
  echo "  - or download from https://nodejs.org" >&2
  echo "Then re-run this installer." >&2
  exit 1
fi

echo "Installing ${PKG} globally via npm..."
if npm install -g "$PKG"; then
  :
else
  echo >&2
  echo "Global install failed (often a permissions issue on the npm prefix)." >&2
  echo "Retry with elevated permissions:  sudo npm install -g ${PKG}" >&2
  echo "or configure a user-writable prefix / use nvm:  https://github.com/nvm-sh/nvm" >&2
  exit 1
fi

if command -v autopm >/dev/null 2>&1; then
  echo "Installed. Try:  autopm --help"
else
  echo "Installed ${PKG}, but 'autopm' is not on your PATH." >&2
  echo "Ensure your npm global bin dir is on PATH:  npm bin -g" >&2
fi
