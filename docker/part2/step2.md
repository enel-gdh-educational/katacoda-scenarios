### Container file system is ephemeral

By default, all files created inside a container are stored on a writable container layer.
This means that the data doesn’t persist when that container no longer exists.