
## Some Examples With Data Files

The following examples are based on two basic files you can find in the path `/root/data` directory. The first, _mail-list_, represents a list of peoples’ names together with their email addresses and information about those people. The second data file, called _inventory-shipped_, contains information about monthly shipments. In both files, each line is considered to be one record.

 - In **mail-list**, each record contains the name of a person, his/her phone number, his/her email address, and a code for his/her relationship _with the author_ of the list. The columns are aligned using spaces. 
      - An ‘A’ in the last column means that the person is an acquaintance. 
      - An ‘F’ in the last column means that the person is a friend. 
      - An ‘R’ means that the person is a relative.

 Please, have a look at the file *mail-list*.

 - The data file **inventory-shipped** represents information about shipments during the year. Each record contains:
 
      - the month, 
      - the number of green crates shipped, 
      - the number of red boxes shipped, 
      - the number of orange bags shipped, 
      - and the number of blue packages shipped
      
 There are **16 entries**, covering the 12 months of last year and the first four months of the current year. *An empty line separates the data for the two years*. 
 
 Please, have a look at the file *inventory-shipped*.

---

#### A) Some simple examples

**Q1**: let's write a simple awk program that searches the input file *mail-list* for the character string ‘**li**’.

You will notice that slashes (‘/’) surround the string ‘li’ in the awk program. The slashes indicate that ‘li’ is the pattern to search for. This type of pattern is called a regular expression. The pattern is allowed to match parts of words. There are single quotes around the awk program so that the shell won’t interpret any of it as special shell characters.

**In an awk rule, either the pattern or the action can be omitted, but not both**. If the pattern is omitted, then the action is performed for every input line. If the action is omitted, the default action is to print all lines that match the pattern.

Thus, we could leave out the action (the print statement and the braces) in the previous example and the result would be the same: awk prints all lines matching the pattern ‘li’. By comparison, omitting the print statement but retaining the braces makes an empty action that does nothing (i.e., no lines are printed).

Many practical awk programs are just a line or two long. Following is a collection of useful, short programs to get you started. Some of these programs contain constructs that haven’t been covered yet. Most of the examples use a data file named data. This is just a placeholder; if you use these programs yourself, substitute your own file names for data. For future reference, note that **there is often more than one way to do things in awk**. At some point, you may want to look back at these examples and see if you can come up with different ways to do the same things shown here:

Print every line that is longer than 80 characters:

 > `awk 'length($0) > 80' data`{{copy}}

The sole rule has a relational expression as its pattern and has no action—so it uses the default action, printing the record.


**Q2**: let's write a simple awk program that prints the length of each line in *mail-list* in the following format: `<line-number>:<line-content>:<line-size>`.


Print the length of the longest input line:
 > `awk '{ if (length($0) > max) max = length($0) } END { print max }' data`{{copy}}

The code associated with END executes after all input has been read; it’s the other side of the coin to BEGIN.

Print the length of the longest line in data:
 > ```
 > expand data | awk '{ if (x < length($0)) x = length($0) }
 >                    END { print "maximum line length is " x }'
 > ```
This example differs slightly from the previous one: the input is processed by the expand utility to change TABs into spaces, so the widths compared are actually the right-margin columns, as opposed to the number of input characters on each line.

Print every line that has at least one field:
 > ```
 > awk 'NF > 0' data
 > ```
This is an easy way to delete blank lines from a file (or rather, to create a new file similar to the old file but from which the blank lines have been removed).

Print seven random numbers from 0 to 100, inclusive:
 > ```
 > awk 'BEGIN { for (i = 1; i <= 7; i++)
 >                  print int(101 * rand()) }'
 > ```

Print the total number of bytes used by files:
 > ```
 > ls -l files | awk '{ x += $5 }
 >                    END { print "total bytes: " x }'
 > ```

Print the total number of kilobytes used by files:
 > ```
 > ls -l files | awk '{ x += $5 }
 >    END { print "total K-bytes:", x / 1024 }'
 > ```

Print a sorted list of the login names of all users:
 > `awk -F: '{ print $1 }' /etc/passwd | sort`{{copy}}

Count the lines in a file:
 > `awk 'END { print NR }' data`{{copy}}

Print the even-numbered lines in the data file:

 > `awk 'NR % 2 == 0' data`{{copy}}

If you used the expression ‘NR % 2 == 1’ instead, the program would print the odd-numbered lines.

#### B) An Example with Two Rules
The awk utility reads the input files one line at a time. For each line, awk tries the patterns of each rule. If several patterns match, then several actions execute in the order in which they appear in the awk program. If no patterns match, then no actions run.

After processing all the rules that match the line (and perhaps there are none), awk reads the next line. This continues until the program reaches the end of the file. For example, the following awk program contains two rules:

 > ```
 > /12/  { print $0 }
 > /21/  { print $0 }
 > ```

The first rule has the string ‘12’ as the pattern and ‘print $0’ as the action. The second rule has the string ‘21’ as the pattern and also has ‘print $0’ as the action. Each rule’s action is enclosed in its own pair of braces.

This program prints every line that contains the string ‘12’ or the string ‘21’. If a line contains both strings, it is printed twice, once by each rule.

This is what happens if we run this program on our two sample data files, mail-list and inventory-shipped:

```
$ awk '/12/ { print $0 }
      /21/ { print $0 }' mail-list inventory-shipped
```
Note how the line beginning with ‘Jean-Paul’ in mail-list was printed twice, once for each rule.

#### C) Perform the formatting on a log
Consider using the log file `data/ping.log` by unzipping the file `ping.zip`.

**Q3**: can you format the log in order to produce the following log?
 > ```
 > ADDRESS         COUNT
 > 163.65.180.133  95
 > 24.76.171.3     100
 > 38.165.221.32   106
 > 32.115.185.81   115
 > 249.243.28.54   93
 > 132.244.113.40  98
 > 199.185.15.244  92
 > 4.118.179.253   109
 > 167.253.11.117  101
 > 29.35.252.155   91
 > ```

<u>Hint:</u> you can use the **column** command to simply format the report after computation.