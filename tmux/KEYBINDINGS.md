# tmux Keybindings Reference

Prefix is `C-a` (Ctrl+a). All bindings below require prefix unless noted.

## Config Management

| Binding | Action |
|---------|--------|
| `r` | Reload tmux config |
| `m` | Toggle mouse on/off |

## Pane Navigation

| Binding | Action |
|---------|--------|
| `h` | Select pane left (repeatable) |
| `j` | Select pane down (repeatable) |
| `k` | Select pane up (repeatable) |
| `l` | Select pane right (repeatable) |

## Pane Resizing

| Binding | Action |
|---------|--------|
| `H` | Resize pane left by 2 (repeatable) |
| `J` | Resize pane down by 2 (repeatable) |
| `K` | Resize pane up by 2 (repeatable) |
| `L` | Resize pane right by 2 (repeatable) |

## Pane Swapping

| Binding | Action |
|---------|--------|
| `>` | Swap pane with next |
| `<` | Swap pane with previous |

## Splitting (preserves working directory)

| Binding | Action |
|---------|--------|
| `-` | Split vertical (top/bottom) |
| `_` | Split horizontal (left/right) |
| `\|` | Split horizontal (left/right, alt) |

## Window Navigation

| Binding | Action |
|---------|--------|
| `C-h` | Previous window (repeatable) |
| `C-l` | Next window (repeatable) |
| `Tab` | Last active window |
| `+` | Maximize/restore current pane |

## Session Navigation

| Binding | Action |
|---------|--------|
| `C-c` | Create new session |
| `C-f` | Find session by name |
| `Shift+Tab` | Switch to last session |

## Copy Mode (vi)

| Binding | Action |
|---------|--------|
| `Enter` | Enter copy mode |
| `v` | Begin selection (in copy mode) |
| `C-v` | Toggle rectangle selection (in copy mode) |
| `y` | Copy selection and exit (in copy mode) |
| `Escape` | Cancel copy mode |
| `H` | Jump to start of line (in copy mode) |
| `L` | Jump to end of line (in copy mode) |

## Buffer Management

| Binding | Action |
|---------|--------|
| `b` | List paste buffers |
| `p` | Paste from top buffer |
| `P` | Choose buffer to paste |

## Session Persistence (tmux-resurrect)

| Binding | Action |
|---------|--------|
| `C-s` | Save session (provided by resurrect plugin) |
| `C-r` | Restore session (provided by resurrect plugin) |

## No-Prefix Bindings

| Binding | Action |
|---------|--------|
| `C-l` | Clear screen and scroll history |

## Useful Defaults (not custom, but good to know)

| Binding | Action |
|---------|--------|
| `c` | Create new window |
| `&` | Kill current window |
| `x` | Kill current pane |
| `w` | List windows |
| `s` | List sessions |
| `d` | Detach from session |
| `0-9` | Select window by number |
| `z` | Toggle pane zoom (default) |
| `?` | List all keybindings |
| `:` | Command prompt |
