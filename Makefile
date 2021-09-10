# x8664 or riscv
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

clean:
	rm -f cc_sakura *.o *.s *~ tmp* *.txt *.out
	rm -f $(OBJECTS) $(TARGET)

.PHONY: test clean install
