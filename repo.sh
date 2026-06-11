#!/bin/bash

SCRIPT_DIR="$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" && pwd)"

cd "${SCRIPT_DIR}/x86_64"
rm kiro_repo*

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
cd ..
echo "####################################"
echo "Repo Updated!!"
echo "####################################"
