# apper
A simple bash script for creating a Mac `.app` application bundle from a bash script or other executable.

## Why?
It is inconvenient for some users, such as those lacking access to or understanding of the Terminal, to run bash scripts or other CLI-only programs. When seeking to aid such users, a simple solution is to package a script or program as a traditional macOS/OS X application, runnable on double-click by any user. This program helps to do exactly this.

## Installation
To install, simply run:
```sh
make install
```
For development purposes, you can use
```sh
make link
```
This will symlink the script so that you can execute it without using bothersome `./` syntax or the like, while accounting for changes made in the locally cloned repository.

## Use
```sh
appify program.sh ~/Program.app --icon /path/to/file.icns
```

## Licensing
This software was created by [Erik Boesen](https://github.com/ErikBoesen) and is provided under the [MIT License](LICENSE).
