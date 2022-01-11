### Step 6 - Git Log - review commits history on repository

##### *Git log*

To see the history of the repository we can use the `git log` command.

It **lists** the **commits** made in that repository in reverse chronological order (most recent show up first)

For each commit it shows SHA-1 (Secure Hash Algorithm) checksum, the author’s name and email, the date written, and the commit message.

Some of `git log` useful options are:
- `-p` or `--patch` which shows the difference in each commit  
- `-<number>` limits commits to last `<number>`
- `--stat` which shows, for each commit, list and number of modified files and how many lines in those files were added and removed.
- `--pretty=<value>` changes the log output to formats other than the default, examples of `<value>`  are `oneline`, `short`, `full`, `fuller`, and `format` (where you specify your own format).

---

#### Task

Go to `~/repo/local_working_dir` and analyze the output of commands `git log`
