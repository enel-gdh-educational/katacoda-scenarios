#### (Optional) Add an apt repository

Have you wondered how `apt` knows where to retrieve the package info? 

Well, a list of default repositories is defined in the file `/etc/apt/sources.list` which you can inspect as any text file (say, with `less`, `more` `head`, etc.).

An entry looks like:

```
deb http://archive.ubuntu.com/ubuntu/ bionic main restricted
```

where:
 - `deb` means that it contains `.deb` packages,
 - the second field is the URL, followed by 
 - the name of the repo, usually cotaining the Ubuntu version to which it refers (`bionic` = `18.04`),
 - the namespace(s) of the repo (main and `restricted`), a sort of subclassification of the package contained.


---
**Question 3**

What is the difference between the repositories `main`, `universe`, and `multiverse` 

*Hint*: read the comments in `/etc/apt/sources.list`

---


If you want to add repository entry you can do it manually via editing `/etc/apt/sources.list` or more easily via 
the utility `add-apt-repository`.

Let us install the latest version of the popular relational database `posttgresql`, which as of April 2020, is 12.2.

```bash
add-apt-repository "deb http://apt.postgresql.org/pub/repos/apt/ bionic-pgdg main"
```

---
**Question 4**

What is the name of the repository that you have just added?

---

However, Ubuntu does not know whether the newly added source is authentic.
 To this end, the mainainer of the repo release a security key that should be communicated to `apt`, via `apt-key add`.
 The following command downloads the official postgresql key and loads it in the `apt` key manager:


```bash
wget --quiet -O - https://www.postgresql.org/media/keys/ACCC4CF8.asc | apt-key add -
```

---
**Question 5 (advanced)**

Do you recognize what does each command do in the precious pipe?

And what each option do?

---


Now, let `apt` scan for the new sources:

```bash
apt update
```

Finally, install the latest version of postgres

```bash
apt install postgresql-12   
```

---
**Exercise 5**

R is a popular scripting environment mostly suitable to statistics and data science. Install it on Ubuntu.

*Hint*: Search the Internet to learn how!

---




