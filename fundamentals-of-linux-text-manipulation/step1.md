

#### A) Download web page

First of all we need to download a plain text file of the book,
for example from the url http://www.hoepliscuola.it/download/2842/la-divina-commedia-txt.

Specify the name of the output file using the -O flag

```
wget http://www.hoepliscuola.it/download/2842/la-divina-commedia-txt{{execute}} -O divina_commedia.txt
```






The download may take few seconds depending on the internet connection.

-----------

#### B) Have a look at text using more and less command

<u>Hint:</u> use the **more** or **less** commands.

In order to navigate through the file line by line press Enter key or press 
Spacebar key to navigate one page at a time, the page being your current terminal screen size. 
To exit the command just press q key.

A useful option of more command is the -number switch which allows you to set the number of line a page should contain. 
As an example display the divina_commedia.txt file as a page of 10 lines:

```
more -10 divina_commedia.txt
```

you can display a page starting from a specific line number using the +number option 
as illustrated below:

```
more +3000 divina_commedia.txt
```



What do you notice?

-----------

#### C) Decode and encode 



Character encoding is used to represent a repertoire of characters by some kind of encoding system.
Unix-like systems make UTF-8 the default character encoding. Weird symbols appearing in the text file suggest that 
the text might have been encoded with a differenct encoding scheme.

To verify this hypothesis and understand which is the character encoding of divina_commedia.tx file let's use 
chardetect3: this command reads and determines the character encoding of the file content, 
reporting the name and confidence level for each file's detected character encoding.  


```
chardetect3  divina_commedia.txt
```

The iconv command can be used to convert encoding of given files from one encoding to another
iconv options -f from-encoding -t to-encoding inputfile(s) -o outputfile 

```
iconv -f ISO-8859-1 -t UTF8 divina_commedia.txt -o divina_commedia_utf8.txt
```

Use **more** or **less** commands to verify that the encoding has been correctly converted.
