#!/bin/bash

dirs=$(find ./ -name '.git' | xargs dirname)
for day_num in $(seq -w 1 23)
do day="2015-01-$day_num"
day_start="$day 00:00"
day_end="$day 23:59"
total_commits=0
for dir in $dirs
do cd $dir
commits=$(git log --pretty=oneline --abbrev-commit --since="$day_start" --until="$day_end" --branches --author="Paul Cochrane" | wc -l)
total_commits=$(expr $total_commits + $commits)
cd - > /dev/null
done
echo "Total commits ($day): $total_commits"
echo "$day $total_commits" >> commits_all_projs.dat
done
