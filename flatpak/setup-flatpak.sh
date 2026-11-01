#!/usr/bin/env bash
set -e

echo "Configuring Flatpak global overrides for GTK3 / GTK4 theme access..."
mkdir -p ~/.local/share/flatpak/overrides
flatpak override --user --filesystem=xdg-config/gtk-3.0:ro --filesystem=xdg-config/gtk-4.0:ro
echo "Done! Flatpak apps can now read your GTK theme configuration."
