#!/usr/bin/env bash

set -euo pipefail

# Directory where your repository sits
DOTFILES_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
TARGET_DIR="${HOME}/.config"

# List all app folder names you want to manage
CONFIGS=(
  "niri"
)

mkdir -p "$TARGET_DIR"

for config in "${CONFIGS[@]}"; do
  SRC="${DOTFILES_DIR}/${config}"
  DEST="${TARGET_DIR}/${config}"

  if [ ! -d "$SRC" ]; then
    echo "Warning: Directory $SRC does not exist. Skipping."
    continue
  fi

  # Symlink the entire application folder at once
  ln -sfn "$SRC" "$DEST"
  echo "Linked: $config -> $DEST"
done
