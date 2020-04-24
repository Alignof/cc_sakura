CFLAGS=-std=c11 -g -O0 -static
SRCS=$(wildcard *.c)
OBJS=$(SRCS:.c=.o)


cc_sakura: $(OBJS)
	$(CC) -o cc_sakura $(OBJS) $(LDFLAGS)

$(OBJS): cc_sakura.h

test: cc_sakura
	./test.sh

clean:
	rm -f cc_sakura *.o *~ tmp*

.PHONY: test clean
