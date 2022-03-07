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

all:	$(NAMECSULLY)

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
	rm -f $(OBJCCOLLEEN) $(OBJCGRACE) $(OBJCSULLY) $(SULLYCGARBAGE)

fclean: clean
	rm -f $(NAMECCOLLEEN) $(NAMECGRACE) $(NAMECSULLY)
