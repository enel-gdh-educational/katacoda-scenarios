---
**Exercise 1**

`ls -lh foo`

---

----------------------------
**Exercise 2**

`ls -l foo`

`touch foo`


`ls -l foo`

----------------------------


----------------------------
**Exercise 3**

You can just look at their content:

`cat bar.txt`

`cat foo.txt`

However, there could be some hidden characters that are non visible to the human eye.
If you want to be 100% sure though, you should use the `diff` command, which would also tell what are the difference between the two files.

`diff foo.txt bar.txt`

or, which is applicable also to binary files

`cmp foo.txt bar.txt`

Before you made us notice that we haven;t covered the last two commands in this tutorial, let us tell you that we are perfectly aware!
But learning Linux is often about searching google and stack overflow, so ... get used to it!

--------------------------

----------------------------
**Exercise 4**

`echo "additional line" >> bar.txt`

----------------------------

----------------------------
**Exercise 5**

`cp foo.txt foo_1.txt`

`cp bar.txt bar_1.txt`

----------------------------


------------------
**Exercise 6**

`ls textfiles`

------------------

-----------------
**Discuss with your tutor**

Are the two actions really distinct?

No, they aren't. In both cases just the path of the file is changed. If you rename, only the final part if the file is changed, i.e. its name.
If you change the file's location, you change the portion of the path that precedes the file name.

-----------------

--------------------------
**Question 1**

The file's size is about 115Mbs.

The copy took longer than the move. In the former, the operating system has to physically copy bit by bit the first file
 into some empty space of the disk reserved to the newly created file. Since the file size amounts to about 100 Mbs, this can take a while.

In the latter, the operating system simply updates the path associated to the original file. Paths are variables stored in a dedicated portion of the disk,
and, being strings, they typically occupy at most few hundreds of bytes. So, a move operation, effectively boils down to changing less than a thousand bits.

-----------------------------

----------------------------
**Discuss with your tutors**

In fact, the file organization of Google Drive is conceptually the same as a standard filesystem. One difference is that the path only serves
 to browsing through the graphical interface, but you cannot access the files directly by typing their path.
 You should rather use the link that contains their non-human-readable identifier, e.g. the long string.

----------------------------