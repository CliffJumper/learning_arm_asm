
OBJS = 192bit_add.o

ifdef DEBUG
	DEBUGFLGS = -g
else
	DEBUGFLGS =
endif


HelloWorld: $(OBJS)
	ld -o 192bit_add $(OBJS)

%.o: %.s
	as $(DEBUGFLGS) $< -o $@


