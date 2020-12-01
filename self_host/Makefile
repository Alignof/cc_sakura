CC	 := gcc
CFLAGS 	 := -std=c11 -g -O0 -static -Wall 

INCLUDE  := -I ../include
MOTHER   := ../cc_sakura
TARGET   := ./child
SRCDIR   := ../src
ASMDIR   := ./assemblies
OBJDIR   := ./assemblies/obj
SOURCES  := $(wildcard ../src/*.c)
ASMS     := $(wildcard ./assemblies/*.s)
OBJECTS  := $(addprefix $(OBJDIR)/, $(notdir $(SOURCES:.c=.o)))

$(TARGET): $(OBJECTS)
	$(CC) -o $@ $^ $(LDFLAGS)

$(OBJDIR)/%.o: $(ASMDIR)/%.s 
	@[ -d $(OBJDIR) ]
	$(CC) $(CFLAGS) $(INCLUDE) -o $@ -c $<


# build child by mother
build: $(MOTHER)
	$(MOTHER) self_host.c > child.s && gcc -static child.s -o child

# prepare franken 
prepare:$(ASEMS)
	cp $(SRCDIR)/*.c ./assemblies
	$(MOTHER) test.c > ./assemblies/tmp.s 
	# remove duplicate asem

# self hosting
self_host: $(MOTHER)
	$(MOTHER) self_host.c > child.s && gcc -static child.s -o child
	./child self_host.c

file_test:
	./child dummy.c || echo $$?

clean:
	rm -f *.o *.s *~ child* *.txt *.out
	rm -f $(OBJECTS) $(MOTHER)

.PHONY: self_host file_test clean install
