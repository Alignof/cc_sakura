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

# $(TARGET): $(OBJECTS)
# 	$(CC) -o $@ $^ $(LDFLAGS)
# 
# $(OBJDIR)/%.o: $(ASMDIR)/%.s 
# 	@[ -d $(OBJDIR) ]
# 	$(CC) $(CFLAGS) -o $@ -c $<


$(ASMDIR)/%.s: $(SRCDIR)/%.c 
	@[ -d $(ASMDIR) ]
	$(CC) $(INCLUDE) $(CFLAGS) -S -masm=intel $< -o $@


define prepare_franken
	cat src/header.h > tmp.c
	for EF in $(EXCLUDEFILES); do\
		diff ../src/$$EF.c src/$$EF.c;\
		cat src/$$EF.c >> tmp.c;\
		rm -f $(ASMDIR)/$$EF.s;\
	done
endef


# franken 
#EXCLUDEFILES := codegen main declare syntax_tree parse_util parse_part parse_sys tokenizer
EXCLUDEFILES := main
franken:$(ASEMS)
	# target:$(EXCLUDEFILES)
	@$(call prepare_franken)
	# gen1
	$(MOTHER) tmp.c > $(ASMDIR)/tmp.s 
	gcc $(ASMDIR)/*.s -static -o ./child
	# gen2
	./child self_host.c > child.s && gcc -static child.s -o child
	cp child.s gen2.s
	# gen3
	./child self_host.c > child.s && gcc -static child.s -o child
	cp child.s gen3.s
	# check
	diff gen2.s gen3.s
	# # gen2
	# ./child tmp.c > $(ASMDIR)/tmp.s 
	# gcc $(ASMDIR)/*.s -static -o ./child
	# cp $(ASMDIR)/tmp.s ./gen2.s
	# # gen3
	# ./child tmp.c > $(ASMDIR)/tmp.s 
	# gcc $(ASMDIR)/*.s -static -o ./child
	# cp $(ASMDIR)/tmp.s ./gen3.s
	# # check
	# diff gen2.s gen3.s

# fix franken 
PATCHFILE   := patch
TARGETFILE  := target
EXCLUDEFILE := main
patch:$(ASEMS)
	# patch target:$(PATCHFILE)
	rm -f $(ASMDIR)/$(EXCLUDEFILE).s
	cat src/header.h $(PATCHFILE).c > tmp.c
	gcc $(INCLUDE) -static -S -masm=intel $(TARGETFILE).c -o $(ASMDIR)/$(TARGETFILE).s
	# gen1
	$(MOTHER) tmp.c > $(ASMDIR)/$(PATCHFILE).s 
	cp $(ASMDIR)/$(PATCHFILE).s ./gen1.s
	gcc $(ASMDIR)/*.s -static -o ./child
	# gen2
	./child self_host.c > child.s && gcc -static child.s -o child
	cp child.s gen2.s
	# gen3
	./child self_host.c > child.s && gcc -static child.s -o child
	cp child.s gen3.s
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
