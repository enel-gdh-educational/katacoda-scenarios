#### A)

```
echo 'front' | sed 's/front/back/'
```

#### B)

**echo** prints one line of text: setting address to 2 does not pick any row of text.

#### C)

```
sed -n '2,5p' data/ip_addresses_with_host.txt
```

#### D)

```
/localhost/i\
the following row has been edited: \

s/localhost/127.0.0.1/g
/_home_address/!p
```

