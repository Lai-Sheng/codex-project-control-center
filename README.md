# Codex Project Control Center

> A privacy-first, file-based starter kit for organizing local Codex work.

Codex Project Control Center gives you one small place to route active projects without turning every chat, note, or status update into permanent context. Each project keeps its own source of truth; the control center only records stable routing information.

## What you get

- A neutral **control center** with a project registry and durable operating rules.
- A minimal **new-project template**.
- A bootstrap script for Windows PowerShell and macOS/Linux shells.
- Privacy and Git guidance designed for local-first work.

## Install

Clone this repository, then run the bootstrap script from its root.

### Windows PowerShell

```powershell
./scripts/bootstrap.ps1 -TargetPath "C:\path\to\your-control-center"
```

### macOS / Linux

```bash
./scripts/bootstrap.sh /path/to/your-control-center
```

The scripts copy only the neutral `templates/control-center` files. They refuse to overwrite existing files unless you explicitly opt in with `-Force` (PowerShell) or `--force` (shell).

## First use

1. Open the generated control-center folder in Codex.
2. Replace the introductory notes in `PROJECTS.md` and `ARCHITECTURE.md` with decisions that fit your work.
3. When a task deserves long-term ownership, create a separate project folder from `templates/project`.
4. Register only its stable name, root, and lifecycle in `PROJECTS.md`.

## The model

```text
Control center
  ├── routes to active projects
  ├── contains stable operating rules
  └── does not duplicate project state

Individual project
  ├── owns its code, data, specs, and README
  └── keeps temporary status only when genuinely useful
```

The control center is a router, not a second database. This keeps context discoverable while avoiding stale copies of project knowledge.

## Repository layout

```text
templates/
  control-center/     # Files copied into a user's control center
  project/            # Starting point for an independently owned project
scripts/              # Safe bootstrap scripts
docs/                 # Concepts and privacy guidance
```

## Scope

This project helps organize local Codex project context. It does not provide a cloud memory backend, retain chat transcripts, or manage secrets.

## Safety and privacy

Do not commit credentials, personal paths, private data, or transient personal status. Read [the privacy guide](docs/privacy.md) before publishing a control center or project repository.

## Contributing

Contributions are welcome. Please read [CONTRIBUTING.md](CONTRIBUTING.md) and [SECURITY.md](SECURITY.md).

## License

Released under the [MIT License](LICENSE).
