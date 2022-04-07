#include <stdio.h>

int main() {
    int i = 9;
    int num = 1;

    do{
        num *= i;

        if(i > 1){
            printf("%d * ", i);
        }else{
            printf("%d = ", i);
        }
        i--;
    }while(i != 0);

    printf("%d\n\n", num);

    

}