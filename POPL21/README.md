# Uninitialized Capabilities
The virtual machine image provided for this artifact runs Ubuntu 20.04 and has all dependencies preinstalled.
This makes testing the modified projects easier and the build process should not give any errors.
All the repositories included in this artifact can be found in `$HOME/Repositories`. 
Note that not all of these repositories were modified, but all of them are needed to build the CHERI SDK and to run the tests.
For more information on the modified projects, consult the `Repositories` section in this document.

This virtual machine contains the artifacts described in section 7 of the paper "Efficient and Provable Local Capability Revocation using Uninitialized Capabilities".
This artifact is intended to demonstrate that uninitialized capabilities can be added to the CHERI ISA and can be used to build a modified simulator and assembler to experiment with the proposed extension.
Additionally, it contains some assembly tests for the simulator and some manually modified assembly files that we used to experiment with the calling convention.

No password is requested upon starting the virtual machine, if needed however, the following credentials can be used:
- Username: `user`
- Password: `user`

## Contents

This section gives an overview of the different projects that were modified to add uninitialized capabilities to the CHERI-MIPS ISA and to experiment and test the implementation of uninitialized capabilities and a novel calling convention that uses them.

### sail-cheri-mips
Location: `$HOME/Repositories/sail-cheri-mips`.

This project defines the concrete operational semantics for the CHERI-MIPS ISA. It is extended with the implementation of uninitialized capabilities and its instructions.
Sail is able to built a simulator from the sail source code, which can be used for experimenting and testing.

### llvm-project
Location: `$HOME/Repositories/llvm-project`.

The LLVM assembler for CHERI-MIPS is modified so that the new instructions (as added in the `sail-cheri-mips` project) are compiled to the corresponding instruction format in the CHERI-MIPS ISA.
This codebase is quite large, our modifications are situated in the MIPS backend, `llvm-project/llvm/lib/Target/Mips` and some minor additions were made to the intrinsics available in llvm, `llvm-project/include/llvm/IR/IntrinsicsCheriCap.td`.

### cheritest
Location: `$HOME/Repositories/cheritest`.

By extending this project we were able to reuse the testing infrastructure for CHERI-MIPS. We added our own tests for the new and modified instructions for uninitialized capabilities.
We also provide tests that show that our calling convention produces the same results as the original calling convention.

## Build
The recommended way to build the CHERI SDK is using the `cheribuild.py` script, which can be found in `$HOME/Repositories/cheribuild`.
The CHERI SDK can then be built by issuing the following command: `./cheribuild.py freestanding-sdk`.

The scripts in `$HOME/Scripts` help with building (parts of) the SDK. The name of the script is `thesis` and it has a subcommand `build`.
The available build arguments are:
- `all`: build `mips`, `llvm` and the `sdk`;
- `mips`: build the `sail-cheri-mips` project;
- `llvm`: build the `llvm-project`;
- `sdk`: executes `./cheribuild.py freestanding-sdk`.

So the command to build the CHERI SDK now becomes: `thesis build sdk`.
Autocompletion is available for the script (only when using *zsh* as your shell).

If one wishes to build the included repositories individually, please refer to the instructions available in those repositories (consult their `README`).

## Tests

Tests can be run from the `$HOME/Repositories/cheritest` project. 
For example, running the test regarding the `CSHRINK` instruction can be done so:
```zsh
make pytest/sail_cheri_c/tests/uninitialized_capabilities/test_cshrink.py
```

Doing this for each test is quite cumbersome, so instead it is recommended to use the `thesis` script here too, with the `test` subcommand.
The above test can then be run as: `thesis test cshrink` (no `test_` prefix or `.py` suffix are needed).
To find the available tests, please use autocompletion: `thesis test <tab>`.
There are 2 arguments that can be given after `thesis test` that will run multiple tests:
- `all`: this will run all the tests created for uninitialized capabilities (in `tests/uninitialized_capabilities`) but also the tests regarding the calling convention (in `tests/purecap`, with the file name format outlined in the section on `cheritest` later in this document);
- `purecap`: runs the tests regarding the calling convention (in `tests/purecap`).

All the other arguments availabe for `thesis test` will run a single test.

Finally, there is one more script at your disposal that can be used to time the performance of the calling conventions (i.e. how long they take to execute on the sail-cheri-mips C simulator).
This script can be called with `thesis_time` and expects a single argument, the name of the calling convention test.
The argument expects only the `<test_name>` part of the format of the calling convention file names (see the section on the cheritest repository below).
For example, measuring the performance of the original calling convention and the calling convention with uninitialized capabilities for the `cc_slow_factorial` program can be done so: `thesis_time cc_slow_factorial`.

## Repositories
### sail-cheri-mips
The `sail-cheri-mips` repository is used to generate a C emulator to execute ELF executables on.
The files modified to implement uninitialized capabilities are:
- `cheri/cheri_prelude_256.sail`: updated capability format for uninitialized permission and added
  some helper functions;
- `cheri/cheri_insts.sail`: instruction modifications and new modifications w.r.t. uninitialized 
  capabilities.

### llvm-project
The LLVM CHERI-MIPS target is updated so that the assembly instructions regarding uninitialized capabilities are understood by the assembler.

More concretely, the modified files are:
- `llvm/lib/Target/Mips/MipsInstrCheri.td`: new instructions for uninitialized capabilities have been
  added here;
- `llvm/lib/Target/Mips/MipsInstrFormatsCheri.td`: one format has been added for the "uninitialized
  store instructions", this format is defined as the class `CheriFmtUCS`;
- `llvm/include/llvm/IR/IntrinsicsCheriCap.td`: intrinsics added for new instructions.

### cheritest
Each test in this repository consists of 2 files, an assembly program and a python program.
The python program contains the assertions of the test.

Tests regarding uninitialized capabilities can be found in `tests/uninitialized_capabilities`.
Tests for the calling convention can be found in the `tests/purecap` directory and use the following naming convention: `test_purecap_<original|uninit>_cc_<test_name>`. 
*Original* refers to the _unmodified_ calling convention for CHERI-MIPS and *uninit* refers to the modified calling convention, i.e. the calling convention using uninitialized capabilities.

## Configuration

The default configuration for the `cheribuild.py` tool can be found in `$HOME/.config/cheribuild.json`. 
