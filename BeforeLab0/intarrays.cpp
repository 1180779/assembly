#include "intarrays.hpp"
#include <math.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

int arraysum(int T[], int size) 
{
    int res = 0;
    for (int i = 0; i < size; ++i)
        res += T[i];
    return res;
}
int arrayabssum(int T[], int size) 
{
    int res = 0;
    for (int i = 0; i < size; ++i)
        res += abs(T[i]);
    return res;
}
void insertionsort(int T[], int size) 
{
    int temp, j;
    // i -> index of next unsorted element
    for (int i = 0; i < size; ++i) {
        // j -> goes through all elements that are in order (T[0...i - 1])
        temp = T[i];
        for (j = i; j > 0 && T[j - 1] > temp; --j) {
            T[j] = T[j - 1];
        }
        T[j] = temp;
    }
}

#define INTARRAYSIZE(T) (sizeof(T)/sizeof(int))

#define ERR(source) fprintf(stderr, "%s,\nfile:%s\n,line:%d\n", source, __FILE__, __LINE__), exit(-1)

void arrayprint(int T[], int size) 
{
    for (int i = 0; i < size; ++i)
        printf("%5d, ", T[i]);
    putchar('\n');
}

void sumabstest(int T[], int size)
{
    int resasm = arrayabssumasm(T, size);
    int res = arrayabssum(T, size);

    printf("AbssumTest. Array: ");
    for (int i = 0; i < size; ++i)
        printf("%5d, ", T[i]);
    printf("\n\t\t");

    if (resasm == res)
        printf("PASSED");
    else
        printf("FAILED");
    printf("\n");
}

void sumtest(int T[], int size) 
{
    int resasm = arraysumasm(T, size);
    int res = arraysum(T, size);

    printf("SumTest. Array: ");
    for (int i = 0; i < size; ++i)
        printf("%5d, ", T[i]);
    printf("\n\t\t");

    if(resasm == res)
        printf("PASSED");
    else
        printf("FAILED");
    printf("\n");
}

void sorttest(int T[], int size) 
{
    int* T1 = (int*)malloc(sizeof(int) * size);
    if (!T1)
        ERR("malloc");
    memcpy(T1, T, sizeof(int) * size);
    int* T2 = (int*)malloc(sizeof(int) * size);
    if (!T2)
        ERR("malloc");
    memcpy(T2, T, sizeof(int) * size);

    insertionsort(T1, size);
    insertionsortasm(T2, size);

    bool good = true;
    for (int i = 0; i < size; ++i) {
        //printf("\t\tT[i] = %5d, Ta[i] = %5d\n", T1[i], T2[i]);
        if (T1[i] != T2[i]) {
            good = false;
            break;
        }
    }

    printf("Sorttest. Array: ");
    for (int i = 0; i < size; ++i)
        printf("%5d, ", T[i]);
    printf("\n\t\t");

    if (good)
        printf("PASSED");
    else
        printf("FAILED");
    putchar('\n');

    free(T1);
    free(T2);
}

void mainarrays()
{
    int T0[] = {99, 36, 104, 37, 1, 84, 555, 4, 567};
    int T1[] = { 1, 2, 3, 4, 5, 6, 7, 8, 9, 10 };
    int T2[] = { 10, 9, 8, 7, 6, 5, 4, 3, 2, 1 };
    int T3[] = { 7, 2, 9, 4, 1, 6, 10, 3, 5, 8 };
    int T4[] = { 5, 3, 8, 3, 9, 1, 5, 7, 2, 5 };
    int T5[] = { 5, 5, 5, 5, 5, 5, 5, 5, 5, 5 };

    printf("\t\tSort test:\n");
    sorttest(T0, INTARRAYSIZE(T0));
    sorttest(T1, INTARRAYSIZE(T1));
    sorttest(T2, INTARRAYSIZE(T2));
    sorttest(T3, INTARRAYSIZE(T3));
    sorttest(T4, INTARRAYSIZE(T4));
    sorttest(T5, INTARRAYSIZE(T5));

    printf("\n\n\t\tSum test:\n");
    sumtest(T0, INTARRAYSIZE(T0));
    sumtest(T1, INTARRAYSIZE(T1));
    sumtest(T2, INTARRAYSIZE(T2));
    sumtest(T3, INTARRAYSIZE(T3));
    sumtest(T4, INTARRAYSIZE(T4));
    sumtest(T5, INTARRAYSIZE(T5));

    printf("\n\n\t\tAbssum test:\n");
    int T6[] = { -5, -8, -12, -56, -124, 46, 12 };
    int T7[] = { -99, 36, 104, -37, -1, 84, 555, -4, 567 };
    int T8[] = { -5, 5, -5, 5, -5, 5, -5, 5, -5, 5 };
    int T9[] = { -7, -2, -9, -4, -1, 6, 10, 3, 5, 8 };
    sumabstest(T6, INTARRAYSIZE(T6));
    sumabstest(T7, INTARRAYSIZE(T7));
    sumabstest(T8, INTARRAYSIZE(T8));
    sumabstest(T9, INTARRAYSIZE(T9));
}