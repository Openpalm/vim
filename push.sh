#!/bin/bash
today=`date`

git add . --all
git status

sleep 1

git commit -a -m "pushing changes $today"
git push

