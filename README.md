# RunInShell

[![Zig](https://img.shields.io/badge/Zig-F7A41D?logo=zig&logoColor=fff&style=flat-square)](https://ziglang.org) [![GitHub all releases](https://img.shields.io/github/downloads/Epikest/RunInShell/total?label=Downloads&logo=github&color=%233fb950&style=flat-square)](https://github.com/Epikest/RunInShell/releases) [![GitHub Repo stars](https://img.shields.io/github/stars/Epikest/RunInShell?style=social)](https://github.com/Epikest/RunInShell/stargazers)

fast zig rewrite of [RunInBash](https://github.com/neosmart/RunInBash), with a login shell\
consider renaming to `$.exe` and placing in path

pipes work, `` ` `` to escape windows variables and special characters

wrap command in double quotes and arguments in single quotes if something isn't working\
example: `"ls '/mnt/c/Program Files/'"` would not work without quotes

issues welcome

## building

### personal

it is preferred to build RunInShell for yourself so that you get all the speed optimizations for your cpu

```ps1
zig build -Drelease-fast
cp .\zig-out\bin\$.exe C:\Windows\System32
```

### release

```ps1
zig build -Drelease-fast -Dtarget=x86_64-windows-gnu -Dcpu=baseline -p .\zig-out\x86_64
zig build -Drelease-fast -Dtarget=aarch64-windows-gnu -Dcpu=baseline -p .\zig-out\aarch64
```
