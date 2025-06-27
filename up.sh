#!/bin/bash

cd x86_64
sh updaterepo.sh

# Below command will backup everything inside the project folder
git add --all .

git commit -m "update"

git push origin main

echo "################################################################"
echo "#############    Git push to GITHUB done      ##################"
echo "################################################################"
