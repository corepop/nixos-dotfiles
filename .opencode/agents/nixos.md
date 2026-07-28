---
description: "NixOS dotfile best practices: MCP server discovery, modular configs, declarative dotfiles, and cross-referencing sources. Safety is a priority."
mode: all
---

## Working directory

- All commands, paths, and file operations are relative to `/home/sebastian/nixos-dotfiles`
- Flake URI for system rebuilds: `/home/sebastian/nixos-dotfiles#nixos-desktop`
- Always use absolute paths (`/home/sebastian/nixos-dotfiles/...`) when referencing files in this repo
- `~/.config/nvim` → symlinked from `config/nvim/` in this repo
- Flake inputs: `nixpkgs` (nixos-unstable), `home-manager` (master), `nix-agent`, `plasma-manager`

## Safety

- Never run `rm` (remove files or directories) without asking the user first. Show the user exactly what you intend to delete and wait for approval.

## MCP server for NixOS

- Use `mcp-nixos` (utensils) for **discovery** — query packages, options, Home Manager, cache status, channels
- Use `nix-agent` (JEFF7712) for **operations** — build, diff, switch, generations, eval_config, locate_option
- Prefer these MCP tools over raw shell commands when possible
- If an MCP tool doesn't support what you need, fall back to shell commands

## Modularization

- Put every discrete concern in its own file under `modules/`
- Do NOT bloat `home.nix` or `configuration.nix` — keep them as thin orchestrators that import modules
- Each module declares its own packages, configs, and dependencies so it's portable
- Example pattern: `modules/neovim.nix` bundles neovim + LSPs + build deps + formatters

## Declarative dotfiles with Nix

- Use `xdg.configFile` with `mkOutOfStoreSymlink` for dotfile configs so edits apply live without rebuild
- Manage home-manager modules, system packages, and flake inputs declaratively — no imperative ad-hoc changes
- Keep `home.nix` minimal: define the `configs` map and import modules
- Keep `configuration.nix` for NixOS-level settings (kernel, services, networking)

## Track dotfiles with Nix

- All config lives in the Nix flake, not in loose dotfiles scattered across `~/.config`
- `flake.nix` is the single source of truth for inputs and outputs
- New files must be `git add`ed before they're visible to the flake (`nix flake check` catches this)

## Research & cross-referencing

- Before adding a new package or option, check `mcp-nixos search` first
- Cross-reference official docs (nixos.org/manual, nix.dev, wiki.nixos.org, nix-community.github.io/home-manager/options) with community sources (Discourse, Reddit, GitHub issues)
- For exact home-manager option names and types, reference the official option browser at nix-community.github.io/home-manager/options
- Prefer tools and patterns that are widely adopted in the Nix community
- When in doubt, check what the upstream module in nixpkgs does — follow established convention over custom solutions
