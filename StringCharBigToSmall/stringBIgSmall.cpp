#include <stdio.h>
#include "stringBigSmall.hpp"
#include <stdlib.h>
#include <string.h>

#define SMALL2BIG ('A' - 'a')
#define BIG2SMALL ('a' - 'A')

#define ERR(source) fprintf(stderr, "%s,\nfile: %s\nline: %d\n", source, __FILE__, __LINE__), exit(-1)

#define STRSIZE 512
extern "C" void test(char T[]) 
{
    char *sa = (char*) malloc(sizeof(char) * STRSIZE);
    if (sa == NULL)
        ERR("malloc");
    strcpy(sa, T);

    char *s = (char*) malloc(sizeof(char) * STRSIZE);
    if (s == NULL)
        ERR("malloc");
    strcpy(s, T);

    printf("string: %-50sResult: ", T);

    stringBigSmallAsm(sa);
    stringBigSmall(s);
    if(strcmp(sa, s)) {
        printf("FAILED");
    }
    else {
        stringBigSmallAsm(sa);
        stringBigSmall(s);
        if (strcmp(sa, s)) {
            printf("FAILED");
        }
        else {
            printf("PASSED");
        }
    }
    putchar('\n');

    free(sa);
    free(s);
}

extern "C" void stringBigSmall(char T[]) 
{
    for (int i = 0; T[i]; ++i) {
        if (T[i] >= 'a' && T[i] <= 'z')
            T[i] += SMALL2BIG;
        else if (T[i] >= 'A' && T[i] <= 'Z')
            T[i] += BIG2SMALL;
    }
}

void stringMainFunc()
{
    char T1[] = "some sTRING";
    char T2[] = "assember MINI PW semestr zimowy 2024/25";
    char T3[] = "to JEST trzeci TEST 3333";
    char T4[] = "";

    char* S = (char*) malloc(sizeof(char) * strlen(T1) + 1);
    if (S == NULL)
        ERR("malloc");
    strcpy(S, T1);

    printf("%20s%s\n", "Before: ", S);
    stringBigSmallAsm(S);
    printf("%20s%s\n", "After: ", S);
    stringBigSmallAsm(S);
    printf("%20s%s\n", "After two times: ", S);


    free(S);

    test(T1);
    test(T2);
    test(T3);
    test(T4);
}