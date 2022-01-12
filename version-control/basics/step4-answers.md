
__Question 1__

Given the output of ``git diff``

```bash
diff --git a/hello_world.py b/hello_world.py
index f7d1785..cde7a86 100644
--- a/hello_world.py
+++ b/hello_world.py
@@ -1 +1,2 @@
 print('Hello world')
+print('Hello again')

```

This tells you that ``diff`` is comparing the present working tree against the index object
 `f7d1785..cde7a86` containing the file `hello_world.py`.
 
Lines owing to the first (second) file of the comparison are labelled by ``-`` (``+``).

The first (and unique in this case) difference is between line 1 of the first file
 and lines 1 to 2 of the second one. The second file, that of the working tree, 
 contains the extra line "Hello again".

---
