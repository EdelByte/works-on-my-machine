#!/usr/bin/env bash
set -euo pipefail

DOTFILES_DIR="$(cd "$(dirname "$0")" && pwd)"

files=(".gitconfig")

for f in "${files[@]}"; do
  src="$DOTFILES_DIR/$f"
  dest="$HOME/$f"

  if [ -e "$dest" ] && [ ! -L "$dest" ]; then
    echo "Backing up existing $dest -> ${dest}.bak"
    mv "$dest" "${dest}.bak"
  fi

  ln -sf "$src" "$dest"
  echo "Linked $dest -> $src"
done

# Warp terminal
warp_src="$DOTFILES_DIR/warp/settings.toml"
warp_dest="$HOME/.config/warp-terminal/settings.toml"
mkdir -p "$(dirname "$warp_dest")"
if [ -e "$warp_dest" ] && [ ! -L "$warp_dest" ]; then
  echo "Backing up existing $warp_dest -> ${warp_dest}.bak"
  mv "$warp_dest" "${warp_dest}.bak"
fi
ln -sf "$warp_src" "$warp_dest"
echo "Linked $warp_dest -> $warp_src"

# Bash personal config
mkdir -p "$HOME/.bashrc.d"
bash_src="$DOTFILES_DIR/bashrc.d/personal.sh"
bash_dest="$HOME/.bashrc.d/personal.sh"
if [ -e "$bash_dest" ] && [ ! -L "$bash_dest" ]; then
  echo "Backing up existing $bash_dest -> ${bash_dest}.bak"
  mv "$bash_dest" "${bash_dest}.bak"
fi
ln -sf "$bash_src" "$bash_dest"
echo "Linked $bash_dest -> $bash_src"

# Ensure .bashrc sources personal config (cross-distro)
SOURCE_LINE='[ -f ~/.bashrc.d/personal.sh ] && . ~/.bashrc.d/personal.sh'
if ! grep -qF "$SOURCE_LINE" "$HOME/.bashrc" 2>/dev/null; then
  echo "" >> "$HOME/.bashrc"
  echo "$SOURCE_LINE" >> "$HOME/.bashrc"
  echo "Added source line to ~/.bashrc"
fi
