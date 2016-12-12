#include <math.h>
#include <stdio.h>
#include <string.h>

#define SIZE_UINT ((int) sizeof(unsigned int))
#define MAX_2POWER ((unsigned int) 1<<(SIZE_UINT*8-1))
#define SEP_LINE printf("==========\n");

unsigned int mkmask(int);
void printBits(unsigned int);
int issetBit(unsigned int, int);
int setBit(unsigned int *, int);
int unsetBit(unsigned int *, int);
int toggleBit(unsigned int *, int);
int rhsnullBit(unsigned int *);

int run(unsigned int *, int, int, int, int);

int main(void)
{
  unsigned int a = 645;
  unsigned int *testNum1 = &a;
  run(testNum1, 1, 2, 1, 1);

  return 0;
}

int run(unsigned int *n, int issetBitBit,
    int setBitBit, int unsetBitBit, int toggleBitBit)
{

  printf("running sequence for the number: (%d)\n", *n);
  printf("bit field: ");
  printBits(*n);

  SEP_LINE

    printf("issetBit(%d)\n", issetBitBit);
  printf("result:\t%s\n", (issetBit(*n, issetBitBit) == 0
        ? "no" : "yes"));

  SEP_LINE

    printf("setBit(%d)\n", setBitBit);
  setBit(n, setBitBit);
  printf("result\t");
  printBits(*n);

  SEP_LINE

    printf("unSetBit(%d)\n", unsetBitBit);
  unsetBit(n, unsetBitBit);
  printf("result\t");
  printBits(*n);

  SEP_LINE

    printf("toggleBit(%d)\n", toggleBitBit);
  toggleBit(n, toggleBitBit);
  printf("result\t");
  printBits(*n);

  SEP_LINE

    printf("setting right-most null bit\n");
  rhsnullBit(n);
  printf("result\t");
  printBits(*n);

  puts("");

  return 0;
}

unsigned int mkmask(int n)
{
  unsigned int result = 1;
  return result <<= (n-1);
}

void printBits(unsigned int num)
{
  unsigned int i = 0;
  for (; i < SIZE_UINT*8; i++) {
    if (((i % 4) == 0) && !(i == 0))
      printf(" ");
    printf("%u", num & MAX_2POWER ? 1 : 0);
    num = num<<1;
  }
  puts("");
}


int issetBit(unsigned int field, int n)
{
  unsigned int mask = mkmask(n);
  return (field & mask) == mask ? 1 : 0;
}


int setBit(unsigned int *n , int bit)
{
  *n = (*n) | mkmask(bit);
  return 0;
}

int unsetBit(unsigned int *n, int bit)
{
  *n = (*n) & (~mkmask(bit));
  return 0;
}

int toggleBit(unsigned int *n, int bit)
{
  if (issetBit(*n, bit) == 0)
    setBit(n, bit);
  else
    unsetBit(n, bit);
  return 0;
}

int rhsnullBit(unsigned int *n)
{
  unsigned int test = *n;
  int highest_2power = 0;
  for (; test > 0; ++highest_2power)
    test = (unsigned int) test / 2;
  setBit(n, highest_2power+1);
  return 0;
}

