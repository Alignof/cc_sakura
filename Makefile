# x8664 or riscv
ARCH    := riscv
CFLAGS	:= -std=c11 -g -O0 -static -Wall 
LDFLAGS := -static

ifeq ($(ARCH),x8664)
	BT	:= gcc
	SOURCES := $(filter-out ./src/codegen_riscv.c, $(wildcard ./src/*.c))
	SPIKE   := 
	PK      := 
	SELFSRC = $(filter-out ./sh_tmp/codegen_riscv.c, $(wildcard ./sh_tmp/*.c))
else
	BT	:= /opt/riscv32/bin/riscv32-unknown-elf-gcc
	SOURCES := $(filter-out ./src/codegen_x8664.c, $(wildcard ./src/*.c))
	SPIKE   := /opt/riscv32/bin/spike --isa=RV32IMAC
	PK      := /opt/riscv32/riscv32-unknown-elf/bin/pk
	SELFSRC = $(filter-out ./sh_tmp/codegen_x8664.c, $(wildcard ./sh_tmp/*.c))
endif

INCLUDE := -I./include -I/usr/include
TARGET  := ./cc_sakura
SRCDIR  := ./src
OBJDIR  := ./src/obj
OBJECTS := $(addprefix $(OBJDIR)/, $(notdir $(SOURCES:.c=.o)))

$(TARGET): $(OBJECTS) ./include/cc_sakura.h
	echo $(ARCH)
	echo $(BT)
	$(CC) -o $@ $^ $(LDFLAGS)

$(OBJDIR)/%.o: $(SRCDIR)/%.c 
	@[ -d $(OBJDIR) ]
	$(CC) $(CFLAGS) $(INCLUDE) -o $@ -c $<


install: $(OBJECTS)
	$(CC) -O2 -o $(TARGET) $^ $(LDFLAGS)

test: $(TARGET)
	./test.sh $(ARCH)

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
	cat sh_tmp/cc_sakura.h > self_host.c && cat $(SELFSRC) >> self_host.c
	rm -rf sh_tmp/

	# gen1
	$(TARGET) self_host.c > child.s && $(BT) -static child.s -o child
	cp child.s gen1.s
	# gen2
	$(SPIKE) $(PK) child self_host.c > child.s && $(BT) -static child.s -o child
	cp child.s gen2.s
	# gen3
	$(SPIKE) $(PK) child self_host.c > child.s && $(BT) -static child.s -o child
	cp child.s gen3.s

	# check
	diff gen2.s gen3.s

clean:
	rm -f cc_sakura *.o *.s *~ tmp* *.txt *.out child* gen*
	rm -f $(OBJECTS) $(TARGET)

.PHONY: test clean install self_host
