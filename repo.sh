#!/bin/bash

SCRIPT_DIR="$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" && pwd)"

cd "${SCRIPT_DIR}/x86_64"
rm kiro_repo*

echo "repo-add"
repo-add -n -R -v kiro_repo.db.tar.gz *.pkg.tar.zst
rm -v kiro_repo.db
rm -v kiro_repo.files
mv -v kiro_repo.db.tar.gz kiro_repo.db
mv -v kiro_repo.files.tar.gz kiro_repo.files
cd ..
echo "####################################"
echo "Repo Updated!!"
echo "####################################"
