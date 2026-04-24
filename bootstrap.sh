#!/usr/bin/env bash
set -euo pipefail

# ─────────────────────────────────────────────
#  NixOS Bootstrap
#  Repo: https://github.com/CJBuchel/nixos-config
# ─────────────────────────────────────────────

REPO_URL="https://github.com/CJBuchel/nixos-config"
REPO_DIR="$HOME/nixos-config"

# ── Colours ──────────────────────────────────
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
CYAN='\033[0;36m'
NC='\033[0m'

info()    { echo -e "${CYAN}[bootstrap]${NC} $*"; }
success() { echo -e "${GREEN}[ok]${NC} $*"; }
warn()    { echo -e "${YELLOW}[warn]${NC} $*"; }
die()     { echo -e "${RED}[error]${NC} $*" >&2; exit 1; }

# ── Require root ─────────────────────────────
[[ $EUID -eq 0 ]] || die "Run as root: sudo bash bootstrap.sh"

# ── Detect hostname ──────────────────────────
if [[ -z "${NIXOS_HOST:-}" ]]; then
  DETECTED_HOST=$(hostname)
  warn "NIXOS_HOST not set. Detected hostname: '${DETECTED_HOST}'"
  warn "If this doesn't match a nixosConfigurations entry, override with:"
  warn "  sudo NIXOS_HOST=your-hostname bash bootstrap.sh"
  read -rp "Continue with '${DETECTED_HOST}'? [y/N] " confirm
  [[ "$confirm" =~ ^[Yy]$ ]] || die "Aborted. Set NIXOS_HOST and retry."
  NIXOS_HOST="$DETECTED_HOST"
fi

info "Target host: ${NIXOS_HOST}"

# ── Ensure git is available ───────────────────
if ! command -v git &>/dev/null; then
  info "git not found — entering nix-shell to get it..."
  # Re-execute this script inside a nix-shell with git
  exec nix-shell -p git --run "sudo NIXOS_HOST=${NIXOS_HOST} bash $0"
fi

success "git available: $(git --version)"

# ── Clone repo ────────────────────────────────
if [[ -d "$REPO_DIR/.git" ]]; then
  warn "Repo already exists at ${REPO_DIR}, pulling latest..."
  git -C "$REPO_DIR" pull
else
  info "Cloning ${REPO_URL} → ${REPO_DIR}..."
  # Clone as the real user if SUDO_USER is set, else root
  CLONE_USER="${SUDO_USER:-root}"
  if [[ "$CLONE_USER" != "root" ]]; then
    sudo -u "$CLONE_USER" git clone "$REPO_URL" "$REPO_DIR"
  else
    git clone "$REPO_URL" "$REPO_DIR"
  fi
fi

success "Repo ready at ${REPO_DIR}"

# ── Generate hardware config ──────────────────
info "Generating hardware-configuration.nix..."
nixos-generate-config
success "Hardware config written"

# ── Verify flake has the target host ─────────
info "Checking flake outputs for '${NIXOS_HOST}'..."
if ! nix flake show "${REPO_DIR}" 2>/dev/null | grep -q "$NIXOS_HOST"; then
  warn "Could not confirm '${NIXOS_HOST}' in flake outputs."
  warn "Either the flake check failed or the hostname isn't defined yet."
  warn "Attempting rebuild anyway — it will error clearly if the host is missing."
fi

# ── Rebuild and switch ────────────────────────
info "Running nixos-rebuild switch --flake ${REPO_DIR}#${NIXOS_HOST}..."
nixos-rebuild switch --flake "${REPO_DIR}#${NIXOS_HOST}"
