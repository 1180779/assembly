#include <stdio.h>
#include "bitmanip.hpp"
#include "stringBigSmall.hpp"
#include "gcd.hpp"
#include "intarrays.hpp"

#define SEP(x) \
		do { \
			printf("\n\n"); \
			printf("#########################################################################################\n"); \
			printf("#%30s\n", x); \
			printf("#########################################################################################\n"); \
			printf("\n\n"); \
		} while(0)

int main() 
{
	SEP("BITMANIP");
	main_bitmanip();

	SEP("GCD");
	maingdc();

	SEP("INT ARRAYS");
	mainarrays();

	SEP("STRING BIG SMALL");
	stringMainFunc();

	return 0;
}
