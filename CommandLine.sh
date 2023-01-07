#!/bin/bash

# 1. What is the most popular pair of heroes (often appearing together in the comics)?
# PATRIOT/JEFF MACE - MISS AMERICA/MADELIN

# Sort the edges by the number of times each pair of heroes appears together
sort hero_net_2.csv | uniq -c | sort -rn > sorted_edges.txt

# Print the most popular pair of heroes
head -n 1 sorted_edges.txt


# 2. Number of comics per hero.
awk -F, 'NR>1{arr[$1]++} END {for (a in arr) print a", "arr[a]}' edges.csv



# 3. The average number of heroes in comics
# Get the number of comics
num_comics = $(cut -d' ' -f2 edges.csv  | sort -u  | wc -l)

# Get the total number of heroes
total_heroes = $(wc -l edges.csv | awk '{print $1}')

# Calculate the average number of heroes per comic
avg_heroes=$(echo "$total_heroes/$num_comics" | bc -l)

echo "Average number of heroes per comic: $avg_heroes"






















