CC	 := gcc
CFLAGS 	 := -std=c11 -g -O0 -static -Wall 

INCLUDE  := -I ../include
MOTHER   := ../cc_sakura
TARGET   := ./child
SRCDIR   := ../src
ASMDIR   := ./asem
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
	cat src/header.c src/$(EXCLUDEFILE).c > tmp.c
	$(MOTHER) tmp.c > $(ASMDIR)/tmp.s 
	rm -f $(ASMDIR)/$(EXCLUDEFILE).s tmp.c
	gcc $(ASMDIR)/*.s -static -o ./child
	./child self_host.c || echo $$?

tmp:$(ASEMS)
	$(MOTHER) test.c > $(ASMDIR)/test.s
	gcc $(ASMDIR)/*.s -static -o ./child
	./child dummy.c || echo $$?

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
	rm -f $(OBJECTS) ./assemblies/*.s

.PHONY: self_host file_test clean install
