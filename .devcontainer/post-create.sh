#!/usr/bin/env bash
set -euo pipefail

echo "[post-create] Starting Codespace setup..."

# Ensure curl is available
if ! command -v curl >/dev/null 2>&1; then
  echo "[post-create][error] curl is not installed; cannot install uv." >&2
  exit 1
fi

# Configure where uv will be installed.
# Keeping this in the user's home directory avoids system-wide changes.
export UV_INSTALL_DIR="$HOME/.local/bin"
mkdir -p "$UV_INSTALL_DIR"

# Optional: pin a version for reproducibility
# export UV_VERSION="0.4.21"  # Update to the latest stable version as of early 2025

echo "[post-create] Installing uv into ${UV_INSTALL_DIR}..."
if ! curl -LsSf https://astral.sh/uv/install.sh | sh; then
  echo "[post-create][error] Failed to install uv." >&2
  exit 1
fi

# Ensure ~/.local/bin is on PATH for future shells
BASHRC="$HOME/.bashrc"
PATH_SNIPPET='export PATH="$HOME/.local/bin:$PATH"'

if ! grep -Fq "$PATH_SNIPPET" "$BASHRC" 2>/dev/null; then
  echo "[post-create] Adding ~/.local/bin to PATH in ${BASHRC}..."
  {
    echo ""
    echo "# Added by .devcontainer/post-create.sh for uv"
    echo "$PATH_SNIPPET"
  } >> "$BASHRC"
else
  echo "[post-create] ~/.local/bin is already on PATH in ${BASHRC}."
fi

# Verify installation
if "$UV_INSTALL_DIR/uv" --version >/dev/null 2>&1; then
  echo "[post-create] uv installed successfully:"
  "$UV_INSTALL_DIR/uv" --version
else
  echo "[post-create][error] uv appears not to be installed correctly." >&2
  exit 1
fi

echo "[post-create] Setup complete."