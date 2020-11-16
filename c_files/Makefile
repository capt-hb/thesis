CHERI_SDK-=/home/cheri/sdk
SYSROOT=$(CHERI_SDK)/sysroot256
CFLAGS=-mcpu=beri -mabi=purecap -cheri=256 -target cheri-unknown-freebsd -Wall --sysroot $(SYSROOT)
CLANG=$(CHERI_SDK)/bin/clang
OPT=-O0

%.o: %.c
	$(CLANG) $< $(CFLAGS) $(OPT) -o $@

%.s: %.c
	$(CLANG) -S $< $(CFLAGS) $(OPT) -o $@

%.ll: %.c
	$(CLANG) -S -emit-llvm $< $(CFLAGS) $(OPT) -o $@

clean:
	rm *.s
	rm *.ll
