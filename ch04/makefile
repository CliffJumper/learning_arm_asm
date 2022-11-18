
OBJS = asciiprint32.o

ifdef DEBUG
	DEBUGFLGS = -g
else
	DEBUGFLGS =
endif


HelloWorld: $(OBJS)
	ld -o asciiprint32 $(OBJS)

%.o: %.s
	as $(DEBUGFLGS) $< -o $@


