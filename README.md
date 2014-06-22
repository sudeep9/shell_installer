
Shell Installer
===============

A small utility to create self installing shell scripts. 

Installation
------------

* clone this repository or download the zip
* Unzip if you download the archive

Usage
-----

### Create an installer

Say you have archive, say myprogram.tar.gz, then the command to create installer is:

```
cd shell_installer
./create_installer myprogram.tar.gz templates/basic.sh $HOME/installers
```

This will create installer file: $HOME/installers/myprogram_install.sh


### Using the installer

In the target environment do this:

```
myprogram_install.sh /some/place/where/u/want/to/install
```

if you omit the install dir, the current dir is used for the purpose
