ARCH     := INTEL

ifeq ($(ARCH), INTEL)
CC	 := gcc
CFLAGS 	 := -std=c11 -g -O0 -static -Wall 
else
CC	 := /opt/riscv/bin/riscv64-unknown-linux-gnu-gcc
CFLAGS 	 := -std=c11 -g -O0 -static -Wall 
endif


INCLUDE  := -I ./include
TARGET   := ./cc_sakura
SRCDIR   := ./src
OBJDIR   := ./src/obj
SOURCES  := $(wildcard ./src/*.c)
OBJECTS  := $(addprefix $(OBJDIR)/, $(notdir $(SOURCES:.c=.o)))

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
	$(TARGET) test.c > tmp.s && gcc -static tmp.s -o tmp
	./tmp || echo $$?

gcc_test: 
	gcc test.c -S -masm=intel -O0 -o tmp.s && gcc -static -O0 tmp.s -o tmp
	./tmp || echo $$?

clean:
	rm -f cc_sakura *.o *.s *~ tmp* *.txt *.out
	rm -f $(OBJECTS) $(TARGET)

.PHONY: test clean install
