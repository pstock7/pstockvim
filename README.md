# PstockVim

A configuration for me, myself, and I using [LazyVim](https://github.com/LazyVim/LazyVim)💤

Refer to [LazyVim's documentation](https://lazyvim.github.io/installation) for configuration details and other info.

## Dependencies

- All the [dependencies for LazyVim](https://www.lazyvim.org/#%EF%B8%8F-requirements)
- [node.js and npm](https://nodejs.org/en/download/package-manager) (Mason needs it I think)
- `cargo` from installing [Rust](https://www.rust-lang.org/tools/install)
- `python-venv` for `autopep8` and `ruff` if using Python
- `rust-analyzer` from rustup: `rustup component add rust-analyzer` if using Rust
- `latexmk` and `tree-sitter-cli` if using LaTeX

### Optional

The meaning of optional here is sort of fuzzy, but these are more optional than the ones above.

- [win32yank](https://github.com/equalsraf/win32yank) if using in WSL (can install with winget)
- `sqlite3` for snacks_explorer
- `python3-pylatexenc` for LaTeX in Markdown documents

## Installation

To use this as your neovim configuration, clone into `~/.config/nvim`:

```sh
git clone git@github.com:Pstock7/pstockvim.git ~/.config/nvim/
```
