CHERI_SDK-=/home/cheri/sdk
CFLAGS=-mcpu=beri -mabi=purecap -cheri-linker -target cheri-unknown-freebsd -Wall -fomit-frame-pointer
CLANG=$(CHERI_SDK)/bin/clang

%.s: %.c
	$(CLANG) -S $< $(CFLAGS) -o $@

%.ll: %.c
	$(CLANG) -S -emit-llvm $< $(CFLAGS) -o $@
