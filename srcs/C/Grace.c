#define CODE "#define CODE %3$c%1$s%3$c%2$c#include <stdio.h>%2$c#define FILENAME %3$cGrace_kid.c%3$c%2$c#define FT()int main(){FILE *fd = fopen(FILENAME, %3$cw%3$c);if (fd == NULL){return -1;}fprintf(fd, CODE, CODE, 10, 34, 9);}%2$c%2$c/*%2$c%4$cHELLOOOOOOOOOOOOOOOOOOOOOO%2$c*/%2$c%2$cFT();%2$c"
#include <stdio.h>
#define FILENAME "Grace_kid.c"
#define FT()int main(){FILE *fd = fopen(FILENAME, "w");if (fd == NULL){return -1;}fprintf(fd, CODE, CODE, 10, 34, 9);}

/*
	HELLOOOOOOOOOOOOOOOOOOOOOO
*/

FT();
