
#include <stdio.h>

extern "C" void f1(int* T1, int* T2, int* res, int size); // f1(x, y) = x + y
extern "C" void f2(int* T1, int* T2, int* res, int size); // f2(x, y) = x*y
extern "C" void f3(int* T1, int y, long long int* res, int size); // f3(x) = x * 2^y
extern "C" void f4(int* T, int* res, int size); // f4(x) = abs(x)
extern "C" void f5(int* T, int* res, int size); //f5(x) = { x, x >= 0
                                                //        { 0, x < 0
 

#define SIZE(T) (sizeof(T)/sizeof(T[0]))
#define PRINT(T) do { \
                    printf("TAB: "); \
                    for(int i = 0; i < SIZE(T); ++i) \
                        printf("%6d", T[i]); \
                    putchar('\n'); \
                } while(0)

int main() 
{
    // must be multiple of 4
    alignas(16) int data[] = {1, 2, 3, 4, 5, 6, 7, -8, 9, 10, 11, 12, 13, 14, 15, 16};
    alignas(16) int res[SIZE(data)];
    alignas(16) long long int res_32[SIZE(data)];

    PRINT(data);

    f1(data, data, res, SIZE(data));
    PRINT(res);

    f2(data, data, res, SIZE(data));
    PRINT(res);

    f3(data, 5, res_32, SIZE(data));
    PRINT(res_32);

    f4(data, res, SIZE(data));
    PRINT(res);
    return 0;
}