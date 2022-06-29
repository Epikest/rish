# rish

[![Zig](https://img.shields.io/badge/Zig-F7A41D?logo=zig&logoColor=fff&style=flat-square)](https://ziglang.org) [![GitHub all releases](https://img.shields.io/github/downloads/Epikest/rish/total?label=Downloads&logo=github&color=%233fb950&style=flat-square)](https://github.com/Epikest/rish/releases) [![GitHub Repo stars](https://img.shields.io/github/stars/Epikest/rish?style=social)](https://github.com/Epikest/rish/stargazers)

rish, formerly known as RunInShell, is a fast zig rewrite of [RunInBash](https://github.com/neosmart/RunInBash), with a login shell\
consider renaming to `$.exe` and moving to a directory in $env:PATH

pipes work, `` ` `` to escape windows variables and special characters

wrap command in double quotes and arguments in single quotes if something isn't working\
example: `"ls '/mnt/c/Program Files/'"` would not work without quotes

issues welcome

## building

### personal

it is preferred to build rish for yourself so that you get all the speed optimizations for your computer

```ps1
zig build -Dshell=zsh -Drelease-fast -p .\zig-out\native
cp .\zig-out\native\bin\$.exe C:\Windows\System32 # or any other directory in $env:PATH
```

### release

```ps1
zig build -Dshell=bash -Dexe-name=bash-x86_64 -Drelease-fast -Dtarget=x86_64-windows-gnu -Dcpu=baseline -p .\zig-out\release\bash
zig build -Dshell=bash -Dexe-name=bash-aarch64 -Drelease-fast -Dtarget=aarch64-windows-gnu -Dcpu=baseline -p .\zig-out\release\bash

zig build -Dshell=zsh -Dexe-name=zsh-x86_64 -Drelease-fast -Dtarget=x86_64-windows-gnu -Dcpu=baseline -p .\zig-out\release\zsh
zig build -Dshell=zsh -Dexe-name=zsh-aarch64 -Drelease-fast -Dtarget=aarch64-windows-gnu -Dcpu=baseline -p .\zig-out\release\zsh

zig build -Dshell=fish -Dexe-name=fish-x86_64 -Drelease-fast -Dtarget=x86_64-windows-gnu -Dcpu=baseline -p .\zig-out\release\fish
zig build -Dshell=fish -Dexe-name=fish-aarch64 -Drelease-fast -Dtarget=aarch64-windows-gnu -Dcpu=baseline -p .\zig-out\release\fish
```
