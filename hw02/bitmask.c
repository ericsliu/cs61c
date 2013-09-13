#include <stdio.h>

unsigned int set_bit(unsigned int number, int value, int position) {
    /* YOUR CODE HERE */
    return 0;
}

int get_bit(unsigned int number, int position) {
    /* YOUR CODE HERE */
    return 0;
}

int main(void) {
    unsigned int num = 0;
    printf("num is currently 0x%X.\n", num);
    printf("Setting the 3rd bit to 1. num should read 0x8.\n");
    num = set_bit(num, 1, 3);
    printf("num is currently 0x%X.\n", num);
    printf("Setting the 7th bit to 1. num should read 0x88.\n");
    num = set_bit(num, 1, 7);
    printf("num is currently 0x%X.\n", num);
    printf("Setting the 3rd bit to 0. num should read 0x80.\n");
    num = set_bit(num, 0, 3);
    printf("num is currently 0x%X.\n", num);
    printf("Getting the value of the 4th bit, which should be 0.\n");
    printf("value of the 4th bit is %d.\n", get_bit(num, 4));
    printf("Getting the value of the 7th bit, which should be 1.\n");
    printf("value of the 7th bit is %d.\n", get_bit(num, 7));
    return 0;
}

