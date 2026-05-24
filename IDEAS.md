# Ideas — kiro_repo

Future ideas for this repo. One idea appended per `/end-session` (per global rule).

## Claude's Ideashop

**Idea [arch]: Auto-derive the "What's inside" list from `x86_64/kiro_repo.db` so the site never shows a stale build**
kiro_repo is the installer-only repo, so its real contents are exactly whatever `repo-add` last wrote into `kiro_repo.db`. Instead of hand-listing the packages + versions in `README.md` / `index.html`, generate that block from the actual DB at commit time (a small script that reads the db and rewrites a marked section). The site then always reflects the genuine shipped set after every rebuild, with no manual version bumps to forget.

