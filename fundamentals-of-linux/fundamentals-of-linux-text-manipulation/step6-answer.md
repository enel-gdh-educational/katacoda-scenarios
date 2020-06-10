
```
#! /bin/bash
#
# Changes every filename in working directory to all lowercase.
#


for filename in *                # Traverse all files in directory.
do
   fname=`basename $filename`
   n=`echo $fname | tr [:upper:] [:lower:]`  # Change name to lowercase.
   if [ "$fname" != "$n" ]       # Rename only files not already lowercase.
   then
     mv $fname $n
   fi  
done   

exit 0
```