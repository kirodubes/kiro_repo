# CHANGELOG — kiro_repo

## 2026.05.24

### What Changed
- Added a proper GitHub Pages landing page (`index.html`) to replace the default Jekyll-rendered README at https://kirodubes.github.io/kiro_repo/. Ported the theme from its sibling [nemesis_repo](/home/erik/EDU/nemesis_repo/) so the two repo sites match.
- Page matches the kiro-website design: dark slate-950 surface, sky accent with the visitor-switchable 5-colour palette, shared Kiro branding/favicons, hero, copy-to-clipboard install steps, a package overview grid, and a YouTube walkthrough embed.
- Rewrote `README.md` to match the repo's real identity (now consistent with `index.html`): the installer-only repo behind the Kiro ISO. Replaced the stale "Kiro is an ISO builder" opening + ISO-build requirements with a what-it-is intro, a "What's inside" list of the four real packages, and a note distinguishing it from `nemesis_repo` (post-install extras). Kept the Kiro videos (`3jdKH6bLgUE` + playlist) and the kiro-iso "major changes" link.
- Added a Screenshots gallery to the README using the new images, and moved them into `assets/pictures/`; removed the old top-level `kiro-chadwm.jpg` / `kiro-xfce.jpg`.

### Technical Details
- Self-contained design (no Tailwind build step) so the CSS can be committed and served straight from the Pages repo. Hand-written `css/style.css` reproduces the kiro design tokens with semantic class names; no Node tooling pulled into the pacman package repo.
- Accent switcher and copy-button JS mirror kiro-website (localStorage key `kiro-accent`, default accent `sky`); palette tokens are CSS variables `--accent-200..500`.
- Content adapted to what kiro_repo actually is — the **installer-only** repo feeding the Kiro ISO (Calamares + kiro-calamares-config, each on stable + `next` channels). The "Add the repo" section frames it as opt-in (not enabled post-install by design); GitHub/Pages URLs point at the `kirodubes` org; video embed is the Kiro ISO-build tutorial (`3jdKH6bLgUE`). Dropped the nemesis `bit.ly` one-liner (no kiro equivalent).
- Added `.nojekyll` so `assets/` and the `x86_64/` package files are served verbatim. "Browse packages" links point at the GitHub file tree because Pages does not generate directory listings.
- Copied shared branding (`logo.png` + favicons) from kiro-website into `assets/branding/`.

### Files Modified
- index.html (created)
- css/style.css (created)
- .nojekyll (created)
- assets/branding/* (logo + favicons, copied from kiro-website)
- README.md (rewritten + screenshots gallery)
- assets/pictures/* (6 screenshots, new)
- kiro-chadwm.jpg, kiro-xfce.jpg (removed)
- CHANGELOG.md (updated)

## 2026.05.21

### What Changed
- Added the four other required markdown scaffold files (created stubs for whichever of `IDEAS.md` / `TODO.md` / `CLAUDE.md` were missing) per the new ecosystem MD-scaffold rule codified in [Kiro-HQ/CLAUDE.md](/home/erik/Insync/Kiro/Kiro-HQ/CLAUDE.md#required-markdown-scaffold-every-repo). README was already substantial; left untouched.

### Files Modified
- CHANGELOG.md
- IDEAS.md (created where missing)
- TODO.md (created where missing)
- CLAUDE.md (created where missing)

> Binary package repository served to the ISO at build/install time.
> Most commits are binary DB updates — tracked here by package version milestones.

---

## Current Packages (`x86_64/`)

| Package                      | Version                  |
|------------------------------|--------------------------|
| `calamares`                  | `3.3.14.r132.g841b478-4` |
| `calamares-next`             | `3.3.14.r132.g841b478-4` |
| `kiro-calamares-config`      | `26.04-11`               |
| `kiro-calamares-config-next` | `26.04-04`               |

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

| Snapshot        | Builds           |
|-----------------|------------------|
| `r132.g841b478` | `-2`, `-3`, `-4` |
| `r90.g53c70f8`  | `-1`             |
| `r87.g3f6cd83`  | `-1`             |
| `r81.g55f0c9e`  | `-2`             |
| `r51.g3b9ef52`  | `-2`             |

### `kiro-calamares-config`
| Build                   | Notes                       |
|-------------------------|-----------------------------|
| `26.04-11`              | Latest (2026-04-15)         |
| `26.04-08` through `10` | April 2026 daily iterations |
| `26.04-07`              | Earlier                     |
| Earlier builds          | March/Feb 2026              |

---

## `updaterepo.sh`

Located at `x86_64/updaterepo.sh` — rebuilds the pacman DB:
```bash
rm personal_repo*
repo-add -n -R personal_repo.db.tar.gz *.pkg.tar.zst
rm personal_repo.db personal_repo.files
mv personal_repo.db.tar.gz personal_repo.db
```
