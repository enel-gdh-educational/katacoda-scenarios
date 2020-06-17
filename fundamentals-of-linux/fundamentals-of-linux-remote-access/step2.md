SSH, or Secure Shell, is a protocol used to securely log onto remote systems. It is the most common way to access remote Linux and Unix-like servers.

The tool on Linux for connecting to a remote system using SSH is called ssh.

`man ssh`

The most basic form of the command is:

ssh remote_host

The remote_host in this example is the IP address or domain name that you are trying to connect to.

This command assumes that your username on the remote system is the same as your username on your local system.

If your username is different on the remote system, you can specify it by using this syntax:

ssh remote_username@remote_host

Once you have connected to the server, you will probably be asked to verify your identity by providing a password.

To exit back into your local session, simply type:

exit

##### Exercise
________

1. Connect to `[[HOST2_IP]]`

2. List all the users in the remote machine

3. Exit back into your local session

4. Connect to `[[HOST2_IP]]` using last user in the user list printed at 3. (password: p1)

5. Go to /lib/

6. List all files 

7. Exit back into local session
