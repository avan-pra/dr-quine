CC = clang

CFLAGS =

NAMECCOLLEEN = bin/C/Colleen
SRCSCCOLLEEN = srcs/C/Colleen.c
OBJCCOLLEEN = $(SRCSCCOLLEEN:.c=.o)

NAMECGRACE = bin/C/Grace
SRCSCGRACE = srcs/C/Grace.c
OBJCGRACE = $(SRCSCGRACE:.c=.o)

NAMECSULLY = bin/C/Sully
SRCSCSULLY = srcs/C/Sully.c
OBJCSULLY = $(SRCSCSULLY:.c=.o)
SULLYCGARBAGE = bin/C/Sully_*

NAMEACOLLEEN = bin/Asm/Colleen
SRCSACOLLEEN = srcs/Asm/Colleen.s
OBJACOLLEEN = $(SRCSACOLLEEN:.s=.o)

NAMEAGRACE = bin/Asm/Grace
SRCSAGRACE = srcs/Asm/Grace.s
OBJAGRACE = $(SRCSAGRACE:.s=.o)

NAMEASULLY = bin/Asm/Sully
SRCSASULLY = srcs/Asm/Sully.s
OBJASULLY = $(SRCSASULLY:.s=.o)
SULLYAGARBAGE = bin/Asm/Sully_*

%.o: %.s
	nasm -f elf64 -o $*.o $*.s

all:	$(NAMEASULLY)

$(NAMEACOLLEEN): $(OBJACOLLEEN)
	@mkdir -p bin/Asm
	$(CC) $(OBJACOLLEEN) -o $(NAMEACOLLEEN)

$(NAMEAGRACE): $(OBJAGRACE)
	@mkdir -p bin/Asm
	$(CC) $(OBJAGRACE) -o $(NAMEAGRACE)

$(NAMEASULLY): $(OBJASULLY)
	@mkdir -p bin/Asm
	$(CC) $(OBJASULLY) -o $(NAMEASULLY)

$(NAMECCOLLEEN): $(OBJCCOLLEEN)
	@mkdir -p bin/C
	$(CC) $(CFLAGS) $(OBJCCOLLEEN) -o $(NAMECCOLLEEN)

$(NAMECGRACE): $(OBJCGRACE)
	@mkdir -p bin/C
	$(CC) $(CFLAGS) $(OBJCGRACE) -o $(NAMECGRACE)

$(NAMECSULLY): $(OBJCSULLY)
	@mkdir -p bin/C
	$(CC) $(CFLAGS) $(OBJCSULLY) -o $(NAMECSULLY)

exec:
	./bin/C/Colleen

clean:
	rm -f $(OBJCCOLLEEN) $(OBJCGRACE) $(OBJCSULLY) $(SULLYCGARBAGE) $(OBJACOLLEEN) $(OBJAGRACE) $(OBJASULLY) $(SULLYAGARBAGE)

fclean: clean
	rm -f $(NAMECCOLLEEN) $(NAMECGRACE) $(NAMECSULLY) $(NAMEACOLLEEN) $(NAMEAGRACE) $(NAMEASULLY)
