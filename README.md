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

```bash
# 1. Clone repository
git clone https://github.com/mimmocrazy/manx.git ~/Projects/COMMANDS/manx

# 2. Setup executable & global symlinks (manx + mx alias)
chmod +x ~/Projects/COMMANDS/manx/install.sh
~/Projects/COMMANDS/manx/install.sh

# 3. Launch
manx
# oppure con l'alias rapido
mx find
```

---

## CLI Commands

| Command | Action |
| :--- | :--- |
| `manx` / `mx` | Apre la TUI interattiva `fzf` globale con tutti i comandi di sistema |
| `manx <command>` | Apre lo **Snippet Picker** interattivo per il comando con live preview a colori |
| `manx -p, --print <cmd>` | Stampa la scheda cheatsheet statica direttamente nel terminale |
| `manx -m, --man <cmd>` | Apre la man page completa formattata con `bat` o `less -R` |
| `manx -w, --web <cmd>` | Consulta i cheat sheet della community da `cheat.sh` |
| `manx explain "<cmd-line>"` | Scompone e spiega il significato di ogni singolo flag della riga di comando |
| `manx search "<query>"` | Ricerca semantica/full-text su 7.400+ schede (es. `mx search "extract tar"`) |
| `manx --update` | Aggiorna la cache locale delle pagine TLDR e rigenera l'indice di sistema |
| `manx -h, --help` | Mostra la guida dei comandi e delle scorciatoie |

---

## Interactive Shortcuts (FZF)

| Shortcut | Action |
| :--- | :--- |
| `[Enter]` | Seleziona il comando e apre lo **Snippet Picker** per copiare il caso d'uso desiderato |
| `[Ctrl-O]` | Apre il manuale completo di sistema (`man`) nel pager evidenziato |
| `[Ctrl-Y]` | Copia istantaneamente il comando d'esempio principale negli appunti ed esce |
| `[Ctrl-W]` | Cambia l'anteprima laterale mostrando il cheat sheet online di `cheat.sh` |
| `[Ctrl-T]` | Ripristina l'anteprima laterale sulla scheda unificata locale TLDR |
| `[Esc]` | Chiude la schermata interattiva |

---

## License

Distributed under the [MIT License](LICENSE). Copyright © 2026 Mimmo.
