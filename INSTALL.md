# Install Instructions

Assumed to be installed: _opam_

## Sail

The OPAM install guide for Sail is the easiest way to install it and can be found at [SAIL INSTALL](https://github.com/rems-project/sail/wiki/OPAMInstall).
Perform the installation part for the development version too!
The sail dir is required for CHERITest.

## CHERI

Clone the [sail-cheri-mips](https://github.come/capt-hb/sail-cheri-mips) repository and perform the following commands to build the emulator for 256 bit capabilities:

```bash
$ git clone git@github.com:capt-hb/sail-cheri-mips
$ cd sail-cheri-mips/cheri
$ make cheri cheri_c # builds the cheri ocaml emulator and c emulator
```

Building the 128 bit version will fail because it is not adjusted for uninitialized capabilities.

## CHERITest

Clone the [cheribuild](https://github.com/CTSRD-CHERI/cheritest), [cheritest](https://github.com/CTSRD-CHERI/cheritest) repositories and run the tests:

```bash
$ git clone git@github.com:CTSRD-CHERI/cheribuild
$ git clone git@github.com:CTSRD-CHERI/cheritest
$ # build the cheri sdk
$ cheribuild/cheribuild.py --source-root $CHERI --qemu/no-use-smbd sdk # source root indicates where to place the CHERI repo's ($HOME/cheri is the default value if --source-root is omitted)
$ # follow the instructions of cheribuild, it will ask to clone repositories (cheribsd, llvm-project, ...)
$ # the sdk can be found in $CHERI/output/sdk
$ # the following env vars could also be given before the make command but it is convenient to place these in a .env file and load them once for the shell session
$ export CHERI_SDK="$CHERI/output/sdk"
$ export CAP_SIZE=256
$ export SAIL_DIR="/path/to/sail/repository"
$ export SAIL_CHERI_MIPS_DIR="/path/to/sail-cheri-mips/repository"
$ cd cheritest
$ make sail256 # run all tests
$ make pytest/sail_cheri_c/tests/alu/test_mul.py # run individual test
```

To rerun a test, delete the corresponding log file (otherwise "Make command is up to date" will be printed and the test will not be executed).
