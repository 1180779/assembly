#include <stdio.h>
#include <iostream>

extern "C" int factorial_asm(int n);
extern "C" int factorial_rec_asm(int n);
extern "C" int factorial_rec_true_asm(int n);

extern "C" int fibb_asm(int n); // fibonnaci sequence
extern "C" int fibb_rec_asm(int n); // fibonnaci sequence

extern "C" void string_reverse_asm(char* s, int length);

extern "C" void hanoi_asm(int n, int from, int to, int aux);

using namespace std;

int main() 
{
    // -------------------------------------------------
    cout << "\n\t\tFACTORIALS\n";
    for (int i = 0; i <= 6; ++i) {
        
        cout << "factorial(" << i << ") = " << factorial_rec_asm(i) << endl;
    }

    // -------------------------------------------------
    cout << "\n\t\tFIBONACCI SERIES\n";
    for (int i = 0; i <= 20; ++i) {
        cout << "fibb(" << i << ") = " << fibb_rec_asm(i) << endl;
    }

    // -------------------------------------------------
    char* temp = new char[1000];
    cout << "\n\t\tSTRING REVERSION\n";

    strcpy(temp, "ALEHANDRO");
    cout << temp << " -> ";
    string_reverse_asm(temp, strlen(temp));
    cout << temp << endl;

    strcpy(temp, "REVERSE ME");
    cout << temp << " -> ";
    string_reverse_asm(temp, strlen(temp));
    cout << temp << endl;

    delete[] temp;

    // -------------------------------------------------
    cout << "\n\t\tHANOI\n";
    hanoi_asm(5, 1, 3, 2);

    return 0;
}