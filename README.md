# RunInShell
[![Zig](https://img.shields.io/badge/Zig-F7A41D?logo=zig&logoColor=fff&style=flat-square)](https://ziglang.org) [![GitHub all releases](https://img.shields.io/github/downloads/Epikest/RunInShell/total?label=Downloads&logo=github&color=%233fb950&style=flat-square)](https://github.com/Epikest/RunInShell/releases) [![GitHub Repo stars](https://img.shields.io/github/stars/Epikest/RunInShell?style=social)](https://github.com/Epikest/RunInShell/stargazers)

fast zig rewrite of [RunInBash](https://github.com/neosmart/RunInBash), with a login shell\
consider renaming to `$.exe` and placing in path

pipes work, `` ` `` to escape windows variables and special characters

wrap command in double quotes and arguments in single quotes if something isn't working\
example: `"ls '/mnt/c/Program Files/'"` would not work without quotes

issues welcome
