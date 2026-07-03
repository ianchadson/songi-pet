#!/usr/bin/env bash
set -euo pipefail

PET_ID="songi-pet"
SCRIPT_DIR="$(CDPATH= cd -- "$(dirname -- "${BASH_SOURCE[0]}")" && pwd)"
TARGET_ROOT="${CODEX_HOME:-$HOME/.codex}/pets"
TARGET_DIR="$TARGET_ROOT/$PET_ID"

for file in pet.json spritesheet.webp; do
  if [ ! -f "$SCRIPT_DIR/$file" ]; then
    printf 'Missing required file: %s\n' "$SCRIPT_DIR/$file" >&2
    exit 1
  fi
done

mkdir -p "$TARGET_DIR"
install -m 0644 "$SCRIPT_DIR/pet.json" "$TARGET_DIR/pet.json"
install -m 0644 "$SCRIPT_DIR/spritesheet.webp" "$TARGET_DIR/spritesheet.webp"

printf 'Installed Songi pet to %s\n' "$TARGET_DIR"
printf 'Files:\n'
printf '  %s\n' "$TARGET_DIR/pet.json"
printf '  %s\n' "$TARGET_DIR/spritesheet.webp"
