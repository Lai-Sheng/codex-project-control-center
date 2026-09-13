# Getting started in 20 minutes

This guide creates a small control center and one independently owned project. The names and paths below are examples; choose your own.

## 1. Bootstrap a control center (2 minutes)

Run the platform-appropriate command from this repository's root.

```powershell
./scripts/bootstrap.ps1 -TargetPath "C:\work\control-center"
```

```sh
./scripts/bootstrap.sh /work/control-center
```

Open the target folder in Codex. It contains three files:

- `AGENTS.md` tells an agent how to treat this folder.
- `PROJECTS.md` is the thin registry of long-lived projects.
- `ARCHITECTURE.md` records stable governance decisions.

## 2. Make the registry yours (5 minutes)

Remove the example row in `PROJECTS.md`. Do not try to describe each project's whole history here; its name, root, and lifecycle are enough.

Keep `ARCHITECTURE.md` close to the template until you have a reason to change it. A rule is worth adding when it prevents a recurring mistake, not just because it sounds tidy.

## 3. Create a project home (8 minutes)

Copy `templates/project` to a separate folder for a project that will last beyond a single task. Fill in its README with the problem, source of truth, and verification steps.

For example, the registry can point to a project like this:

| Route | Project | Root | Lifecycle |
|---|---|---|---|
| Atlas | Atlas mobile app | `../projects/atlas-mobile` | Active |

The relative path is only illustrative. Use the route form that is reliable in your own environment.

## 4. Keep status short-lived (3 minutes)

If a project needs a resume point across tasks, add `CURRENT.md` inside that project. It should answer only: what changed, what is blocked, and what should happen next. Replace it as work moves forward instead of making it a diary.

## 5. Verify the boundary (2 minutes)

Ask these questions before adding material to the control center:

1. Would this still be true if the project changed next week? If not, it probably belongs in the project.
2. Does this help someone find the project? If not, it probably does not belong in `PROJECTS.md`.
3. Is this private or sensitive? If so, keep it out of a public repository.

You now have the intended shape: a small router at the center and projects that own their own truth.
