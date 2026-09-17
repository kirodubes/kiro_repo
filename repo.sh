#!/bin/bash

SCRIPT_DIR="$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" && pwd)"

cd "${SCRIPT_DIR}/x86_64"
rm kiro_repo*

# Detach-sign every package with the Kiro signing subkey before building the db.
# Packages-only signing (db stays unsigned → SigLevel = Required DatabaseOptional
# on the client), so repo-add runs without -s. Sign only when the .sig is missing
# or older than the package, to avoid re-signing the whole repo on every run.
# Fail loud: a signing error must stop the run, never publish a half-signed repo.
echo "signing packages"
# Sign from a throwaway cwd, and force loopback pinentry. Background: gpg-agent
# launches the configured GUI pinentry (pinentry-qt), whose Qt X11 connection
# drops an xauth_XXXXXX cookie file into the current dir — and the current dir
# here is the tracked x86_64/ tree, so the cookie kept landing in the repo.
# loopback makes gpg prompt on the tty instead of launching any GUI pinentry
# (no X connection, no cookie); the temp cwd is a belt-and-suspenders net so any
# stray temp file can't land in the tree even if loopback is ever removed. Sign
# via an absolute path so the .sig still lands next to the package in x86_64/.
sign_cwd="$(mktemp -d)"
for pkg in *.pkg.tar.zst; do
    if [[ ! -f "${pkg}.sig" || "${pkg}" -nt "${pkg}.sig" ]]; then
        echo "  signing ${pkg}"
        ( cd "${sign_cwd}" && gpg --pinentry-mode loopback --detach-sign \
            -u 33B761B0EE5AD4FD --yes "${SCRIPT_DIR}/x86_64/${pkg}" ) || {
            echo "SIGNING FAILED for ${pkg} — aborting, repo not updated" >&2
            exit 1
        }
    fi
done
rmdir "${sign_cwd}" 2>/dev/null || true

echo "repo-add"
# Feed packages in true version order (oldest first) so the newest build of each
# package is processed last and wins in the db; -R then prunes the older files.
# A plain glob sorts lexically (99 sorts after 100), which lets an old build win
# and deletes the newer package file from disk. pacsort sorts by version.
mapfile -t pkgs < <(printf '%s\n' *.pkg.tar.zst | pacsort)
repo-add -n -R -v kiro_repo.db.tar.gz "${pkgs[@]}"
rm -v kiro_repo.db
rm -v kiro_repo.files
mv -v kiro_repo.db.tar.gz kiro_repo.db
mv -v kiro_repo.files.tar.gz kiro_repo.files

# repo-add -R prunes superseded package files; drop any .sig left orphaned so the
# repo never serves a signature whose package is gone.
for sig in *.pkg.tar.zst.sig; do
    [[ -e "${sig}" ]] || continue
    [[ -e "${sig%.sig}" ]] || rm -v "${sig}"
done

cd ..
echo "####################################"
echo "Repo Updated!!"
echo "####################################"
