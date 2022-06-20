#include <stdio.h>

int main() {
    int x, y, z, q, cont = 1;
    x = 3;
    y = 5;
    while (x) {
        z = x + y;
        q = x & y;

        if (z == q) {
            printf("\n\nBREAK!\n\n");
            break;
        }
        x--;
        printf("\nIteração %d:\nx = %d\ny = %d\nz = %d\nq = %d\n", cont, x, y, z, q);

        cont++;
    }

    printf("\n\nFim\n\n");
    return 0;
}

//     main:

//     MOVLW 3
//     MOVWF 0x08
//     MOVLW 4
//     MOVWF 0x09
//     SUBWF 0x08, 0
//     BTFSS 0x03, 2
//     NOP
//     NOP

// fim:
//     END
