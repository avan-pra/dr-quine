CC = clang

CFLAGS = -Wall -Wextra -Werror

NAMECCOLLEEN = bin/C/Colleen
SRCSCCOLLEEN = srcs/C/Colleen.c
OBJCCOLLEEN = $(SRCSCCOLLEEN:.c=.o)

NAMEGRACE = Grace

NAMESULLY = Sully

$(NAMECCOLLEEN): $(OBJCCOLLEEN)
	$(CC) $(CFLAGS) $(OBJCCOLLEEN) -o $(NAMECCOLLEEN)

all:	$(NAMECCOLLEEN)

exec:
	./bin/C/Colleen

clean:
	rm -f $(OBJCCOLLEEN)

fclean: clean
	rm -f $(NAMECCOLLEEN)
