CC	 := gcc
CFLAGS 	 :=-std=c11 -g -O0 -static -Wall

INCLUDE  := -I./include
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

test: cc_sakura
	./test.sh

file_test: cc_sakura
	./cc_sakura test.c > tmp.s && gcc tmp.s -o tmp && ./tmp

clean:
	rm -f cc_sakura *.o *.s *~ tmp* *.txt *.out
	rm -f $(OBJECTS) $(TARGET)

.PHONY: test clean install
