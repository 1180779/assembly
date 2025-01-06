#include <stdio.h>

float horner(float coef[], int coef_len, float x);
extern "C" float horner_asm(float coef[], int coef_len, float x);

int main() 
{
    float coef[] = { 2, 3, 4 }; // 2x^2 + 3x + 4
    float res = horner(coef, 3, 3);
    float resa = horner_asm(coef, 3, 3);
    printf("res = %5.2f, res_asm = %5.2f, \n", res, resa);
    
    res = horner(coef, 3, -2);
    resa = horner_asm(coef, 3, -2);
    printf("res = %5.2f, res_asm = %5.2f, \n", res, resa);
    return 0;
}

float horner(float coef[], int coef_len, float x) 
{
    float res = coef[0];
    for (int i = 1; i < coef_len; ++i) {
        res = res * x + coef[i];
    }
    return res;
}