# x8664 or riscv
ARCH    := riscv

ifeq ($(ARCH),x8664)
	BT	:= gcc
	CFLAGS 	:= -std=c11 -g -O0 -static -Wall 
	SOURCES := $(filter-out ./src/codegen_riscv.c, $(wildcard ./src/*.c))
	SELFSRC := $(filter-out ./sh_tmp/codegen_riscv.c, $(wildcard ./sh_tmp/*.c))
	SPIKE   := 
	PK      := 
else
	BT	:= /opt/riscv32/bin/riscv32-unknown-elf-gcc
	CFLAGS 	:= -std=c11 -g -O0 -static -Wall 
	SOURCES := $(filter-out ./src/codegen_x8664.c, $(wildcard ./src/*.c))
	SELFSRC := $(filter-out ./sh_tmp/codegen_x8664.c, $(wildcard ./sh_tmp/*.c))
	SPIKE   := /opt/riscv32/bin/spike --isa=RV32IMAC
	PK      := /opt/riscv32/riscv32-unknown-elf/bin/pk
endif

INCLUDE := -I ./include
TARGET  := ./cc_sakura
SRCDIR  := ./src
OBJDIR  := ./src/obj
OBJECTS := $(addprefix $(OBJDIR)/, $(notdir $(SOURCES:.c=.o)))

$(TARGET): $(OBJECTS)
	echo $(ARCH)
	echo $(BT)
	$(CC) -o $@ $^ $(LDFLAGS)

$(OBJDIR)/%.o: $(SRCDIR)/%.c 
	@[ -d $(OBJDIR) ]
	$(CC) $(CFLAGS) $(INCLUDE) -o $@ -c $<


install: $(OBJECTS)
	$(CC) -O2 -o $(TARGET) $^ $(LDFLAGS)

test: $(TARGET)
ifeq ($(ARCH),x8664)
	./test.sh x8664
else
	./test.sh riscv
endif

file_test: $(TARGET)
ifeq ($(ARCH),x8664)
	$(TARGET) test.c > tmp.s && $(BT) -static tmp.s -o tmp
	./tmp || echo $$?
else
	$(TARGET) test.c > tmp.s && $(BT) -static tmp.s -o tmp
	$(SPIKE) $(PK) ./tmp || echo $$?
endif

gcc_test: 
ifeq ($(ARCH),x8664)
	$(BT) test.c -S -masm=intel -O0 -o tmp.s && $(BT) -static -O0 tmp.s -o tmp
	./tmp || echo $$?
else
	$(BT) test.c -march=rv32imac -S -O0 -o tmp.s && $(BT) -static -O0 tmp.s -o tmp
	$(SPIKE) $(PK) ./tmp || echo $$?
endif


self_host: $(TARGET)
	# prepare
	rm -rf sh_tmp/
	mkdir sh_tmp/
	cp src/*.c sh_tmp/
	cp include/cc_sakura.h sh_tmp/
	perl -pi -e 's/0L/0/g' sh_tmp/*.c
	perl -pi -e 's/(?<!_)NULL/__NULL/g' sh_tmp/*.c
	perl -pi -e 's/^#include.*//g' sh_tmp/*.c
	perl -pi -e 's/^#define.*//g' sh_tmp/*.c
	perl -pi -e 's/FUNC_NUM/300/g' sh_tmp/*.c
	perl -pi -e 's/Label\s\*labels_tail;/Label *labels_tail;\nFILE  *stderr;/g' sh_tmp/main.c
	cat sh_tmp/cc_sakura.h > sh_tmp/self_host.c && cat $(SELFSRC) >> self_host.c

	# gen1
	$(TARGET) sh_tmp/self_host.c > sh_tmp/child.s && $(BT) -static sh_tmp/child.s -o sh_tmp/child
	cp sh_tmp/child.s sh_tmp/gen1.s
	# gen2
	$(SPIKE) $(PK) sh_tmp/child sh_tmp/self_host.c > sh_tmp/child.s && $(BT) -static sh_tmp/child.s -o sh_tmp/child
	cp sh_tmp/child.s sh_tmp/gen2.s
	# gen3
	$(SPIKE) $(PK) sh_tmp/child sh_tmp/self_host.c > sh_tmp/child.s && $(BT) -static sh_tmp/child.s -o sh_tmp/child
	cp sh_tmp/child.s sh_tmp/gen3.s

	# check
	diff gen2.s gen3.s
	cd ..
	rm -rf sh_tmp/

clean:
	rm -f cc_sakura *.o *.s *~ tmp* *.txt *.out child* gen*
	rm -f $(OBJECTS) $(TARGET)

.PHONY: test clean install self_host
