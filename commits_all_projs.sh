#!/bin/bash

base_dir=$HOME/Projekte   # configurable
dirs=$(find $base_dir -name '.git' | xargs dirname)
# start date, end date configurable; end date sensible default
for day_num in $(seq -w 1 30)
do
    day="2015-04-$day_num"
    day_start="$day 00:00"
    day_end="$day 23:59"
    total_commits=0
    for dir in $dirs
    do
	cd $dir
	commits=$(git log --pretty=oneline --abbrev-commit --since="$day_start" --until="$day_end" --branches --author="Paul Cochrane" | wc -l)
	total_commits=$(expr $total_commits + $commits)
	if [ "$commits" -gt "0" ]
	then
	    escaped_base_dir=$(echo $base_dir | sed 's/\//\\\//g')
	    project_name=$(echo $dir | sed "s/$escaped_base_dir\///")
	    echo "    Total commits in project '$project_name' on $day: $commits"
	fi
	cd - > /dev/null
    done
    # total commits per day
    # total commits per project (~= dir) per day
    echo "Total commits on $day: $total_commits"
    echo "$day $total_commits" >> commits_all_projs.dat
done
