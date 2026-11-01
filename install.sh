#!/usr/bin/env bash
set -e

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

echo "=== Matte Black Extensions Installer ==="
echo "Targeting GTK3, GTK4, Qt (qt6ct/KDE), Flatpak, Browser & Telegram"
echo ""

# 1. GTK3
echo "-> Installing GTK3 configuration (~/.config/gtk-3.0)..."
mkdir -p "$HOME/.config/gtk-3.0"
[ -f "$HOME/.config/gtk-3.0/gtk.css" ] && cp "$HOME/.config/gtk-3.0/gtk.css" "$HOME/.config/gtk-3.0/gtk.css.bak.$(date +%s)"
cp "$SCRIPT_DIR/gtk-3.0/gtk.css" "$HOME/.config/gtk-3.0/gtk.css"
[ ! -f "$HOME/.config/gtk-3.0/settings.ini" ] && cp "$SCRIPT_DIR/gtk-3.0/settings.ini" "$HOME/.config/gtk-3.0/settings.ini"

# 2. GTK4
echo "-> Installing GTK4 / Libadwaita configuration (~/.config/gtk-4.0)..."
mkdir -p "$HOME/.config/gtk-4.0"
[ -f "$HOME/.config/gtk-4.0/gtk.css" ] && cp "$HOME/.config/gtk-4.0/gtk.css" "$HOME/.config/gtk-4.0/gtk.css.bak.$(date +%s)"
cp "$SCRIPT_DIR/gtk-4.0/gtk.css" "$HOME/.config/gtk-4.0/gtk.css"
[ ! -f "$HOME/.config/gtk-4.0/settings.ini" ] && cp "$SCRIPT_DIR/gtk-4.0/settings.ini" "$HOME/.config/gtk-4.0/settings.ini"

# 3. Qt / KDE color scheme
if ! command -v qt6ct-kde > /dev/null 2>&1; then
    echo "WARNING: qt6ct-kde not found — Qt/KDE theme (MatteBlack.colors) will NOT be applied."
    echo "         Install it from AUR: yay -S qt6ct-kde"
    echo "         Note: qt6ct-kde conflicts with vanilla qt6ct — remove qt6ct first if installed."
else
    echo "-> Installing Qt color scheme (~/.local/share/color-schemes/MatteBlack.colors)..."
    mkdir -p "$HOME/.local/share/color-schemes"
    cp "$SCRIPT_DIR/qt/MatteBlack.colors" "$HOME/.local/share/color-schemes/MatteBlack.colors"

    if [ -d "$HOME/.config/qt6ct" ]; then
        echo "-> Configuring qt6ct-kde to use MatteBlack.colors..."
        if [ -f "$HOME/.config/qt6ct/qt6ct.conf" ]; then
            sed -i 's|^color_scheme_path=.*|color_scheme_path='"$HOME"'/.local/share/color-schemes/MatteBlack.colors|' "$HOME/.config/qt6ct/qt6ct.conf"
        fi
    fi
fi

# 5. Flatpak
if command -v flatpak >/dev/null 2>&1; then
    read -rp "Apply Flatpak GTK theme permissions? (y/N): " apply_flatpak
    if [[ "$apply_flatpak" =~ ^[Yy]$ ]]; then
        "$SCRIPT_DIR/flatpak/setup-flatpak.sh"
    fi
fi

# 6. Restart portal if running
if systemctl --user is-active xdg-desktop-portal-gtk >/dev/null 2>&1; then
    echo "-> Reloading xdg-desktop-portal-gtk..."
    systemctl --user restart xdg-desktop-portal-gtk || true
fi

echo ""
echo "Installation complete!"
echo "• For Zen / Firefox: Copy files from 'browser/' to your profile directory."
echo "• For Telegram: Open 'telegram/matte-black.tdesktop-theme' in Telegram Desktop."
