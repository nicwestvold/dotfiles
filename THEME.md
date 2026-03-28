# Theme Switching

Four color themes are pre-configured across the stack, commented out and ready to activate.

## Available Themes

| Theme | Style |
|---|---|
| **Tokyo Night** | Cool blues/purples, city lights aesthetic |
| **Catppuccin Macchiato** | Soothing pastels, rich dark variant |
| **Kanagawa Wave** | Warm muted tones, Japanese art inspired |
| **Doom One** | Vibrant, high-contrast (Atom One Dark lineage) |

## Current Active Theme

| Tool | Theme |
|---|---|
| Ghostty | Snazzy |
| Neovim | Tokyo Night Storm |
| tmux | Custom (Snazzy-inspired) |
| bat | Sublime Snazzy |
| fzf | Default |
| Starship | Default |
| delta | Not configured |

## How to Switch

To fully switch themes, uncomment the matching option in each file below and comment out (or remove) the currently active one.

### 1. Ghostty — `ghostty/config`

```
# theme = catppuccin-macchiato
# theme = tokyonight
# theme = kanagawa-wave
# theme = Doom One
theme = Snazzy              # ← currently active
```

Restart Ghostty or open a new window to apply.

### 2. Neovim — `~/.config/nvim/init.lua`

Comment out the active `tokyonight` plugin block and uncomment one of the alternative blocks below it (search for "Theme Options"). Then restart neovim or `:Lazy sync`.

### 3. tmux — `tmux/.tmux.conf`

Uncomment one `source-file` line under "Theme Overrides":

```
# source-file ~/Development/nic/dotfiles/tmux/themes/tokyo-night.conf
# source-file ~/Development/nic/dotfiles/tmux/themes/catppuccin-macchiato.conf
# source-file ~/Development/nic/dotfiles/tmux/themes/kanagawa-wave.conf
# source-file ~/Development/nic/dotfiles/tmux/themes/doom-one.conf
```

The theme file overrides all status bar colors. Reload with `prefix + r`.

### 4. bat — `zsh/.zprofile`

Uncomment one `BAT_THEME` export and comment out the active one. Open a new terminal tab to apply (`.zprofile` runs at login).

Note: Catppuccin and Kanagawa require installing their `.tmTheme` files first — see comments in the file.

### 5. fzf — `zsh/.zshrc`

Uncomment one `FZF_DEFAULT_OPTS` block under "fzf Theme Options". Run `source ~/.zshrc` or open a new tab.

### 6. Starship — `prompt/starship.toml`

Uncomment the `palette = "..."` line AND the matching `[palettes.xxx]` block. Starship picks up changes automatically on next prompt render.

### 7. delta — `~/.gitconfig`

Uncomment the matching `[delta]` block under "delta Theme Options". Requires the corresponding bat `.tmTheme` to be installed first (Catppuccin also needs its gitconfig include).

## Ecosystem Coverage

Not every theme has an official port for every tool.

| Tool | Tokyo Night | Catppuccin | Kanagawa | Doom One |
|---|---|---|---|---|
| Ghostty | Official | Built-in | Official | Built-in |
| Neovim | Official | Official | Official | Community |
| tmux | Custom | Custom | Custom | Custom |
| bat | Needs .tmTheme | Official | Official (wave) | No port |
| fzf | Official | Official | DIY | No port |
| Starship | Manual palette | Official | Manual palette | No port |
| delta | Official | Official | Official (wave) | No port |

"Custom" = hand-rolled theme file in `tmux/themes/` matching the palette.
"No port" = commented placeholder noting the gap.
