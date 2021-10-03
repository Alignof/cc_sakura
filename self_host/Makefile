ARCH    := riscv
SPIKE   := /opt/riscv32/bin/spike --isa=RV32IMAC
PK      := /opt/riscv32/riscv32-unknown-elf/bin/pk

ifeq ($(ARCH),x8664)
	BT	:= gcc
	CFLAGS 	:= -std=c11 -g -O0 -static -Wall 
	SOURCES := $(filter-out ./src/codegen_riscv.c, $(wildcard ./src/*.c))
else
	BT	:= /opt/riscv32/bin/riscv32-unknown-elf-gcc
	CFLAGS 	:= -std=c11 -g -O0 -static -Wall 
	SOURCES := $(filter-out ./src/codegen_x8664.c, $(wildcard ./src/*.c))
endif

INCLUDE  := -I ../include
MOTHER   := ../cc_sakura
TARGET   := ./child
SRCDIR   := ../src
ASMDIR   := ./asem
OBJDIR   := ./asem/obj
ASEMS    := $(addprefix $(ASMDIR)/, $(notdir $(SOURCES:.c=.s)))
OBJECTS  := $(addprefix $(OBJDIR)/, $(notdir $(SOURCES:.c=.o)))


$(ASMDIR)/%.s: $(SRCDIR)/%.c 
	@[ -d $(ASMDIR) ]
	$(CC) $(INCLUDE) $(CFLAGS) -S -masm=intel $< -o $@


define prepare_franken
	cat src/header.h > tmp.c
	for EF in $(EXCLUDEFILES); do\
		cat src/$$EF.c >> tmp.c;\
		rm -f $(ASMDIR)/$$EF.s;\
	done
endef


# franken 
EXCLUDEFILES := main
franken:$(ASEMS)
	# target:$(EXCLUDEFILES)
	@$(call prepare_franken)
ifeq ($(ARCH),x8664)
	# gen1
	$(MOTHER) tmp.c > $(ASMDIR)/tmp.s 
	$(BT) $(ASMDIR)/*.s -static -o ./child
	# gen2
	./child self_host.c > child.s && $(BT) -static child.s -o child
	cp child.s gen2.s
	# gen3
	./child self_host.c > child.s && $(BT) -static child.s -o child
	cp child.s gen3.s
else
	# gen1
	$(MOTHER) tmp.c > $(ASMDIR)/tmp.s 
	$(BT) $(ASMDIR)/*.s -static -o ./child
	# gen2
	$(SPIKE) $(PK) ./child self_host.c > child.s && $(BT) -static child.s -o child
	cp child.s gen2.s
	# gen3
	$(SPIKE) $(PK) ./child self_host.c > child.s && $(BT) -static child.s -o child
	cp child.s gen3.s
endif
	# check
	diff gen2.s gen3.s

# fix franken 
PATCHFILE   := patch
TARGETFILE  := target
EXCLUDEFILE := main
patch:$(ASEMS)
	# patch target:$(PATCHFILE)
	rm -f $(ASMDIR)/$(EXCLUDEFILE).s
	cat src/header.h $(PATCHFILE).c > tmp.c
	gcc $(INCLUDE) -static -S -masm=intel $(TARGETFILE).c -o $(ASMDIR)/$(TARGETFILE).s
	# gen1
	$(MOTHER) tmp.c > $(ASMDIR)/$(PATCHFILE).s 
	cp $(ASMDIR)/$(PATCHFILE).s ./gen1.s
	gcc $(ASMDIR)/*.s -static -o ./child
	# gen2
	./child self_host.c > child.s && gcc -static child.s -o child
	cp child.s gen2.s
	# gen3
	./child self_host.c > child.s && gcc -static child.s -o child
	cp child.s gen3.s
	# check
	diff gen2.s gen3.s


# build child by mother
build: $(MOTHER)
	$(MOTHER) self_host.c > child.s && $(BT) -static child.s -o child


# run test.sh
test:
	./test.sh

# self hosting
self_host:
	# prepare
	cat src/header.h > self_host.c && cat $(SOURCES) >> self_host.c
ifeq ($(ARCH),x8664)
	# gen1
	$(MOTHER) self_host.c > child.s && $(BT) -static child.s -o child
	cp child.s gen1.s
	# gen2
	./child self_host.c > child.s && $(BT) -static child.s -o child
	cp child.s gen2.s
	# gen3
	./child self_host.c > child.s && $(BT) -static child.s -o child
	cp child.s gen3.s
else
	# gen1
	$(MOTHER) self_host.c > child.s && $(BT) -static child.s -o child
	cp child.s gen1.s
	# gen2
	$(SPIKE) $(PK) ./child self_host.c > child.s && $(BT) -static child.s -o child
	cp child.s gen2.s
	# gen3
	$(SPIKE) $(PK) ./child self_host.c > child.s && $(BT) -static child.s -o child
	cp child.s gen3.s
endif
	# check
	diff gen2.s gen3.s

simple_test:$(TARGET)
	./child dummy.c || echo $$?

update_src:
	rm -f src/*.c
	cp ../src/*.c src/
	perl -pi -e 's/0L/0/g' src/*.c
	perl -pi -e 's/(?<!_)NULL/__NULL/g' src/*.c
	perl -pi -e 's/^#include.*//g' src/*.c
	perl -pi -e 's/^#define.*//g' src/*.c
	perl -pi -e 's/FUNC_NUM/300/g' src/*.c
	perl -pi -e 's/Label\s\*labels_tail;/Label *labels_tail;\nFILE  *stderr;/g' src/main.c

clean:
	rm -f *.o *.s *~ child* *.txt *.out gen*
	rm -f $(OBJECTS) ./asem/*.s

.PHONY: self_host file_test clean install
