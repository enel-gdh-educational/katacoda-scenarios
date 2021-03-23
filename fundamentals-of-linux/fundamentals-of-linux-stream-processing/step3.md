

#### A) Go back to our mission

Do you remember our goal? 

Let's recap with this (in Italian :)):
```
tr 'a-zA-Z' 'n-za-mN-ZA-M' < data/README.txt | sed -n '18,33p' | sed -n '5,7p'
```

First of all, let's create a toy scenario. Let's do the following activities:
- Generate 15 random addresses into data/ip_addresses.txt
```./scripts/ip_address_generator.sh 15```
- Duplicate your bash tab in order to have double view and facilitate switching between them
- Execute the toy logger. The logging will be carried out by writing into the file "data/ping.log":
```./scripts/log_generator.sh```


Do you remember how to keep reading lines from continuosly appendend file?

And to do it as well, but by reading from the beginning?

<u>Hint</u> At some point the log generator could stop. You can run it again as well.

-----------

#### B) Filtering a log which is continuously updated

Now we know how the log is composed of. We have multiple rows of the same format:

```
64 bytes from 249.66.182.243: icmp_seq=1 ttl=64 time=0.0032 ms
```
The strategy could be the following:
- [FILTERING] Run over each line in the log file and filter out the unnecessary part in order to pick the IP address
- [FILTERING] Print each picked IP address to an output file (say data/ip_addresses_output.log)
- [COMPUTING] Perform counts on the output file
- [REPORTING] Create a mini report with results

Let's address the first two phases tagged with [FILTERING].

<u>Hint</u> Text lines have the same format, i.e ```64 bytes from <IP_ADDRESS>: icmp_seq=1 ttl=64 time=0.0032 ms```

<u>Hint</u> Use intermediate files as output in order to perform filtering step-by-step.

#### C) Create a sed command script in order to create a unique filtering step

Now we have all the filtering, let's aggregate the filtering in a unique sed script.

<u>Hint</u> You can simply "pipe" logging with sed as follows:
```
tail -n +0 -f data/ping.log | sed -f <sed_script.sed>
```

#### D) Generate the counts on the output of the previous step

In order to perform the counting, let's have a look at the simple bash script "script/count_ping_to_address.sh"

Can you see how sed is exploted also here?

Let's run it!

#### E) Reporting: create a simple report to show the result obtained.

In order to share the result with your Boss, let's transform the CSV file into a table-looking report in the bash console.

Before appying the command to create a tabular view, let's clean the CSV this way:
- substitute HEADER fields with UPPERCASE letters (i.e. address -> ADDRESS, count -> COUNT)
- remove double quotes, which are unuseful now
- remove ";" and substitute with " ,"

Can you write a line of bash to perform all?

<u>Hint</u> To create the tabular view pipe the above editing with ```column -t -s ,```
