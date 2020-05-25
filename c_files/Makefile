CHERI_SDK-=/home/cheri/sdk
CFLAGS=-mcpu=beri -mabi=purecap -cheri-linker -cheri=256 -target cheri-unknown-freebsd -Wall -fomit-frame-pointer
CLANG=$(CHERI_SDK)/bin/clang
OPT=-O0

%.s: %.c
	$(CLANG) -S $< $(CFLAGS) $(OPT) -o $@

%.ll: %.c
	$(CLANG) -S -emit-llvm $< $(CFLAGS) $(OPT) -o $@

clean:
	rm *.s
	rm *.ll
