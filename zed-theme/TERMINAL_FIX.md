# Fix Oh My Zsh Icons/Powerline in Zed Terminal

Your broken symbols are because Zed needs a **Nerd Font** with powerline glyphs.

## Quick Fix

Add to `~/.config/zed/settings.json`:

```json
{
  "terminal": {
    "font_family": "MesloLGS NF",
    "font_size": 14
  }
}
```

## Install Nerd Font

### Option 1: MesloLGS NF (Recommended for Oh My Zsh)
```bash
# Download from https://github.com/romkatv/powerlevel10k#manual-font-installation
# Or via Homebrew:
brew tap homebrew/cask-fonts
brew install font-meslo-lg-nerd-font
```

### Option 2: Your Current Font + Nerd Patch
If you love Ghostty's font, find its Nerd Font version:
```bash
brew search nerd-font  # List all available
```

Popular options:
- `font-fira-code-nerd-font`
- `font-jetbrains-mono-nerd-font`
- `font-hack-nerd-font`
- `font-iosevka-nerd-font`

## Verify Font Name
After installing, check exact font name:
```bash
fc-list | grep -i "nerd\|powerline"
```

Use that exact name in Zed settings `font_family`.

## Why This Happens
- Ghostty likely auto-patches fonts or has built-in powerline support
- Zed terminal is more basic - needs explicit Nerd Font
- Oh My Zsh themes (Powerlevel10k, Agnoster, etc.) use Unicode glyphs from Nerd Fonts

## Alternative: Simpler Oh My Zsh Theme
If you don't want to change fonts, use a non-powerline theme:
```bash
# Edit ~/.zshrc
ZSH_THEME="robbyrussell"  # No special glyphs needed
```
