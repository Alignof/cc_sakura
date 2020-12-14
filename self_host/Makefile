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

# $(TARGET): $(OBJECTS)
# 	$(CC) -o $@ $^ $(LDFLAGS)
# 
# $(OBJDIR)/%.o: $(ASMDIR)/%.s 
# 	@[ -d $(OBJDIR) ]
# 	$(CC) $(CFLAGS) -o $@ -c $<


$(ASMDIR)/%.s: $(SRCDIR)/%.c 
	@[ -d $(ASMDIR) ]
	$(CC) $(INCLUDE) $(CFLAGS) -S -masm=intel $< -o $@


# franken 
EXCLUDEFILES := tokenizer main
franken:$(ASEMS)
	# target:$(EXCLUDEFILES)
	for EF in $(EXCLUDEFILES); do\
		cat src/header.h src/$$EF.c > tmp.c;\
	done
	# # gen1
	# $(MOTHER) tmp.c > $(ASMDIR)/$(EXCLUDEFILES).s 
	# gcc $(ASMDIR)/*.s -static -o ./child
	# cp $(ASMDIR)/$(EXCLUDEFILES).s ./gen1.s
	# # gen2
	# ./child tmp.c > $(ASMDIR)/$(EXCLUDEFILES).s 
	# gcc $(ASMDIR)/*.s -static -o ./child
	# cp $(ASMDIR)/$(EXCLUDEFILES).s ./gen2.s
	# # gen3
	# ./child tmp.c > $(ASMDIR)/$(EXCLUDEFILES).s 
	# gcc $(ASMDIR)/*.s -static -o ./child
	# cp $(ASMDIR)/$(EXCLUDEFILES).s ./gen3.s
	# # check
	# diff gen2.s gen3.s

# fix franken 
PATCHFILE   := patch
TARGETFILE  := target
EXCLUDEFILE := tokenizer
patch:$(ASEMS)
	# patch target:$(PATCHFILE)
	rm -f $(ASMDIR)/$(EXCLUDEFILE).s
	cat src/header.h $(PATCHFILE).c > tmp.c
	gcc $(INCLUDE) -static -S -masm=intel $(TARGETFILE).c -o $(ASMDIR)/$(TARGETFILE).s
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


# build child by mother
build: $(MOTHER)
	$(MOTHER) self_host.c > child.s && gcc -static child.s -o child


# run test.sh
test:
	./test.sh

# self hosting
self_host:
	# prepare
	cat src/header.h > self_host.c && cat src/*.c >> self_host.c
	# gen1
	$(MOTHER) self_host.c > child.s && gcc -static child.s -o child
	cp child.s gen1.s
	# gen2
	./child self_host.c > child.s && gcc -static child.s -o child
	cp child.s gen2.s
	# gen3
	./child self_host.c > child.s && gcc -static child.s -o child
	cp child.s gen3.s
	# check
	diff gen2.s gen3.s

simple_test:$(TARGET)
	./child dummy.c || echo $$?

clean:
	rm -f *.o *.s *~ child* *.txt *.out gen*
	rm -f $(OBJECTS) ./asem/*.s

.PHONY: self_host file_test clean install
