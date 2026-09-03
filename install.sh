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

mkdir -p "$TARGET_DIR"
chmod +x "$SCRIPT_DIR/manx"
ln -sf "$SCRIPT_DIR/manx" "$TARGET_BIN"
ln -sf "$SCRIPT_DIR/manx" "$TARGET_ALIAS"

echo -e "  ${C_SUCC}✔${NC} Linked binary to ${C_BOLD}$TARGET_BIN${NC}"
echo -e "  ${C_SUCC}✔${NC} Linked fast alias to ${C_BOLD}$TARGET_ALIAS${NC}"
echo -e "  ${C_SUCC}✔${NC} Launch ${C_ACCENT}manx${NC} or ${C_ACCENT}mx${NC} from any terminal.\n"
