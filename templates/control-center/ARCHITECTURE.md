# Control-center architecture

## Ownership

Each long-lived project should have one clear home for its durable context. The control center routes to that home; it does not duplicate it.

## Sources of truth

- Project code, specifications, data, and README files are the project's source of truth.
- `PROJECTS.md` only records the stable route to a project.
- Short-term context belongs in a project-local `CURRENT.md` only when it prevents real confusion across tasks.

## Privacy and Git

- Never commit credentials, API keys, tokens, personal data, or sensitive status.
- Prefer private repositories until you can clearly explain why a project should be public.
- Before publishing, inspect the complete Git history as well as the current files.

## Archiving

Archive completed work in an explicit archive location or repository. Keep archived projects out of the active registry unless a route is still useful.
