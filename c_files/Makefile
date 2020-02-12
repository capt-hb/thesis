CHERI_SDK-=/home/cheri/sdk
CFLAGS=-mcpu=beri -mabi=purecap -cheri-linker -target cheri-unknown-freebsd -Wall
CLANG=$(CHERI_SDK)/bin/clang

%.s: %.c
	$(CLANG) -S $< $(CFLAGS) -o $@
