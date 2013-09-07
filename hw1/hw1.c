#include <stdio.h>
#include <math.h>

int reverseInt(int number);

int main(void) {
    printf (" The reverse of the number is %i -> %i, should be 54321\n", 12345, reverseInt(12345));
    printf (" The reverse of the number is %i -> %i, should be 7331\n", 1337, reverseInt(1337));
    printf (" The reverse of the number is %i -> %i, should be 51\n", 15, reverseInt(15));
    printf (" The reverse of the number is %i -> %i, should be 12321\n", 12321, reverseInt(12321));
    printf (" The reverse of the number is %i -> %i, should be 2013\n", 3102, reverseInt(3102));
}

int reverseInt(int number) {
    int len = 0;
    int temp = number;
    int count = 0;
    int answer = 0;
    while(temp / 10 >= 1) {
        len++;
        temp = temp / 10;
    }
    while(len >= 0) {
        answer += (number / (int)pow(10, len)) * (int)pow(10, count);
        number -= number / (int)pow(10, len) * (int)pow(10, len);
        len--;
        count++;
    }
    return answer;
}
