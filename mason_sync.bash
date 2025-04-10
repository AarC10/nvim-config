#!/bin/bash

# mason-sync.sh
# Usage:
#   ./mason-sync.sh save   - saves current installed Mason packages to mason-packages.txt
#   ./mason-sync.sh restore - restores packages using headless Neovim

MASON_LIST=~/.local/share/nvim/mason/packages
PACKAGE_FILE=mason-packages.txt

save_packages() {
  if [ -d "$MASON_LIST" ]; then
    ls "$MASON_LIST" > "$PACKAGE_FILE"
    echo "✅ Saved Mason packages to $PACKAGE_FILE"
  else
    echo "❌ Mason package directory not found: $MASON_LIST"
  fi
}

restore_packages() {
  if [ ! -f "$PACKAGE_FILE" ]; then
    echo "❌ Package list $PACKAGE_FILE not found!"
    exit 1
  fi

  PACKAGES=$(tr '\n' ' ' < "$PACKAGE_FILE")

  echo "⏳ Installing packages: $PACKAGES"
  nvim --headless "+MasonInstall $PACKAGES" +qall
  echo "✅ Mason packages restored."
}

case "$1" in
  save)
    save_packages
    ;;
  restore)
    restore_packages
    ;;
  *)
    echo "Usage: $0 {save|restore}"
    ;;
esac

