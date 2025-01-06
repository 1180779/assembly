#include <stdio.h>
#include "gcd.hpp"

void testcheck(unsigned assembler, unsigned cpp)
{
	if (assembler == cpp)
		printf("PASSED");
	else
		printf("FAILED (asm = %5d, cpp = %5d)", assembler, cpp);
}

void test(unsigned a, unsigned b)
{
	printf("Test: a = %5d, b = %5d: ", a, b);
	unsigned resa = nwda(a, b);
	unsigned res = nwd(a, b);
	testcheck(resa, res);
	putchar('\n');
}

void teste(unsigned a, unsigned b)
{
	printf("Test euclidean: a = %5d, b = %5d: ", a, b);
	unsigned resea = nwdea(a, b);
	unsigned rese = nwde(a, b);
	testcheck(resea, rese);
	putchar('\n');
}

void maingdc() {
	printf("Liczenie nwd\n\n");
	printf("Algorytm z odejmowaniem\n");
	test(188, 166);
	test(154, 24);
	test(1883, 85);
	test(11, 177);
	test(178, 333);
	test(12534, 654);

	printf("\nAlgorytm Euklidesa\n");
	teste(188, 166);
	teste(154, 24);
	teste(1883, 85);
	teste(11, 177);
	teste(178, 333);
	teste(12534, 654);
}

unsigned nwd(unsigned a, unsigned b)
{
	int x;
	while (a != b) {
		if (a < b) {
			x = a;
			a = b;
			b = x;
		}
		a -= b;
	}
	return a;
}

unsigned nwde(unsigned a, unsigned b)
{
	int x;
	while (b != 0) {
		x = b;
		b = a % b;
		a = x;
	}
	return a;
}