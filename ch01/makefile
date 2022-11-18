
OBJS = HelloWorld.o

ifdef DEBUG
	DEBUGFLGS = -g
else
	DEBUGFLGS =
endif


HelloWorld: $(OBJS)
	ld -o HelloWorld $(OBJS)

%.o: %.s
	as $(DEBUGFLGS) $< -o $@


