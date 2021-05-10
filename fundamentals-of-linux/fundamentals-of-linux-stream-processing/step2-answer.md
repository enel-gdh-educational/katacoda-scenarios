#### A)

`echo 'front' | sed 's/front/back/'`{{execute}}

#### B)

**echo** prints one line of text: setting address to 2 does not pick any row of text.

#### C)

**Q1**:
`sed -n p data/README_clear.txt`{{execute}}

**Q2**:
`sed -n 18,33p data/README_clear.txt`{{execute}}

#### D)

**format_data.sed:**

```
/localhost/i\
the following row has been edited: \

s/localhost/127.0.0.1/g
/_home_address/!p
```

We can see that when using command 'p' , each **matching row** is printed twice: one for the input and one for the output matching the rule. We can use an additional parameter '-n' before -f to avoid printing the input. 
