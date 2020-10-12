#include <stdio.h>

int main(void) {
  printf("Hello, World!\n");
  int i = 0;
  char *str = "Hello, World!\n";
  while (str[i] != '\0')
    printf("%c \n", str[i++]);
  return 0;
}



