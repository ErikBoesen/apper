# apper
A simple bash script for creating a Mac `.app` application bundle from a bash script or other executable.

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
appify special_script.sh ~/Desktop/Specialty.app
```

## Licensing
This software was created by [Erik Boesen](https://github.com/ErikBoesen) and is provided under the [MIT License](LICENSE).
