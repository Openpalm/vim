echo "resetting repository"
git stash --include-untracked
sleep 1
git reset --hard
sleep 1
git clean -fd
