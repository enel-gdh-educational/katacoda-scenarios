
----------

#### A) How to Run awk Programs

There are several ways to run an awk program. If the program is short, it is easiest to include it in the command that runs awk, like this:

```bash
awk 'program' input-file1 input-file2 …
```

When the program is long, it is usually more convenient to put it in a file and run it with a command like this:

```bash
awk -f program-file input-file1 input-file2 …
```

This section discusses both mechanisms, along with several variations of each.

 - [One-shot](#B-One-Shot-Throwaway-awk-Programs): Running a short throwaway awk program.
 - [Read Terminal](#C-Running-awk-Without-Input-Files): Using no input files (input from the keyboard instead).
 - [Long](#D-Running-Long-Programs): Putting permanent awk programs in files.
 - [Executable Scripts](#E-Executable-awk-Programs): Making self-contained awk programs.
 - [Comments](#F-Comments-in-awk-Programs): Adding documentation to gawk programs.
 - [Quoting](#G-Shell-Quoting-Issues): More discussion of shell quoting issues.

-----------

#### B) One-Shot Throwaway awk Programs

Once you are familiar with awk, you will often type in simple programs the moment you want to use them. Then you can write the program as the first argument of the awk command, like this:

```bash
awk 'program' input-file1 input-file2 …
```
where program consists of a series of patterns and actions, as described earlier.

This command format instructs the shell, or command interpreter, to start awk and use the program to process records in the input file(s). **There are single quotes around program so the shell won’t interpret any awk characters as special shell characters**. The quotes also cause the shell to treat all of program as a single argument for awk, and allow program to be more than one line long.

This format is also useful for running short or medium-sized awk programs from shell scripts, because it avoids the need for a separate file for the awk program. A self-contained shell script is more reliable because there are no other files to misplace.

-----------

#### C) Running awk Without Input Files

You can also run awk without any input files. If you type the following command line:

```bash
awk 'program'
```

awk applies the program to the **standard input**, which usually means whatever you type on the keyboard. This continues until you indicate end-of-file by typing **Ctrl-d**. (On non-POSIX operating systems, the end-of-file character may be different.)

As an example, the following program prints a friendly piece of advice (from Douglas Adams’s The Hitchhiker’s Guide to the Galaxy), to keep you from worrying about the complexities of computer programming:

```bash
awk 'BEGIN { print "Don\47t Panic!" }'
```

**awk executes statements associated with BEGIN before reading any input**. If there are no other statements in your program, as is the case here, awk just stops, instead of trying to read input it doesn’t know how to process. The ‘\47’ is a magic way (explained later) of getting a single quote into the program, without having to engage in ugly shell quoting tricks.

NOTE: If you use Bash as your shell, you should execute the command ‘set +H’ before running this program interactively, to disable the C shell-style command history, which treats ‘!’ as a special character. We recommend putting this command into your personal startup file.

This next simple awk program emulates the cat utility; it copies whatever you type on the keyboard to its standard output (why this works is explained shortly):

```bash
awk '{ print }'
```

Please, try it yourself.

<u>Hint:</u> Use keyboard combination *Ctrl-d* to stop input.

-----------

#### D) Running Long Programs

Sometimes awk programs are very long. In these cases, it is more convenient to put the program into a separate file. In order to tell awk to use that file for its program, you type:

```bash
awk -f source-file input-file1 input-file2 …
```

The -f instructs the awk utility to get the awk program from the file source-file. Any file name can be used for source-file. For example, you could put the program:

```bash
awk -f advice.awk
```
does the same thing as this one:

`awk 'BEGIN { print "Don\47t Panic!" }'`

Note that you don’t usually need single quotes around the file name that you specify with -f, because most file names don’t contain any of the shell’s special characters. Notice that **in advice, the awk program did not have single quotes around it**. The quotes are only needed for programs that are provided on the awk command line. (Also, placing the program in a file **allows us to use a literal single quote in the program text**, instead of the magic ‘\47’.)

If you want to clearly identify an awk program file as such, you can add the extension .awk to the file name. This doesn’t affect the execution of the awk program but it does make “housekeeping” easier.

#### E) Executable awk Programs
Once you have learned awk, you may want to write self-contained awk scripts, using the ‘#!’ script mechanism. You can do this on many systems. For example, you could update the file advice to look like this:

 > ```bash
 > #! /usr/bin/awk -f
 > 
 > BEGIN { print "Don't Panic!" }
 > ```

After making this file executable (with the chmod utility), simply type ‘advice’ at the shell and the system arranges to run awk as if you had typed ‘awk -f advice’. Let's try it!

Self-contained awk scripts are useful when you want to write a program that users can invoke without their having to know that the program is written in awk.


##### Understanding ‘#!’
**awk is an interpreted language. This means that the awk utility reads your program and then processes your data according to the instructions in your program**. (This is different from a compiled language such as C, where your program is first compiled into machine code that is executed directly by your system’s processor.) The awk utility is thus termed an interpreter. Many modern languages are interpreted.

The line beginning with ‘#!’ lists the full file name of an interpreter to run and a single optional initial command-line argument to pass to that interpreter. The operating system then runs the interpreter with the given argument and the full argument list of the executed program. The first argument in the list is the full file name of the awk program. The rest of the argument list contains either options to awk, or data files, or both. (Note that on many systems awk is found in /usr/bin instead of in /bin.)

Some systems limit the length of the interpreter name to 32 characters. Often, this can be dealt with by using a symbolic link.

You should not put more than one argument on the ‘#!’ line after the path to awk. It does not work. The operating system treats the rest of the line as a single argument and passes it to awk. Doing this leads to confusing behavior—most likely a usage diagnostic of some sort from awk.

Finally, the value of ARGV[0] varies depending upon your operating system. Some systems put ‘awk’ there, some put the full pathname of awk (such as /bin/awk), and some put the name of your script (‘advice’). Don’t rely on the value of ARGV[0] to provide your script name.

#### F) Comments in awk Programs
A comment is some text that is included in a program for the sake of human readers; it is not really an executable part of the program. Comments can explain what the program does and how it works. Nearly all programming languages have provisions for comments, as programs are typically hard to understand without them.

In the awk language, a comment starts with the number sign character (‘#’) and continues to the end of the line. The ‘#’ does not have to be the first character on the line. The awk language ignores the rest of a line following a number sign. For example, we could have put the following into advice:

 > ```bash
 > # This program prints a nice, friendly message.  It helps
 > # keep novice users from being afraid of the computer.
 > BEGIN    { print "Don't Panic!" }
 > ```

You can put comment lines into keyboard-composed throwaway awk programs, but this usually isn’t very useful; the purpose of a comment is to help you or another person understand the program when reading it at a later time.


#### G) Shell Quoting Issues
For short to medium-length awk programs, it is most convenient to enter the program on the awk command line. This is best done by enclosing the entire program in single quotes. This is true whether you are entering the program interactively at the shell prompt, or writing it as part of a larger shell script:

```
awk 'program text' input-file1 input-file2 …
```

Once you are working with the shell, it is helpful to have a basic knowledge of shell quoting rules. The following rules apply only to POSIX-compliant, Bourne-style shells (such as Bash, the GNU Bourne-Again Shell). If you use the C shell, you’re on your own.

The **null** string is character data that has no value. In other words, it is empty. It is written in awk programs like this: "". In the shell, it can be written using single or double quotes: "" or ''. Although the null string has no characters in it, it does exist. For example, consider this command:

```
echo ""
```
Here, the echo utility receives a single argument, even though that argument has no characters in it. 

Quoted items can be concatenated with nonquoted items as well as with other quoted items. The shell turns everything into one argument for the command.
Preceding any single character with a backslash (‘\’) quotes that character. The shell removes the backslash and passes the quoted character on to the command.
 - Single quotes protect everything between the opening and closing quotes. The shell does no interpretation of the quoted text, passing it on verbatim to the command. It is impossible to embed a single quote inside single-quoted text. 

 - Double quotes protect most things between the opening and closing quotes. The shell does at least variable and command substitution on the quoted text. Different shells may do additional kinds of processing on double-quoted text.

Because certain characters within double-quoted text are processed by the shell, they must be escaped within the text. Of note are the characters ‘$’, ‘`’, ‘\’, and ‘"’, all of which must be preceded by a backslash within double-quoted text if they are to be passed on literally to the program. (The leading backslash is stripped first.) 
Thus, the example seen previously in Running awk Without Input Files:

 > `awk 'BEGIN { print "Don\47t Panic!" }'`

could instead be written this way:

 > `awk "BEGIN { print \"Don't Panic!\" }"`

Note that the single quote is not special within double quotes.

Null strings are removed when they occur as part of a non-null command-line argument, while explicit null objects are kept. For example, to specify that the field separator FS should be set to the null string, use:

 > `awk -F "" 'program' files # correct`

Don’t use this:
 > `awk -F"" 'program' files  # wrong!`

In the second case, awk attempts to use the text of the program as the value of FS, and the first file name as the text of the program! This results in syntax errors at best, and confusing behavior at worst.

Mixing single and double quotes is difficult. You have to resort to shell quoting tricks, like this:

 > `awk 'BEGIN { print "Here is a single quote <'"'"'>" }'`{{execute}}

This program consists of three concatenated quoted strings. The first and the third are single-quoted, and the second is double-quoted.

This can be “simplified” to:

 > `awk 'BEGIN { print "Here is a single quote <'\''>" }'`{{execute}}

Judge for yourself which of these two is the more readable.

Another option is to use double quotes, escaping the embedded, awk-level double quotes:

 > `awk "BEGIN { print \"Here is a single quote <'>\" }"`{{execute}}

This option is also painful, because double quotes, backslashes, and dollar signs are very common in more advanced awk programs.

A third option is to use the octal escape sequence equivalents (see section Escape Sequences) for the single- and double-quote characters, like so:


 > `awk 'BEGIN { print "Here is a single quote <\47>" }'`{{execute}}
 > `awk 'BEGIN { print "Here is a double quote <\42>" }'`{{execute}}

This works nicely, but you should comment clearly what the escape sequences mean.

A fourth option is to use command-line variable assignment, like this:

 > `awk -v sq="'" 'BEGIN { print "Here is a single quote <" sq ">" }'`{{execute}}

(Here, the two string constants and the value of sq are concatenated into a single string that is printed by print.)

If you really need both single and double quotes in your awk program, it is probably best to move it into a separate file, where the shell won’t be part of the picture and you can say what you mean.
