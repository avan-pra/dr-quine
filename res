#define CODE "#define CODE %4$c%1$s%4$c%3$c#include <stdio.h>%3$c%3$c/*%3$c%2$cThis program will print its own source when run.%3$c*/%3$c%3$cvoid print(char *str)%3$c{%3$c%2$cprintf(str, str, 9, 10, 34);%3$c}%3$c%3$cint main(void)%3$c{%3$c%2$c/*%3$c%2$c%2$cHello, World!%3$c%2$c*/%3$c%2$cprint(CODE);%3$c}%3$c"
#include <stdio.h>

/*
	This program will print its own source when run.
*/

void print(char *str)
{
	printf(str, str, 9, 10, 34);
}

int main(void)
{
	/*
		Hello, World!
	*/
	print(CODE);
}
