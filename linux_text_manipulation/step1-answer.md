#### A)

```
wget http://www.hoepliscuola.it/download/2842/la-divina-commedia-txt{{execute}} -O divina_commedia.txt{{execute}}
```


#### B)

```
more divina_commedia.txt{{execute}}
```

#### C)

```
chardetect3  divina_commedia.txt{{execute}}
iconv -f ISO-8859-1 -t UTF8 divina_commedia.txt -o divina_commedia_utf8.txt
more divina_commedia_utf8.txt{{execute}}
```


