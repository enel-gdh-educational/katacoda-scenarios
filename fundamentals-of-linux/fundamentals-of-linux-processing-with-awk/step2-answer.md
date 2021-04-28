#### A)

**Q1:**
`awk '/li/ { print $0 }' data/mail-list`{{execute}}

**Q2:**
`awk  '{print NR ":" $0 ":" length($0)}' data/mail-list.txt`{{execute}}

**Q3:**
`cat data/ping.log | awk '{print substr($4,0,length($4)-1)}' | awk 'BEGIN {print "ADDRESS,COUNT"} {count[$1]++} END {for (word in count) print word","count[word]}' | column -t -s ,`{{execute}}