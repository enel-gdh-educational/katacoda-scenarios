#### A)

```
tail -f data/ping.log
tail -n +0 -f data/ping.log
```

#### B)

```
tail -n +0 -f data/ping.log | sed 's/64 bytes from //g' > intermediate.output
cat intermediate.output | sed 's/\(.*\)\(: icmp_seq\)\(.*\)/\1/g' 
```

#### C)
```
# sed script to report ip ping log

1 i\
Filtering ip addresses being reached by ping action..\

s/64 bytes from //
s/\(.*\)\(: icmp_seq\)\(.*\)/\1/w data/ip_address_output.log
```

#### D)
```
cat -n script/count_ping_to_address.sh
```

#### E)
```
cat data/word_count.csv | sed 's/address/ADDRESS/ ; s/count/COUNT/ ; s/"//g ; s/;/ ,/g' | column -t -s ,
```