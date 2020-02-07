# Environment

Functions and autocompletions require the following env vars to be set:

```bash
# Replace "..." with the appropriate location
export CHERI=...
export CHERISDK=...
export CHERISDK=...
export CAP_SIZE=256
export SAIL_DIR=...
export SAIL_CHERI_MIPS_DIR=...
export UNINIT_CAP=1
```

## Functions

Easiest way to use these is by sourcing them in your shells rc file:

```bash
source $THESIS_REPO/environment/functions/*
```

## Autocompletions

Autocompletions will only work for ~zsh~. Add the following to your shells rc file:

```bash
fpath=($THESIS_REPO/environment/autocompletions $fpath)

# Enable Autocompletions for zsh
autoload -U compinit
compinit
```
