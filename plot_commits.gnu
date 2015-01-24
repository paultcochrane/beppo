set xdata time
set timefmt "%Y-%m-%d"
set format x "%Y-%m-%d"
plot "commits_all_projs.dat" using 1:2 with steps
