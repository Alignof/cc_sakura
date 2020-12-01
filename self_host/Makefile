CC	 := gcc
CFLAGS 	 := -std=c11 -g -O0 -static -Wall 

INCLUDE  := -I ../include
TARGET   := ../cc_sakura
SRCDIR   := ../src
OBJDIR   := ../src/obj
SOURCES  := $(wildcard ./src/*.c)
OBJECTS  := $(addprefix $(OBJDIR)/, $(notdir $(SOURCES:.c=.o)))

$(TARGET): $(OBJECTS)
	$(CC) -o $@ $^ $(LDFLAGS)

$(OBJDIR)/%.o: $(SRCDIR)/%.c 
	@[ -d $(OBJDIR) ]
	$(CC) $(CFLAGS) $(INCLUDE) -o $@ -c $<


install: $(OBJECTS)
	$(CC) -O2 -o $(TARGET) $^ $(LDFLAGS)

self_host: $(TARGET)
	$(TARGET) self_host.c > tmp.s && gcc -static tmp.s -o tmp
	./tmp || echo $$?

file_test: $(TARGET)
	$(TARGET) test.c > tmp.s && gcc -static tmp.s -o tmp
	./tmp || echo $$?

clean:
	rm -f *.o *.s *~ tmp* *.txt *.out
	rm -f $(OBJECTS) $(TARGET)

.PHONY: self_host file_test clean install
