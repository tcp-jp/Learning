#include <stdio.h>

// Using globals (#define)
#define LOWER 0
#define UPPER 300
#define STEP 20

int main(void) {
  int f;

  printf("Cel.\t Far.\n");;
  for (f=LOWER; f <= UPPER; f += STEP) 
    printf("%3d \t%6.1f\n", f, (5.0/9.0) * (f - 32));
}



/*
======================
Temp converter w/ vars
======================
int main(void) {
  float f, c;
  int lower, upper, step;

  lower = 0;
  upper = 300;
  step = 20;

  f = lower;
  while (f <= upper) { 
    c = (5.0/9.0) * (f - 32.0);
    // 
    printf("%3.0f \t%6.1f\n", f, c);
    f += step;
  } 
}
*/
