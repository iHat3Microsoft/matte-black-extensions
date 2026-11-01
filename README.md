# Matte Black Extensions

Complete **GTK3**, **GTK4 / Libadwaita**, **Qt (qt6ct / KDE)**, **Flatpak**, **Browser (Zen / Firefox)**, and **Telegram** theme extensions based on the [Matte Black Theme for Omarchy](https://github.com/tahayvr/matte-black-theme).

---

## 🎨 Color Palette & Philosophy

This extension faithfully follows the Matte Black palette with warm amber / gold accents derived from the official palette gradient (`#b91c1c` → `#ffaa0a`):

| Element | Hex Color | Description |
| :--- | :--- | :--- |
| **Window Background** | `#121212` | Pure matte black base |
| **Headerbars / Sidebars** | `#161616` | Subtle contrast for app navigation and title bars |
| **Menus / Popovers / Cards**| `#1a1a1a` | Elevated surface for menus, dropdowns, and cards |
| **Borders & Dividers** | `#222222` / `#282828` | Clean, non-distracting borders |
| **Primary Text** | `#ebebeb` | Soft high-contrast foreground text |
| **Disabled / Dim Text** | `#9a9a9a` | Readable muted text in menus and inactive items |
| **Accent / Selection** | `#e68e0d` | Warm amber highlight matching the theme gradient |
| **Success** | `#ffc107` | Amber / yellow indication |
| **Destructive / Warning** | `#b91c1c` / `#d35f5f` | Palette crimson red |

---

## 🛠️ Issues Solved & Features

1. **GTK3 Menu Readability (virt-manager & others):**
   - Fixes dark-on-dark unreadable disabled menu items and submenus by applying consistent `#9a9a9a` foreground with proper contrast.
   - Refined checkboxes and radio toggles inside menus (`check:checked`, `check:disabled`).

2. **No Blue Focus Rings (Adwaita cleanup):**
   - Eliminates standard blue Adwaita focus outlines and `box-shadow: inset` on text entries, keyring / password prompts (`gcr-prompter`), spin buttons, and treeview entries. All focus indicators now use the unified amber accent (`#e68e0d`).

3. **GTK4 / Libadwaita (Nautilus, etc.):**
   - Proper contrast between Nautilus navigation sidebar (`#161616`) and main file view (`#121212`).
   - Unified search and pathbar background styling.

4. **Qt / KDE Applications:**
   - Standalone `MatteBlack.colors` color scheme for KDE Plasma, `qt6ct`, and `qt5ct`.
   - Matching window, view, button, and highlight palette.

5. **Flatpak Compatibility:**
   - Global override configuration allowing Flatpak applications to read host GTK theme overrides.

6. **Browser Address Bar & Selection (Zen / Firefox):**
   - Fixes the address bar / URL bar highlight turning blue when selecting text.
   - Sets GTK system accent color and `userChrome.css` selection overrides to `#e68e0d`.

7. **Telegram Desktop:**
   - Ready-to-use `matte-black.tdesktop-theme` matching the desktop aesthetics.

---

## 🚀 Installation

### Automated

Clone the repository and run the installer:

```bash
git clone https://github.com/iHat3Microsoft/matte-black-extensions.git
cd matte-black-extensions
chmod +x install.sh
./install.sh
```

### Manual Installation

#### 1. GTK3 & GTK4
```bash
# GTK3
mkdir -p ~/.config/gtk-3.0
cp gtk-3.0/gtk.css ~/.config/gtk-3.0/
cp gtk-3.0/settings.ini ~/.config/gtk-3.0/

# GTK4 / Libadwaita
mkdir -p ~/.config/gtk-4.0
cp gtk-4.0/gtk.css ~/.config/gtk-4.0/
cp gtk-4.0/settings.ini ~/.config/gtk-4.0/
```

#### 2. Qt (qt6ct / KDE)
```bash
mkdir -p ~/.local/share/color-schemes
cp qt/MatteBlack.colors ~/.local/share/color-schemes/
```
In `qt6ct` or KDE System Settings, select **Matte Black** as your color scheme.

#### 3. Flatpak Theme Passthrough
```bash
flatpak override --user --filesystem=xdg-config/gtk-3.0:ro --filesystem=xdg-config/gtk-4.0:ro
```

#### 4. Zen / Firefox Selection Fix
Copy `browser/user.js` and `browser/userChrome.css` into your browser profile folder (e.g. `~/.config/zen/<profile>/` or `~/.mozilla/firefox/<profile>/chrome/`).

#### 5. Telegram
Send or open `telegram/matte-black.tdesktop-theme` in Telegram Desktop and click **Apply Theme**.

---

## 🔗 Credits & Reference

- Original theme: [tahayvr/matte-black-theme](https://github.com/tahayvr/matte-black-theme)
- Built for [Omarchy Linux](https://omarchy.org/) and Hyprland / dark desktop environments.
