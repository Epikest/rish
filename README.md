# RunInShell
fast zig rewrite of [RunInBash](https://github.com/neosmart/RunInBash), with a login shell\
consider renaming to `$.exe` and placing in path

pipes work, `` ` `` to escape windows variables and special characters

wrap command in double quotes and arguments in single quotes if something isn't working\
example: `"ls '/mnt/c/Program Files/'"` would not work without quotes

issues welcome
