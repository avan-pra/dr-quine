CC = clang

CFLAGS = 

NAMECCOLLEEN = bin/C/Colleen
SRCSCCOLLEEN = srcs/C/Colleen.c
OBJCCOLLEEN = $(SRCSCCOLLEEN:.c=.o)

NAMECGRACE = bin/C/Grace
SRCSCGRACE = srcs/C/Grace.c
OBJCGRACE = $(SRCSCGRACE:.c=.o)

all:	$(NAMECGRACE)

$(NAMECCOLLEEN): $(OBJCCOLLEEN)
	@mkdir -p bin/C
	$(CC) $(CFLAGS) $(OBJCCOLLEEN) -o $(NAMECCOLLEEN)

$(NAMECGRACE): $(OBJCGRACE)
	@mkdir -p bin/C
	$(CC) $(CFLAGS) $(OBJCGRACE) -o $(NAMECGRACE)

exec:
	./bin/C/Colleen

clean:
	rm -f $(OBJCCOLLEEN) $(OBJCGRACE)

fclean: clean
	rm -f $(NAMECCOLLEEN) $(NAMECGRACE)
