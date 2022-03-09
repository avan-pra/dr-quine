#include <unistd.h>
#include <fcntl.h>
#include <string.h>

void quinec(int fd)
{
	char c;

	while (read(fd, &c, 1) > 0)
	{
		switch (c) {
			case 9: { write(1, "%2$c", 4);break;}
			case 10: { write(1, "%3$c", 4);break;}
			case 34: { write(1, "%4$c", 4);break;}
			case 37: { write(1, "%5$c", 4);break;}
			default: { write(1, &c, 1);}
		}
	}
	write(1, "\"", 1);
}

void quinepy(int fd)
{
	char c;

	while (read(fd, &c, 1) > 0)
	{
		switch (c) {
			case 9: { write(1, "{tab}", 5);break;}
			case 10: { write(1, "{nl}", 4);break;}
			case 34: { write(1, "{quote}", 7);break;}
			case 92: { write(1, "{backs}", 7);break;}
			default: { write(1, &c, 1);}
		}
	}
	write(1, "\"", 1);
}

int main(int argc, char **argv)
{
	int fd = open(argv[1], O_RDONLY);
	char c;

	if (argv[1][strlen(argv[1]) - 1] == 'c') {
		write(1, "#define CODE \"#define CODE %4$c%1$s%4$c%3$c", 43);
		quinec(fd);
	}
	if (argv[1][strlen(argv[1]) - 1] == 's') {
		write(1, "CODE db \"CODE db %4$c%1$s%4$c", 43);
		quinec(fd);
	}
	if (argv[1][strlen(argv[1]) - 2] == 'p' && argv[1][strlen(argv[1]) - 1] == 'y') {
		quinepy(fd);
	}

	close(fd);
}
