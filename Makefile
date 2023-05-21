# x86 or x8664 or riscv
# example:
# TARGET_ARCH := x86, x8664, rv32, rv64
TARGET_ARCH := rv64

CFLAGS	:= -std=c11 -g -O0 -static -Wall 
LDFLAGS := -static

ifeq ($(TARGET_ARCH),x8664)
	CC		:= gcc
	SPIKE   := 
	PK      := 
else ifeq ($(TARGET_ARCH),rv32)
	CC		:= /opt/riscv/bin/riscv64-unknown-elf-gcc -march=rv32imac -mabi=ilp32 
	SPIKE   := /opt/riscv/bin/spike --isa=RV32IMAC
	PK      := /opt/riscv/riscv32-unknown-elf/bin/pk
else ifeq ($(TARGET_ARCH),rv64)
	CC		:= /opt/riscv/bin/riscv64-unknown-elf-gcc 
	SPIKE   := /opt/riscv/bin/spike --isa=rv64imac
	PK      := /opt/riscv/riscv64-unknown-elf/bin/pk
endif

SOURCES := $(filter-out ./src/codegen_%, $(wildcard ./src/*.c)) ./src/codegen_$(TARGET_ARCH).c
INCLUDE = -I./include/$(TARGET_ARCH) -I/usr/include
TARGET  := ./cc_sakura
SRCDIR  := ./src
OBJDIR  := ./src/obj
OBJECTS := $(addprefix $(OBJDIR)/, $(notdir $(SOURCES:.c=.o)))

$(TARGET): $(OBJECTS)
	echo $(TARGET_ARCH)
	echo $(BT)
	$(CC) -o $@ $^ $(LDFLAGS)

$(OBJDIR)/%.o: $(SRCDIR)/%.c 
	@[ -d $(OBJDIR) ]
	$(CC) $(CFLAGS) $(INCLUDE) -o $@ -c $<


install: $(OBJECTS)
	$(CC) -O2 -o $(TARGET) $^ $(LDFLAGS)

test: $(TARGET)
	./test.sh $(TARGET_ARCH)

file_test: $(TARGET)
ifeq ($(TARGET_ARCH),x8664)
	$(TARGET) test.c > tmp.s && $(BT) -static tmp.s -o tmp
	./tmp || echo $$?
else
	$(TARGET) test.c > tmp.s && $(BT) -static tmp.s -o tmp
	$(SPIKE) $(PK) ./tmp || echo $$?
endif

gcc_test: 
ifeq ($(TARGET_ARCH),x8664)
	$(BT) test.c -S -masm=intel -O0 -o tmp.s && $(BT) -static -O0 tmp.s -o tmp
	./tmp || echo $$?
else
	$(BT) test.c -march=rv32imac -S -O0 -o tmp.s && $(BT) -static -O0 tmp.s -o tmp
	$(SPIKE) $(PK) ./tmp || echo $$?
endif


self_host: $(TARGET)
	# prepare
	rm -rf self_host/
	mkdir self_host/
	cp src/*.c self_host/
	cp include/$(TARGET_ARCH)/cc_sakura.h self_host/
	cat self_host/cc_sakura.h > self_host.c
ifeq ($(TARGET_ARCH),x8664)
	cat `ls --ignore=codegen_rv32.c -F src/ | grep -v / | perl -pe 's//src\//'` >> self_host.c
else
	cat `ls --ignore=codegen_x8664.c -F src/ | grep -v / | perl -pe 's//src\//'` >> self_host.c
endif
	rm -rf self_host/

	# gen1
	$(SPIKE) $(PK) $(TARGET) self_host.c > child.s 
	perl -pi -e 's/^bbl loader\r\n//' child.s 
	$(CC) -static child.s -o child
	cp child.s gen1.s
	# gen2
	$(SPIKE) $(PK) ./child self_host.c > child.s
	perl -pi -e 's/^bbl loader\r\n//' child.s
	$(CC) -static child.s -o child
	cp child.s gen2.s
	# gen3
	$(SPIKE) $(PK) ./child self_host.c > child.s
	perl -pi -e 's/^bbl loader\r\n//' child.s
	$(CC) -static child.s -o child
	cp child.s gen3.s

	# check
	diff gen2.s gen3.s

clean:
	rm -f cc_sakura *.o *.s *~ tmp* *.txt *.out child* gen*
	rm -f $(OBJECTS) $(TARGET)

.PHONY: test clean install self_host
