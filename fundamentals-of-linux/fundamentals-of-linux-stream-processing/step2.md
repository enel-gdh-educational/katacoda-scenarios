
#### A) Replacing text with sed

In general, the way sed works is that it is given either a single editing command (on the command line) 
or the name of a script file containing multiple commands, and it then performs these commands 
upon *each line* in the stream of text.

<u>Hint:</u> Use the command: **sed [-Ealn] command [file ...]**.

The form of a sed command is as follows:

```
[address[,address]]function[arguments]
```
For the specific meaning of address - function - arguments let's have a look a manual documentation.

**Exercise**: can you **echo** a string "front" and substitute it into "back" ? 

-----------

#### B) Understanding addresses in sed

Most commands in sed may be preceded by an address, which specifies which line(s) of the 
input stream will be edited. If the address is omitted, then the editing command is carried 
out on every line in the input stream.

Here, some of the most common usages:
- Use **n**: line number where n is a positive integer.
- Use **$**: last line.
- Use **/regexp/**: lines matching a POSIX basic regular expression which is delimited by slash characters. 
  Optionally, the regular expression may be delimited by an alternate character, 
  by specifying the expression with \cregexpc, where c is the alternate character.
- Use **addr1,addr2**: A range of lines from addr1 to addr2, inclusive. Addresses may be any of the single 
  address forms listed earlier.
- Use **first~step**: match the line represented by the number first, then each subsequent line at step intervals.
- Use **addr!**: match all lines except addr, which may be any of the forms listed earlier.

What about using an address like this:

```
echo "new string" | sed '1s/string/word/'
```

or like this:

```
echo "new string" | sed '2s/string/word/'
```

why is the result empty?


#### C) Using addresses and editing commands

With **sed** you can use several editing commands. Here, the most common:
- Use **s/regexp/replacement/**: Substitute the contents of replacement wherever regexp is found. 
  Replacement may include the special character &, which is equivalent to the text matched by regexp. 
  In addition, replacement may include the sequences \1 through \9, which are the contents of the 
  corresponding subexpressions in regexp. After the trailing slash following replacement, 
  an optional flag may be specified to modify the s command’s behavior.
- Use **p**: Print the current line. By default, sed prints every line and only edits lines 
  that match a specified address within the file. The default behavior can be overridden by specifying the *-n* option.
- Use **=**: Output the current line number.
- Use **a**: Append text after the current line. 
- Use **i**: Insert text in front of the current line.
- Use **d**: Delete the current line.
- Use **y/set1/set2**: Perform transliteration by converting characters from set1 to the corresponding 
  characters in set2. Note that unlike tr, sed requires that both sets be of the same length.

In order to reproduce some example of sed usage, please consider using the file attached (data/README.txt).

**Question 1**: Do you remember file data/README.txt ? How would you print it with sed ? 

<u>Hint:</u> Before printing the file, please consider moving it to normal text: ```cat data/README.txt | tr a-zA-Z n-za-mN-ZA-M > data/README_clear.txt```.

**Question 2**: Could you print the Italian section only? 

-----------

#### D) Edit the file data/ip_addresses_with_host.txt by sed script

Now, consider using the file data/ip_addresses_with_host.txt which contains randomly generated IP addresses.

In order to provide sed with a list of command it is possible to create a script containing a list of
commands. Let's assume we want to:
1. Before each matched line (i.e. the ones containing the word 'localhost'), write a new line like this: 

        _the following row has been edited:_
2. Remove the alias '_localhost_' word and substitute with address 127.0.0.1.
3. Do not print any other row containing unnecessary word or string, but ip addresses

<u>Hint:</u> To run a sed script you can use ```sed -f format_data.sed data/ip_address_with_host.txt```.

**Questions**:
 - Can you look where your interventions are located in the printed output ? 
 - Do you see something strange in printed output ? 
