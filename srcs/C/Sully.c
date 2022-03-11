#define CODE "#define CODE %4$c%1$s%4$c%3$c#include <stdio.h>%3$c#include <stdlib.h>%3$c#include <string.h>%3$c%3$cint main(void)%3$c{%3$c%2$cint i = %6$d;%3$c%2$cchar FILENAME[50];%3$c%2$cFILE *fd;%3$c%2$cchar cmd[100];%3$c%3$c%2$csprintf(FILENAME, %4$cSully_%5$cd.c%4$c, i);%3$c%2$cif (strcmp(FILENAME, __FILE__) == 0) {%3$c%2$c%2$c--i;%3$c%2$c%2$csprintf(FILENAME, %4$cSully_%5$cd.c%4$c, i);%3$c%2$c}%3$c%2$cfd = fopen(FILENAME, %4$cw%4$c);%3$c%2$cif (fd == NULL) {%3$c%2$c%2$creturn -1;%3$c%2$c}%3$c%2$cfprintf(fd, CODE, CODE, 9, 10, 34, 37, i);%3$c%2$cfclose(fd);%3$c%3$c%2$csprintf(cmd, %4$cclang Sully_%5$c1$d.c -o Sully_%5$c1$d%4$c, i);%3$c%2$csystem(cmd);%3$c%2$cif (i > 0) {%3$c%2$c%2$csprintf(cmd, %4$c./Sully_%5$c1$d%4$c, i);%3$c%2$c%2$csystem(cmd);%3$c%2$c}%3$c}%3$c"
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

int main(void)
{
	int i = 5;
	char FILENAME[50];
	FILE *fd;
	char cmd[100];

	sprintf(FILENAME, "Sully_%d.c", i);
	if (strcmp(FILENAME, __FILE__) == 0) {
		--i;
		sprintf(FILENAME, "Sully_%d.c", i);
	}
	fd = fopen(FILENAME, "w");
	if (fd == NULL) {
		return -1;
	}
	fprintf(fd, CODE, CODE, 9, 10, 34, 37, i);
	fclose(fd);

	sprintf(cmd, "clang Sully_%1$d.c -o Sully_%1$d", i);
	system(cmd);
	if (i > 0) {
		sprintf(cmd, "./Sully_%1$d", i);
		system(cmd);
	}
}
