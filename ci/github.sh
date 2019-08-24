#!/bin/bash

make
git config --global user.name 'adamyi-bot'
git config --global user.email 'git@yiad.am'
git add -A
git commit -m 'auto-compile new revision'
GITHUB_AUTH=$(echo -n "${GITHUB_ACTOR}:${GITHUB_TOKEN}" | base64)
git -c http.extraheader="AUTHORIZATION: basic ${GITHUB_AUTH}" push -u origin HEAD
