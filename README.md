# manx

> Modern unified CLI documentation, interactive cheatsheets, and command explainer.

`manx` sostituisce la verbosità dei manuali tradizionali unendo in un'unica interfaccia ad alte prestazioni oltre **7.400 schede pratiche TLDR**, **10.800+ manuali di sistema `man`**, shell builtins di Bash, cheat sheet comunitari via **cheat.sh** e scomposizione sintattica con **Mankier Explain**.

---

## Highlights

| Feature | Details |
| :--- | :--- |
| **Performance** | **0.004 s** index scan &middot; risposte locali e da cache a **0.000 ms** |
| **Offline First** | **7.400+** cheatsheet TLDR locali + **10.800+** pagine `man` integrate |
| **Zero Dependencies** | **100% Python 3 standard library** (nessun pacchetto pip o venv richiesto) |
| **Interactive FZF TUI** | Navigazione a due livelli: ricerca globale e **Snippet Picker** istantaneo |
| **Clipboard Engine** | Copia istantanea con `wl-copy` (Wayland), `xclip` (X11) e sequenze ANSI **OSC 52** (SSH/tmux) |
| **Smart Explain** | Scomposizione e analisi di flag e pipeline complesse (online & offline) |
| **Tokyo Night Style** | Palette pastello coerente a 256 colori conforme a `tool_design.md` |

---

## Interactive Interface

```text
┌────────────────────────────────────────┐   ┌──────────────────────────────────────────────────────────────┐
│ :: manx ➜                              │   │ :: find — Search for files in a directory hierarchy          │
│ > find                                 │   │   ➜ Docs: https://manned.org/find                            │
│   find                 [tldr]          │   │                                                              │
│   finger               [man]           │   │ :: Top Cheatsheet & Practical Examples                       │
│   firefox              [man]           │   │   [1] Find files by extension                                │
│   firewall-cmd         [man]           │   │       ➜ find path/to/directory -name '*.ext'                 │
│                                        │   │   [2] Find by size                                           │
│                                        │   │       ➜ find path/to/directory -maxdepth 1 -size +500k       │
└────────────────────────────────────────┘   └──────────────────────────────────────────────────────────────┘
                       │
             (Premi Invio su 'find')
                       ▼
┌───────────────────────────────────────────────────────────────────────────────────────────────────────────┐
│ ➜ find snippet:                                                                                           │
│ > [1] find path/to/directory -name '*.ext'                      :: Find files by extension                │
│   [2] find path/to/directory -path '*/path/*/*.ext'             :: Find files matching multiple patterns  │
│   [3] find path/to/directory -type d -iname '*lib*'             :: Find directories case-insensitive      │
│   [4] find path/to/directory -name '*.ext' -exec wc -l {} \;    :: Run command for each file              │
│   [0] 📖 Open Full System Manual (man find)                     :: Complete reference                     │
└───────────────────────────────────────────────────────────────────────────────────────────────────────────┘
                       │
             (Premi Invio sullo snippet)
                       ▼
  ✔ Copied to clipboard:
  find path/to/directory -name '*.ext'
```

---

## Quick Start

### Installazione (one-liner)

```bash
git clone https://github.com/mimmocrazy/manx.git ~/.local/share/manx && ~/.local/share/manx/install.sh
```

Clona il repo in `~/.local/share/manx`, installa `fzf` se manca (apt, dnf, pacman, zypper, apk, brew o fallback in `~/.fzf`) e crea i symlink `manx` e `mx` in `~/.local/bin` (assicurati che sia nel tuo `PATH`).

### Aggiornamento

```bash
git -C ~/.local/share/manx pull
```

### Utilizzo

```bash
manx          # TUI interattiva globale
mx find       # alias rapido: snippet picker per "find"
```

---

## CLI Commands

| Command | Action |
| :--- | :--- |
| `manx` / `mx` | Apre la TUI interattiva `fzf` globale con tutti i 12.000+ comandi di sistema |
| `manx <cmd> [query]` | Apre lo **Snippet & Options Picker** (es. `mx find perm` filtra subito su `-perm`) |
| `manx -p, --print <cmd> [q]` | Stampa la scheda o i flag cercati direttamente nel terminale in modo statico |
| `manx -m, --man <cmd>` | Apre la man page completa formattata con `bat` o `less -R` in fullscreen |
| `manx -w, --web <cmd>` | Consulta i cheat sheet della community da `cheat.sh` |
| `manx explain "<cmd-line>"` | Scompone e spiega il significato di ogni singolo flag della riga di comando |
| `manx search "<query>"` | Ricerca semantica/full-text su 7.400+ schede (es. `mx search "extract tar"`) |
| `manx --update` | Aggiorna la cache locale TLDR, man e opzioni |
| `manx -h, --help` | Mostra la guida dei comandi e delle scorciatoie |

---

## Interactive Shortcuts (FZF)

| Shortcut | Action |
| :--- | :--- |
| `[Enter]` | Copia istantaneamente lo snippet o il flag selezionato negli appunti e lo stampa a terminale |
| `[Alt-M / Ctrl-P]` | Mostra il **Manuale Completo di Sistema (`man`)** formattato a colori direttamente nella preview |
| `[Ctrl-T]` | Ripristina l'anteprima laterale sulla scheda unificata **TLDR Cheatsheet** |
| `[Ctrl-W]` | Switcha l'anteprima laterale sui cheat sheet online di **`cheat.sh`** |
| `[Ctrl-O]` | Apre il manuale completo nel pager a schermo intero (`bat` / `less`) |
| `[Ctrl-Y]` | Copia istantaneamente il comando d'esempio principale negli appunti ed esce |
| `[Esc]` | Chiude la schermata interattiva lasciando la scheda stampata nel terminale |

---

## License

Distributed under the [MIT License](LICENSE). Copyright © 2026 Mimmo.
