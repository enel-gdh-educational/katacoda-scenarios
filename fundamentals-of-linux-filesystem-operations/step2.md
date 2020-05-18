----------

#### Operation with files

Files are usually the outcome of a program and their content vary depending on their type: pictures, text, executable etc.

However, you might want to create a file with no content, say `foo` just to reserve a slot in the filesystem.

```bash
touch foo
```
---
**Exercise 1**
    
Check that `foo` is an empty file

Hint: look at its size.

---

Now, let us put some text content in the file you have just created. We will use output redirection, do you remember how it works?

```bash
echo "First line of content" >> foo
```

To print the content of a file on the terminal:

```bash
cat foo
```

This is a quick way to check what is in text files, but you might want open a file in a text editor to modify or search it. 
Worry not, we have as dedicated scenario to play with a text editor.

However, the original purpose of `touch` is not to create a file, but to update its last modification date.
 It creates a new empty file only if it does not find a file with that name.

----------------------------
**Exercise 2**

Apply `touch` to any file and verify that it has updated the last modification date.

--------------------------

Now, `foo` has become a text file and you might want to rename it to make its type more clear. Use the command `mv` (move):

```bash
mv foo foo.txt
``` 

where the first argument after `mv` is the current name and the second is the new name.

Let us copy `foo` in some other files. The Linux utility to achieve that is `cp` (copy):

```bash
cp foo.txt bar.txt
```

where the syntax is identical to that of `mv`.

----------------------------
**Exercise 3**

Check that the file `bar.txt` has been created and it is identical to `foo.txt`

--------------------------

----------------------------
**Exercise 4**

Add one more text line to 'bar.txt'. You choose what to add.

----------------------------

----------------------------
**Exercise 5**

Make a new file identical to `foo.txt` and another identical to `bar.txt`, respectively, `foo_1.txt` and `bar_1.txt`

----------------------------

Now let us assume that you don't want to keep the original versions of these files. Well, you can use `rm` (remove) to remove them

```bash
rm foo.txt bar.txt
```

Here the syntax is different. All the arguments after `rm` are names of files that you aim to delete.

#### Operations with folders

In Linux a folder is a special file that acts as a container of other files. Let us assume that you want to reorder your files and collect all the
newly created files in one place. Then, use `mkdir` to create a directory 

```bash
mkdir textfiles
```

and then you can move the files in it. You can do it with `mv`.

```bash
mv foo_1.txt textfiles/

mv bar_1.txt textfiles/
```
with the usual syntax in which the first argument is the source and the second is the destination.

------------------
**Exercise 6**

Check that the files are in the new place 

------------------


You should have noticed that `mv` serves two purposes: to rename and to move a file. 


-----------------
**Discuss with your tutor**

Are the two actions really distinct?

-----------------

Now suppose you want to create a copy of the folder  bla bla. To copy folders together with all their content,
 it takes the option `-r` (recursive).

```bash
cp -r textfiles textfiles_1

```

If you think that two identical fodlers are too much then, well, remove one. Similarily, you need the recursive flag:

```bash
rm -r textfiles

```

-----------------
**Watch out**

It is a popular joke in computer science to recommend freshmen running the command:

```bash
rm -rf /*

```
Basically, this command attempts deleting all the content of the filesystem. Yes, it is a bad trick.

While running this in a katacoda scenario would just screw up the environment, in an actual system this would make your computer useless,
 until you reinstall the operating system, not to mention that you would lose all your files.

In truth, in a standard system unlike katacoda most files are protected and removing them require invoking root permissions.

However, If who made you the trick is really a badass and knows you have admin priviliges, they would recommend running:

```bash

sudo rm -rf /*

```

Well, you choose what to answer them!

------------------




--------------------------
**Question 1**

mv (make it notice how fast it is, would be nice). Should be done with a pre-existent big file. 

-----------------------------



----------------------------
** Discuss with your tutors **



----------------------------


