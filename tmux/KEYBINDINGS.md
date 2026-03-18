# Tmux Keybindings Reference

## Prefix
`C-a` (replaces default `C-b`)

---

## Sessions
| Key | Action |
|-----|--------|
| `prefix + C-c` | New session |
| `prefix + C-f` | Find/switch session |
| `prefix + BTab` | Last active session |

---

## Windows
| Key | Action |
|-----|--------|
| `prefix + C-h` | Previous window |
| `prefix + C-l` | Next window |
| `prefix + Tab` | Last active window |
| `prefix + C-S-H` | Swap window left |
| `prefix + C-S-L` | Swap window right |

---

## Panes
| Key | Action |
|-----|--------|
| `prefix + -` | Split vertically (pane below) |
| `prefix + _` | Split horizontally (pane right) |
| `prefix + \|` | Split horizontally |
| `prefix + h/j/k/l` | Navigate panes (vim-style, repeatable) |
| `prefix + H/J/K/L` | Resize pane (repeatable) |
| `prefix + <` | Swap with previous pane |
| `prefix + >` | Swap with next pane |
| `prefix + +` | Maximize current pane |

---

## Copy Mode (vi)
| Key | Action |
|-----|--------|
| `prefix + Enter` | Enter copy mode |
| `prefix + Escape` | Enter copy mode |
| `v` | Begin selection |
| `C-v` | Toggle block selection |
| `y` | Yank selection |
| `H` | Jump to start of line |
| `L` | Jump to end of line |
| `Escape` | Exit copy mode |

---

## Clipboard
| Key | Action |
|-----|--------|
| `prefix + y` | Copy buffer to OS clipboard |
| `prefix + b` | List paste buffers |
| `prefix + p` | Paste top buffer |
| `prefix + P` | Choose buffer to paste |

---

## Misc
| Key | Action |
|-----|--------|
| `C-l` (no prefix) | Clear screen + history |
| `prefix + m` | Toggle mouse |
| `prefix + F` | Open fpp (file picker) |
| `prefix + e` | Edit `.tmux.conf.local` |
| `prefix + r` | Reload config |
