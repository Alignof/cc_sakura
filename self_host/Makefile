CC	 := gcc
CFLAGS 	 := -std=c11 -g -O0 -static -Wall 

INCLUDE  := -I ../include
MOTHER   := ../cc_sakura
TARGET   := ./child
SRCDIR   := ../src
ASMDIR   := ./asem
GEN2DIR  := ./gen2
OBJDIR   := ./asem/obj
SOURCES  := $(wildcard ../src/*.c)
ASEMS    := $(addprefix $(ASMDIR)/, $(notdir $(SOURCES:.c=.s)))
OBJECTS  := $(addprefix $(OBJDIR)/, $(notdir $(SOURCES:.c=.o)))
#ASEMS    := $(wildcard ./assemblies/*.s)

# $(TARGET): $(OBJECTS)
# 	$(CC) -o $@ $^ $(LDFLAGS)
# 
# $(OBJDIR)/%.o: $(ASMDIR)/%.s 
# 	@[ -d $(OBJDIR) ]
# 	$(CC) $(CFLAGS) -o $@ -c $<


# prepare franken 
EXCLUDEFILE := codegen
franken:$(ASEMS)
	# prepare
	cat src/header.c src/$(EXCLUDEFILE).c > tmp.c
	# gen1
	$(MOTHER) tmp.c > $(ASMDIR)/$(EXCLUDEFILE).s 
	gcc $(ASMDIR)/*.s -static -o ./child
	# gen2
	./child tmp.c > $(ASMDIR)/$(EXCLUDEFILE).s 
	gcc $(ASMDIR)/*.s -static -o ./child
	cp $(ASMDIR)/$(EXCLUDEFILE).s ./gen2
	# gen3
	./child tmp.c > $(ASMDIR)/$(EXCLUDEFILE).s 
	gcc $(ASMDIR)/*.s -static -o ./child
	cp $(ASMDIR)/$(EXCLUDEFILE).s ./gen3
	# check
	diff gen2 gen3

gentest:
	./child tmp.c > $(ASMDIR)/$(EXCLUDEFILE).s 
	cp $(ASMDIR)/$(EXCLUDEFILE).s ./gen2
	gcc $(ASMDIR)/*.s -static -o ./child
	./child tmp.c > $(ASMDIR)/$(EXCLUDEFILE).s 
	cp $(ASMDIR)/$(EXCLUDEFILE).s ./gen3
	diff gen2 gen3

$(ASMDIR)/%.s: $(SRCDIR)/%.c 
	@[ -d $(ASMDIR) ]
	$(CC) $(INCLUDE) $(CFLAGS) -S -masm=intel $< -o $@


# build child by mother
build: $(MOTHER)
	$(MOTHER) self_host.c > child.s && gcc -static child.s -o child


# run test.sh
test:
	./test.sh

# self hosting
self_host:
	$(MOTHER) self_host.c > child.s && gcc -static child.s -o child
	./child self_host.c

file_test:$(TARGET)
	./child dummy.c || echo $$?

clean:
	rm -f *.o *.s *~ child* *.txt *.out
	rm -f $(OBJECTS) ./asem/*.s

.PHONY: self_host file_test clean install
