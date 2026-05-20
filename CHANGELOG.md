# CHANGELOG — kiro_repo

> Binary package repository served to the ISO at build/install time.
> Most commits are binary DB updates — tracked here by package version milestones.

---

## Current Packages (`x86_64/`)

| Package | Version |
|---|---|
| `calamares` | `3.3.14.r132.g841b478-4` |
| `calamares-next` | `3.3.14.r132.g841b478-4` |
| `kiro-calamares-config` | `26.04-11` |
| `kiro-calamares-config-next` | `26.04-04` |

---

## 2026-04-26
- **`kiro_repo.db`** updated (binary)

## 2026-04-25
- **`calamares`** → `-4` build
- **`calamares-next`** → `-4` build

## 2026-04-15 — Multiple Rebuilds

- **`kiro-calamares-config`** iterated through builds `08` → `09` → `10` → `11`
- **`kiro-calamares-config-next`** iterated alongside
- Corresponding `kiro_repo.db` and `kiro_repo.files` updated each time

---

## Package Version History

### `calamares` / `calamares-next`
Tracks upstream Calamares git snapshots. Build iterations (PKGBUILD tweaks) are denoted by `-N` suffix.

| Snapshot | Builds |
|---|---|
| `r132.g841b478` | `-2`, `-3`, `-4` |
| `r90.g53c70f8` | `-1` |
| `r87.g3f6cd83` | `-1` |
| `r81.g55f0c9e` | `-2` |
| `r51.g3b9ef52` | `-2` |

### `kiro-calamares-config`
| Build | Notes |
|---|---|
| `26.04-11` | Latest (2026-04-15) |
| `26.04-08` through `10` | April 2026 daily iterations |
| `26.04-07` | Earlier |
| Earlier builds | March/Feb 2026 |

---

## `updaterepo.sh`

Located at `x86_64/updaterepo.sh` — rebuilds the pacman DB:
```bash
rm personal_repo*
repo-add -n -R personal_repo.db.tar.gz *.pkg.tar.zst
rm personal_repo.db personal_repo.files
mv personal_repo.db.tar.gz personal_repo.db
```
