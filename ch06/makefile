
TOOLPATH = /usr/aarch64-linux-gnu/bin

AS = $(TOOLPATH)/as
LD = $(TOOLPATH)/ld
SRCS= $(wildcard *.s)
EXECS=$(SRCS:.s=)


ifdef DEBUG
	DEBUGFLGS = -g
else
	DEBUGFLGS =
endif

all: $(EXECS)

$(EXECS): % : %.o
	$(TOOLPATH)/ld -o $@ $^

%.o: %.s
	$(TOOLPATH)/as $(DEBUGFLGS) $< -o $@

clean:
	rm -f $(EXECS) *.o

.PHONY: clean