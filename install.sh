#!/usr/bin/env bash
# One-line installer for the AutoPM CLI (@jacfrost/autopm).
#
#   curl -fsSL https://raw.githubusercontent.com/juntaochi/homebrew-autopm/main/install.sh | bash
#
# AutoPM is a Node.js CLI, so Node/npm must be present. This script installs
# the published npm package globally and links the `autopm` command.
set -euo pipefail

PKG="@jacfrost/autopm"
MIN_NODE_VERSION="22.19.0"

if ! command -v node >/dev/null 2>&1; then
  echo "error: Node.js ${MIN_NODE_VERSION} or newer is required but was not found." >&2
  echo "  - macOS:  brew install node" >&2
  echo "  - or download from https://nodejs.org" >&2
  echo "Then re-run this installer." >&2
  exit 1
fi

NODE_VERSION="$(node -p 'process.versions.node')"
if ! node -e '
const current = process.versions.node.split(".").map(Number);
const minimum = process.argv[1].split(".").map(Number);
const differingPart = current.findIndex((part, index) => part !== minimum[index]);
process.exit(differingPart === -1 || current[differingPart] > minimum[differingPart] ? 0 : 1);
' "$MIN_NODE_VERSION"; then
  echo "error: Node.js ${MIN_NODE_VERSION} or newer is required; found ${NODE_VERSION}." >&2
  echo "Upgrade Node.js, then re-run this installer." >&2
  exit 1
fi

if ! command -v npm >/dev/null 2>&1; then
  echo "error: npm is required but was not found." >&2
  echo "Install npm for Node.js ${NODE_VERSION}, then re-run this installer." >&2
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
  echo "To update later:  npm install -g ${PKG}@latest"
  echo "Or re-run this installer; it installs the latest published npm package."
else
  echo "Installed ${PKG}, but 'autopm' is not on your PATH." >&2
  echo "Ensure your npm global bin dir is on PATH:  npm bin -g" >&2
  echo "To update later:  npm install -g ${PKG}@latest" >&2
fi
