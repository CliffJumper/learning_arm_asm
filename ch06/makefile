UPPEROBJS = mainmacro.o upper.o

ifdef DEBUG
	DEBUGFLGS = -g
else
	DEBUGFLGS =
endif
LSTFLGS =

all: upper

%.o : %.s
	as  $(DEBUGFLGS) $(LSTFLGS) $< -o $@

upper: $(UPPEROBJS)
	ld -o upper $(UPPEROBJS)

clean:
	rm -Rf *.o
	rm upper

.PHONY: clean
