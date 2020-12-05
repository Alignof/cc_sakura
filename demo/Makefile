CC	 := gcc
CFLAGS 	 := -std=c11 -g -O0 -static

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


# franken 
EXCLUDEFILE := codegen
cg_franken:$(ASEMS)
	# target:$(EXCLUDEFILE)
	cat src/header.c src/$(EXCLUDEFILE).c > tmp.c
	# gen1
	$(MOTHER) tmp.c > $(ASMDIR)/$(EXCLUDEFILE).s 
	gcc $(ASMDIR)/*.s -static -o ./child
	cp $(ASMDIR)/$(EXCLUDEFILE).s ./gen1.s
	# gen2
	./child tmp.c > $(ASMDIR)/$(EXCLUDEFILE).s 
	gcc $(ASMDIR)/*.s -static -o ./child
	cp $(ASMDIR)/$(EXCLUDEFILE).s ./gen2.s
	# gen3
	./child tmp.c > $(ASMDIR)/$(EXCLUDEFILE).s 
	gcc $(ASMDIR)/*.s -static -o ./child
	cp $(ASMDIR)/$(EXCLUDEFILE).s ./gen3.s
	# check
	diff gen2.s gen3.s

EXCLUDEFILE := parse_util
pu_franken:$(ASEMS)
	# target:$(EXCLUDEFILE)
	cat src/header.c src/$(EXCLUDEFILE).c > tmp.c
	# gen1
	$(MOTHER) tmp.c > $(ASMDIR)/$(EXCLUDEFILE).s 
	gcc $(ASMDIR)/*.s -static -o ./child
	cp $(ASMDIR)/$(EXCLUDEFILE).s ./gen1.s
	# gen2
	./child tmp.c > $(ASMDIR)/$(EXCLUDEFILE).s 
	gcc $(ASMDIR)/*.s -static -o ./child
	cp $(ASMDIR)/$(EXCLUDEFILE).s ./gen2.s
	# gen3
	./child tmp.c > $(ASMDIR)/$(EXCLUDEFILE).s 
	gcc $(ASMDIR)/*.s -static -o ./child
	cp $(ASMDIR)/$(EXCLUDEFILE).s ./gen3.s
	# check
	diff gen2.s gen3.s



# fix franken 
PATCHFILE := replaced
patch:$(ASEMS)
	# patch target:$(PATCHFILE)
	cat src/header.c src/$(PATCHFILE).c > tmp.c
	# gen1
	$(MOTHER) tmp.c > $(ASMDIR)/$(PATCHFILE).s 
	gcc $(ASMDIR)/*.s -static -o ./child
	cp $(ASMDIR)/$(PATCHFILE).s ./gen1.s
	# gen2
	./child tmp.c > $(ASMDIR)/$(PATCHFILE).s 
	gcc $(ASMDIR)/*.s -static -o ./child
	cp $(ASMDIR)/$(PATCHFILE).s ./gen2.s
	# gen3
	./child tmp.c > $(ASMDIR)/$(PATCHFILE).s 
	gcc $(ASMDIR)/*.s -static -o ./child
	cp $(ASMDIR)/$(PATCHFILE).s ./gen3.s
	# check
	diff gen2.s gen3.s

$(ASMDIR)/%.s: $(SRCDIR)/%.c 
	@[ -d $(ASMDIR) ]
	$(CC) $(INCLUDE) $(CFLAGS) -S -masm=intel $< -o $@


duffs_device: $(MOTHER)
	cat duffs_device.c
	$(MOTHER) duffs_device.c > tmp.s && gcc -static tmp.s -o tmp
	./tmp || echo $$?

fizz_buzz: $(MOTHER)
	cat Fizzbuzz.c
	$(MOTHER) Fizzbuzz.c > tmp.s && gcc -static tmp.s -o tmp
	./tmp || echo $$?

N-queen: $(MOTHER)
	cat N-queen.c
	$(MOTHER) N-queen.c > tmp.s && gcc -static tmp.s -o tmp
	./tmp || echo $$?

Ninety-nine: $(MOTHER)
	cat Ninety-nine.c
	$(MOTHER) Ninety-nine.c > tmp.s && gcc -static tmp.s -o tmp
	./tmp || echo $$?

# self hosting
self_host:
	$(MOTHER) self_host.c > child.s && gcc -static child.s -o child
	./child self_host.c


# build child by mother
build: $(MOTHER)
	$(MOTHER) self_host.c > child.s && gcc -static child.s -o child


# run test.sh
test:
	./test.sh
simple_test:$(TARGET)
	./child dummy.c || echo $$?

clean:
	rm -f *.o *.s *~ child* *.txt *.out gen*
	rm -f $(OBJECTS) ./asem/*.s

.PHONY: self_host file_test clean install
