# CHANGELOG — kiro_repo

## 2026.06.14

### What Changed
- Synced the website (`index.html`) and `README.md` package lists to what the repo
  actually serves. The DB ships **6 packages**, but both surfaces only listed **4** —
  the `kiro-calamares-tweak-tool` stack (stable + `-nemesis` testing build) was missing.
  Added both so the public "What's inside" matches the served database.
- Removed the "Add the repository" section from `README.md`. kiro_repo is
  installer-only by design (not added to `/etc/pacman.conf` after a normal install),
  so publishing a copy-paste `Server =` opt-in stanza contradicted that and invited
  users to wire in an installer-only repo. Also dropped the now-dangling "you can
  still opt in on any Arch system" sentence from the intro Note.
- Did the same on the website (`index.html`): removed the whole "Add the repo"
  section and every reference to it (nav link, hero "Add to pacman.conf" CTA, the
  hero opt-in sentence, and the meta-description opt-in claim). Replaced the embedded
  video — the BUILDRA build tutorial (`3jdKH6bLgUE`) swapped for `Ciqao_oWvM0`.
  Same build-tutorial link updated in `README.md` (the all-videos playlist link
  left as-is).

### Technical Details
- `index.html` Packages grid: added two `.pkg-card`s — `kiro-calamares-tweak-tool`
  and `kiro-calamares-tweak-tool-nemesis` (the latter with a `nemesis channel` count
  badge, mirroring the `next channel` badges). Updated the section lead to name three
  components and the `next` / `nemesis` testing channels.
- `README.md` "What's inside": added the tweak-tool line. Description taken from the
  package `pkgdesc` — dev/expert PySide6/QML tool to preset Calamares encryption +
  bootloader, installer-only.

### Files Modified
- `index.html`
- `README.md`
- `CHANGELOG.md`

### Technical Details (website add-block removal)
- Removed nav `<a href="#add">`, the hero `.btn-primary` "Add to pacman.conf"
  button (promoted "Browse on GitHub" to primary), the `<section id="add">` block
  (Server stanza + refresh + signing note), and trimmed the hero lead + meta
  description so nothing dangles to the removed anchor.

## 2026.06.13

### What Changed
- `repo.sh` now **PGP-signs every package** before building the database, mirroring
  the Phase A change in `nemesis_repo`. kiro_repo is served over GitHub Pages
  (`kirodubes.github.io`) at `SigLevel = Never` and ships the installer/calamares
  stack to both the live ISO and installed systems, so it carried the same
  GitHub-account/Pages/CDN-tampering exposure as nemesis. SigLevel stays `Never`
  for now — sigs present but ignored, zero risk.

### Technical Details
- Same detach-sign loop as nemesis: scoped to the Kiro signing subkey
  (`gpg --detach-sign -u 33B761B0EE5AD4FD`), signs only missing/stale `.sig`,
  fail-loud, orphan-sig cleanup after `repo-add -R`. `repo-add` stays without `-s`
  (packages-only → `Required DatabaseOptional` later).
- The **same `kiro-keyring`** trusts the one Kiro key, so it covers this repo too —
  no separate keyring. First run: 6/6 packages signed (the calamares + config +
  tweak-tool stack and their `-next`/`-nemesis` betas).
- Future `Required` flip must cover **both** pacman.conf locations — the live ISO
  `archiso/pacman.conf` and the calamares-appended installed entry — or it breaks
  the installer, not just `-Syu`.

### Files Modified
- `repo.sh`

## 2026.05.29

### Adopted the canonical shared web design system
- `css/style.css` is now synced byte-identical from the canonical
  `Kiro-HQ/web-shared/style.css` via the new HQ `propagate-web-shared.sh` — no
  longer hand-edited here (header now points to the canonical source).
- Wrapped the footer in `<!-- KIRO:FOOTER START -->` / `<!-- KIRO:FOOTER END -->`
  markers so the sync script can manage it, and **de-duplicated** it: removed the
  second "Part of the Kiro project" link that pointed to the same
  `https://kiroproject.be` URL as the existing `kiroproject.be` link.
- Files: `index.html`, `css/style.css`.

## 2026.05.24

### Shared-asset propagation + Patreon + wrap fixes (later session)
- Normalised the web assets to the canonical kiro-website set via the new HQ
  `propagate-assets.sh`: renamed `assets/pictures/` → `assets/screenshots/`
  (SEO-consistent), repointed the 8 `index.html` + 8 `README.md` image refs, and
  added `assets/branding/youtube-banner.png`.
- Added a **Patreon** support pill (https://www.patreon.com/c/kiroproject) with
  coral `.pill-patreon` styling to `index.html`.
- Fixed the README screenshot paths that broke when the folder was renamed.
- Added `white-space:nowrap` to `.pill` (Ko-fi label) and `.nav a` ("Add the
  repo") so labels and nav items no longer wrap to two lines.
- Left the `Server = https://kirodubes.github.io/$repo/$arch` line untouched —
  it's correct pacman config (the 404 is browser-only on the bare directory).

### What Changed
- Added a proper GitHub Pages landing page (`index.html`) to replace the default Jekyll-rendered README at https://kirodubes.github.io/kiro_repo/. Ported the theme from its sibling [nemesis_repo](/home/erik/EDU/nemesis_repo/) so the two repo sites match.
- Page matches the kiro-website design: dark slate-950 surface, sky accent with the visitor-switchable 5-colour palette, shared Kiro branding/favicons, hero, copy-to-clipboard install steps, a package overview grid, and a YouTube walkthrough embed.
- Rewrote `README.md` to match the repo's real identity (now consistent with `index.html`): the installer-only repo behind the Kiro ISO. Replaced the stale "Kiro is an ISO builder" opening + ISO-build requirements with a what-it-is intro, a "What's inside" list of the four real packages, and a note distinguishing it from `nemesis_repo` (post-install extras). Kept the Kiro videos (`3jdKH6bLgUE` + playlist) and the kiro-iso "major changes" link.
- Added a Screenshots gallery to the README (table layout matching nemesis_repo) using the new `.webp` images, and moved them into `assets/pictures/`; removed the old top-level `kiro-chadwm.jpg` / `kiro-xfce.jpg`. Added Websites/Social Media sections.
- Fixed the footer website link in `index.html` from `erikdubois.be` to `https://kiroproject.be` (the project's site).
- Added a Screenshots section to the Pages site (`index.html`) showing the same `.webp` images, with a matching nav link and a `.shot-grid` / `.shot` block in `css/style.css` reusing the existing slate/accent tokens (mirrors the `.pkg-card` styling).
- Added the two Calamares screenshots (`kiro-calamares-start` / `-end`) and placed them first in both galleries (README + `index.html`) — fitting, since this repo *is* the Calamares installer. Gallery is now eight images.
- Fixed the Pages site video embed: it was pointing at the nemesis walkthrough (`ocKZIzAb7GQ`); switched to the Kiro ISO-build tutorial (`3jdKH6bLgUE`), matching the README.

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
- README.md (rewritten + screenshots gallery + Websites/Social Media)
- index.html (footer website link → kiroproject.be; new Screenshots section + nav link)
- css/style.css (.shot-grid / .shot gallery styles)
- assets/pictures/* (8 .webp screenshots, new — incl. the two Calamares shots)
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
