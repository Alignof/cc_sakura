CC	:= gcc
ARCH    := x8664 # x8664 or riscv

ifeq ($(ARCH), x8664)
	BT	 := gcc
	CFLAGS 	 := -std=c11 -g -O0 -static -Wall 
	SOURCES  := $(filter-out ./src/codegen_riscv.c, $(wildcard ./src/*.c))
else
	BT	 := /opt/riscv/bin/riscv64-unknown-linux-gnu-gcc
	CFLAGS 	 := -std=c11 -g -O0 -static -Wall 
	SOURCES  := $(filter-out ./src/codegen_x8664.c, $(wildcard ./src/*.c))
endif


INCLUDE := -I ./include
TARGET  := ./cc_sakura
SRCDIR  := ./src
OBJDIR  := ./src/obj
OBJECTS := $(addprefix $(OBJDIR)/, $(notdir $(SOURCES:.c=.o)))

$(TARGET): $(OBJECTS)
	$(CC) -o $@ $^ $(LDFLAGS)

$(OBJDIR)/%.o: $(SRCDIR)/%.c 
	@[ -d $(OBJDIR) ]
	$(CC) $(CFLAGS) $(INCLUDE) -o $@ -c $<


install: $(OBJECTS)
	$(CC) -O2 -o $(TARGET) $^ $(LDFLAGS)

test: $(TARGET)
	./test.sh

file_test: $(TARGET)
	echo $(ARCH)
	echo $(BT)
	$(TARGET) test.c > tmp.s && $(BT) -static tmp.s -o tmp
	./tmp || echo $$?

gcc_test: 
	$(BT) test.c -S -masm=intel -O0 -o tmp.s && $(BT) -static -O0 tmp.s -o tmp
	./tmp || echo $$?

clean:
	rm -f cc_sakura *.o *.s *~ tmp* *.txt *.out
	rm -f $(OBJECTS) $(TARGET)

.PHONY: test clean install
