CC	 := gcc
CFLAGS 	 := -std=c11 -g -O0 -static -Wall 

INCLUDE  := -I ../include
MOTHER   := ../cc_sakura
TARGET   := ./child
SRCDIR   := ../src
ASMDIR   := ./assemblies
OBJDIR   := ./assemblies/obj
SOURCES  := $(wildcard ../src/*.c)
ASEMS    := $(addprefix $(ASMDIR)/, $(notdir $(SOURCES:.c=.s)))
OBJECTS  := $(addprefix $(OBJDIR)/, $(notdir $(SOURCES:.c=.o)))
#ASEMS    := $(wildcard ./assemblies/*.s)
#ASEMS    := $(addprefix $(ASMDIR)/, $(notdir $(SOURCES:.c=.s)))

$(TARGET): $(OBJECTS)
	$(CC) -o $@ $^ $(LDFLAGS)

$(OBJDIR)/%.o: $(ASMDIR)/%.s 
	@[ -d $(OBJDIR) ]
	$(CC) $(CFLAGS) $(INCLUDE) -o $@ -c $<

# prepare franken 
prepare:$(ASEMS)
	$(MOTHER) test.c > ./assemblies/tmp.s 
	# remove duplicate asem

$(ASMDIR)/%.s: $(SRCDIR)/%.c 
	@[ -d $(ASMDIR) ]
	$(CC) $(INCLUDE) -S -masm=intel $< -o $@
	#$(CC) $(CFLAGS) $(INCLUDE) -o $@ -c $<

# build child by mother
build: $(MOTHER)
	$(MOTHER) self_host.c > child.s && gcc -static child.s -o child

# self hosting
self_host:
	$(MOTHER) self_host.c > child.s && gcc -static child.s -o child
	./child self_host.c

file_test:$(TARGET)
	./child dummy.c || echo $$?

clean:
	rm -f *.o *.s *~ child* *.txt *.out
	rm -f $(OBJECTS) ./assemblies/*.s

.PHONY: self_host file_test clean install
