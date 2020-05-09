CFLAGS=-std=c11 -g -O0 -static
SRCS=$(wildcard *.c)
OBJS=$(SRCS:.c=.o)


cc_sakura: $(OBJS)
	$(CC) -o cc_sakura $(OBJS) $(LDFLAGS)

$(OBJS): cc_sakura.h

test: cc_sakura
	./test.sh

func_test: cc_sakura
	./cc_sakura "func();" > tmp.s
	gcc -c tmp.s
	gcc -c test_func.c
	gcc -o tmp tmp.o test_func.o
	./tmp

clean:
	rm -f cc_sakura *.o *.s *~ tmp* *.txt *.out

.PHONY: test func_test clean
