---
**Question 3**

Main - Officially supported software.

Restricted - Supported software that is not available under a completely free license.

Universe - Community maintained software, i.e. not officially supported software.

Multiverse - Software that is not free.
 
---

---
**Question 4**

bionic-pgdg
 
---

---
**Question 5**


```bash
wget --quiet -O - https://www.postgresql.org/media/keys/ACCC4CF8.asc 
```

downloads a key `ACCC4CF8.asc` from the URL, `--quiet` silences the logging, `-O -` directs the content of the file to the stdout.    

```bash
apt-key add -
```

adds a key taking it from the standard input, from the previous command.

---

<!--- Exercise 5 not working! skipping in 2021 
---
**Exercise 5**


Look into [https://www.digitalocean.com/community/tutorials/how-to-install-r-on-ubuntu-18-04-quickstart](https://www.digitalocean.com/community/tutorials/how-to-install-r-on-ubuntu-18-04-quickstart)

```bash
apt-key adv --keyserver keyserver.ubuntu.com --recv-keys E298A3A825C0D65DFD57CBB651716619E084DAB9
```

```bash
add-apt-repository 'deb https://cloud.r-project.org/bin/linux/ubuntu bionic-cran35/'
```

```bash
apt update
```

```bash
apt install r-base
```

---
-->