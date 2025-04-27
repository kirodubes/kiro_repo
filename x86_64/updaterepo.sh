#!/bin/bash

rm kiro_repo*

echo "repo-add"
repo-add -n -R kiro_repo.db.tar.gz *.pkg.tar.zst

sleep 1

rm kiro_repo.db

rm kiro_repo.files

mv kiro_repo.db.tar.gz kiro_repo.db

mv kiro_repo.files.tar.gz kiro_repo.files

echo "####################################"
echo "Repo Updated!!"
echo "####################################"
