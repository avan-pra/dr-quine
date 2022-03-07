#include <unistd.h>
#include <fcntl.h>

int main(int argc, char **argv)
{
	int fd = open(argv[1], O_RDONLY);
	char c;

	write(1, "#define CODE \"#define CODE %4$c%1$s%4$c%3$c", 43);
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
	close(fd);
}
