### Step 6 - Git Log and git Show - review commits history on repository

##### *Git log*

To see the history of the repository we can use the `git log` command.
 
It **lists** the **commits** made in that repository in reverse chronological order (most recent show up first)

For each commit it shows SHA-1 checksum, the author’s name and email, the date written, and the commit message.

Some of `git log` useful options are:
- `-p` or `--patch` which shows the difference in each commit  
- `-<number>` limits commits to last `<number>`
- `--stat` which shows, for each commit, list and number of modified files and how many lines in those files were added and removed.
- `--pretty=<value>` changes the log output to formats other than the default, examples of `<value>`  are `oneline`, `short`, `full`, `fuller`, and `format` (where you specify your own format).

##### *Git show*

The `git show` command will allow you to view the changes made in each commit.

---

#### Task

Analyze the output of commands `git log` and `git show`