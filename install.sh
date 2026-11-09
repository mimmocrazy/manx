#!/usr/bin/env bash
set -e

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
TARGET_DIR="$HOME/.local/bin"
TARGET_BIN="$TARGET_DIR/manx"
TARGET_ALIAS="$TARGET_DIR/mx"

# --- INIT COLORS (command-not-found / Tokyo Night standard) ---
C_HEAD='\033[1;38;5;111m'
C_BOLD='\033[1m'
C_SUCC='\033[38;5;150m'
C_OPT='\033[38;5;103m'
C_ACCENT='\033[1;38;5;141m'
NC='\033[0m'

echo -e "\n ${C_HEAD}::${NC} ${C_BOLD}Installing manx (Modern Interactive CLI Manual & Cheatsheet)...${NC}"

# --- DEPENDENCIES: fzf (required for the interactive TUI) ---
if ! command -v fzf >/dev/null 2>&1; then
    echo -e "  ${C_OPT}…${NC} fzf not found, installing..."
    SUDO=""
    if [ "$(id -u)" -ne 0 ] && command -v sudo >/dev/null 2>&1; then SUDO="sudo"; fi
    if command -v apt-get >/dev/null 2>&1; then
        $SUDO apt-get install -y fzf
    elif command -v dnf >/dev/null 2>&1; then
        $SUDO dnf install -y fzf
    elif command -v pacman >/dev/null 2>&1; then
        $SUDO pacman -S --noconfirm fzf
    elif command -v zypper >/dev/null 2>&1; then
        $SUDO zypper install -y fzf
    elif command -v apk >/dev/null 2>&1; then
        $SUDO apk add fzf
    elif command -v brew >/dev/null 2>&1; then
        brew install fzf
    elif command -v git >/dev/null 2>&1; then
        # Fallback: user-local install, no root needed
        git clone --depth 1 https://github.com/junegunn/fzf.git "$HOME/.fzf"
        "$HOME/.fzf/install" --bin
        mkdir -p "$TARGET_DIR"
        ln -sf "$HOME/.fzf/bin/fzf" "$TARGET_DIR/fzf"
    fi
    if command -v fzf >/dev/null 2>&1 || [ -x "$TARGET_DIR/fzf" ]; then
        echo -e "  ${C_SUCC}✔${NC} fzf installed"
    else
        echo -e "  ${C_OPT}!${NC} Could not install fzf automatically. Please install it manually." >&2
    fi
else
    echo -e "  ${C_SUCC}✔${NC} fzf already installed"
fi

mkdir -p "$TARGET_DIR"
chmod +x "$SCRIPT_DIR/manx"
ln -sf "$SCRIPT_DIR/manx" "$TARGET_BIN"
ln -sf "$SCRIPT_DIR/manx" "$TARGET_ALIAS"

echo -e "  ${C_SUCC}✔${NC} Linked binary to ${C_BOLD}$TARGET_BIN${NC}"
echo -e "  ${C_SUCC}✔${NC} Linked fast alias to ${C_BOLD}$TARGET_ALIAS${NC}"
echo -e "  ${C_SUCC}✔${NC} Launch ${C_ACCENT}manx${NC} or ${C_ACCENT}mx${NC} from any terminal.\n"
