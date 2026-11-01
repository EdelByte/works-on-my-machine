#!/usr/bin/env bash
set -euo pipefail

if ! command -v dnf >/dev/null 2>&1; then
  echo "Error: dnf is required." >&2
  exit 1
fi

sudo dnf install -y dnf-plugins-core
sudo dnf config-manager addrepo \
  --from-repofile=https://brave-browser-rpm-release.s3.brave.com/brave-browser.repo

sudo rpm --import https://releases.warp.dev/linux/keys/warp.asc
sudo tee /etc/yum.repos.d/warpdotdev.repo >/dev/null <<'EOF'
[warpdotdev]
name=warpdotdev
baseurl=https://releases.warp.dev/linux/rpm/stable
enabled=1
gpgcheck=1
gpgkey=https://releases.warp.dev/linux/keys/warp.asc
EOF

sudo dnf install -y brave-browser warp-terminal qbittorrent gh
