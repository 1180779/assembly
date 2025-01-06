#include <iostream>
#include "twodimarrays.hpp"

using namespace std;

int main() 
{
    int T[3][7] = {
        { 1, 6, 2, 7, 3, 5, 9 },
        { 4, -24, 41, -642, 4, 23, 6 },
        { 1, 9, 2, 7, 3, 5, 99 },
    };

    int M[4][4] = {
        { 1, 2, 3, 4 },
        { 2, 5, 6, 7 },
        { 3, 6, 8, 9 },
        { 4, 7, 9, 10 }
    };

    int res = max_row_sum(T, 7, 3);
    cout << "res = " << res << endl;

    res = matrix_symmetry((int*)M, 4);
    cout << "Symmetric = " << res << endl;
    return 0;
}