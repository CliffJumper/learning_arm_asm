
TOOLPATH = /usr/aarch64-linux-gnu/bin

AS = $(TOOLPATH)/as
LD = $(TOOLPATH)/ld
EXECS = upper
OBJS = main.o upper.o


ifdef DEBUG
	DEBUGFLGS = -g
else
	DEBUGFLGS =
endif

LSTFLGS = 

all: $(EXECS)

%.o: %.s
	$(TOOLPATH)/as $(DEBUGFLGS) $(LSTFLGS) $< -o $@

upper:	$(OBJS)
	$(TOOLPATH)/ld -o $@ $(OBJS)

clean:
	rm -f $(EXECS) *.o

.PHONY: clean
