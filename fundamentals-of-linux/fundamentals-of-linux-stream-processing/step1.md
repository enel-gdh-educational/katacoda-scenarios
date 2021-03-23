
----------

#### A) Start with an enigma: reveal text with translitteration

Let's start with a game. 
Now we are proficient with text manipulation and we know how to show text in the bash console and
how to manipulate text to get insigths.

Do you remember how to use **tr** command for translitteration?

**Tip:** To have further information about any command and to 
display the user manual you can run on the terminal:

`man command`{{copy}}

First of all let's start with README.txt file located in the "data" directory to start this new session.. What do you get?

<u>Hint:</u> use the **more**, **less** or **cat** commands.

-----------

#### B) ROT13: The Not-So-Secret Decoder Ring
One amusing use of *tr* is to perform ROT13 encoding of text. ROT13 is a trivial type of encryption, 
or more specifically “text obfuscation” technique based on a simple substitution cipher. 
It is used sometimes on text to obscure potentially offensive content. 

The method simply moves each character 13 places up the alphabet. Since this is half way up the possible 26 characters, 
performing the algorithm a *second time* on the text restores it to its original form. 

Use the following to perform this encoding with ***tr***:

`echo "secret text" | tr a-zA-Z n-za-mN-ZA-M`{{execute}}

Can you imagine how to exploit it to reveal the text in your README.txt file?

<u>Hint:</u> The alphabet (represented here as "a-zA-Z") is composed by 26 characters and the 13th character is 'M'.

<u>Hint:</u> In order to provide a file as input to a command you can use `<` redirection.

-----------



