#include "bitmanip.hpp"
#include <stdio.h>

extern "C" int bitrev(int x) 
{
    int res = 0;
    int max = sizeof(int) * 8;
    for (int i = 0; i < max - 1; ++i) {
        res += x & 1;
        res = res << 1;
        x = x >> 1;
    }
    res += x & 1;
    return res;
}

#define BRACKETSIZE 12

#define QUOTE(value) #value
#define STR(value) QUOTE(value)

void bracket() 
{
    for (int i = 0; i < BRACKETSIZE + 2; ++i)
        putchar('-');
}

void bracketline(int n) 
{
    for (int i = 0; i < n; ++i) {
        putchar('|');
        bracket();
    }
    putchar('|');
    putchar('\n');
}

void header(const char T[][BRACKETSIZE], int n) {
    bracketline(n);
    for (int i = 0; i < n; ++i) {
        putchar('|');
        printf(" %-" STR(BRACKETSIZE) "s ", T[i]);
    }
    putchar('|');
    putchar('\n');
}

void bitrev_tests(int T[], int size) {
    const static char HT[][BRACKETSIZE] = { "num", "res", "asm", "asm2" };
    header(HT, 4);
    for (int i = 0; i < size; ++i) {
        int x = T[i];
        int rev = bitrev(x);
        int reva = bitrev_asm(x);
        int reva2 = bitrev_asm2(x);

        bracketline(4);
        printf("| %" STR(BRACKETSIZE) "d | %" STR(BRACKETSIZE) "d | "
            "%" STR(BRACKETSIZE) "d | %" STR(BRACKETSIZE) "d |\n", x, rev, reva, reva2);
    }
    bracketline(4);
    printf("\n\n\n");
}

#define INTARRAYSIZE(T) (sizeof(T)/sizeof(int))

extern "C" void main_bitmanip()
{
    int T1[] = { -1, -2 };
    int T2[] = { -4, -11, -16, -3333 };
    int T3[] = { 0, 1, 2, 4, 8, 16, 32, 64, 128, 256, 512, 1024, 2048, 4096,
                    8192, 16384, 32768 };

    bitrev_tests(T1, INTARRAYSIZE(T1));
    bitrev_tests(T2, INTARRAYSIZE(T2));
    bitrev_tests(T3, INTARRAYSIZE(T3));
}
