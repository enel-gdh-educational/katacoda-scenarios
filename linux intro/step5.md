#### A) Check permissions of the file ./useless.py

Hint: Permissions are shown using the **ls** command with the argument **-l**. Adding a file name as an argument will limit the output only at the specified file.

Permissions in linux OS are represented using a string of character (**r**: read, **w**: write, **x**: execute). In our example:
- the owner user of the file (**root**) has read and write privileges (**rw-**)
- the owner's group (**staff**) can only read the file (**r--**)
- all other users can only read the file (**r--**)
- the first character of the string represent the **file type** (**-**: regular file, **d**: directory, **i**: link)

More information can be found here [https://phoenixnap.com/kb/linux-file-permissions] 


#### B) Change permissions of the file ./useless.py, so that it is public for reading, writing and executing

Hint: Use the command **chmod** specifying the required permissions and the file name:
- the owner user should be able to read, write and execute the file (**u=rwx**)
- the owner's group should be able to read, write and execute the file (**g=rwx**)
- all other users should be able to read, write and execute the file (**o=rwx**)

#### C) Check again permissions of the file ./useless.py

Hint: Permissions are shown using the **ls** command with the argument **-l**.

#### D) Change permissions of the folder ./tree and all the files inside it, so that trey are public for reading, writing and executing

Hint: Use the command **chmod** as in B), adding the argument **-R** to execute the command recursively.

#### E) Check permissions of the file inside the folder ./tree

Hint: Permissions are shown using the **ls** command with the argument **-l**.

