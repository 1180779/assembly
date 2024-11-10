#include <stdio.h>
#include "nwd.hpp"

void CheckTest(unsigned assembler, unsigned cpp) 
{
	if (assembler == cpp)
		printf("PASSED");
	else
		printf("FAILED (asm = %5d, cpp = %5d)", assembler, cpp);
}

void Test(unsigned a, unsigned b) 
{
	printf("Test: a = %5d, b = %5d: ", a, b);
	unsigned resa = nwda(a, b);
	unsigned res = nwd(a, b);
	CheckTest(resa, res);
	putchar('\n');
}

void TestE(unsigned a, unsigned b)
{
	printf("Test euclidean: a = %5d, b = %5d: ", a, b);
	unsigned resea = nwdea(a, b);
	unsigned rese = nwde(a, b);
	CheckTest(resea, rese);
	putchar('\n');
}

void nwdmainfunc() {
	printf("Liczenie nwd\n\n");
	printf("Algorytm z odejmowaniem\n");
	Test(188, 166);
	Test(154, 24);
	Test(1883, 85);
	Test(11, 177);
	Test(178, 333);
	Test(12534, 654);

	printf("\nAlgorytm Euklidesa\n");
	TestE(188, 166);
	TestE(154, 24);
	TestE(1883, 85);
	TestE(11, 177);
	TestE(178, 333);
	TestE(12534, 654);
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