#include <stdio.h>
#include <string.h>
#include <stdlib.h>
#include <time.h>
#include <math.h>
// void generate_rand();
// void add_two_numbers();
// void sub_two_numbers();
// void mul_two_numbers();
// void div_two_numbers();
// void convert_to_uppercase();
// void find_character_in_string();
// void decimal_to_hexadecimal(); 
// void concatenate_strings();
// void compare_strings();
// void sqrt_of_number();
// void help();

void help(){
    printf("0. Generate 10 random numbers between 1 and 55\n");
    printf("1. Add two numbers\n");
    printf("2. Subtract two numbers\n");
    printf("3. Square root of a number\n");
    printf("4. Generate random number\n");
    printf("5. Convert from base 10 to base 16\n");
    printf("6. Converting a string to uppercase\n");
    printf("7. Find character in a string\n");
    printf("8. Concatenate two strings\n");
    printf("9. Compare two strings\n");
    printf("q. Exit the program\n");
}

void generate_rand(int count){
    srand(time(NULL));
    
    for (int i = 0; i < count; ++i) {
        int random_number = rand() % 56;
        printf("%d ", random_number);
    }
    printf("\n");
}

void add_two_numbers(){
    int x, y;
    printf("Enter the first number: ");
    scanf("%d", &x);
    printf("Enter the second number: ");
    scanf("%d", &y);
    printf("Sum: %d\n",x+y);
}

void sub_two_numbers(){
    int x, y;
    printf("Enter the first number: ");
    scanf("%d", &x);
    printf("Enter the second number: ");
    scanf("%d", &y);
    printf("Difference: %d\n", x - y);
}

void sqrt_of_number(){
    int n;
    printf("Enter a number: ");
    scanf("%d", &n);
    float guess = n / 2.0;
    float error = 0.00001; // desired precision
    while (1) {
        float new_guess = 0.5 * (guess + n / guess);
        if (fabs(new_guess - guess) < error) {
            break;
        }
        guess = new_guess;
    }
    printf("Square root: %f\n", guess);
}

void decimal_to_hexadecimal(){
    int n;
    printf("Enter a number in base 10: ");
    scanf("%d", &n);

    if (n == 0) {
        printf("Hexadecimal: 0\n");
        return;
    }

    char hex[16] = "0123456789ABCDEF";
    char hexadecimal[32];
    int i = 0;

    while (n > 0) {
        hexadecimal[i] = hex[n % 16];
        n /= 16; 
        i++;
    }

    printf("Hexadecimal: ");
    for (int j = i - 1; j >= 0; j--) {
        printf("%c", hexadecimal[j]);
    }
    printf("\n");
}

void convert_to_uppercase(){
    char str[50];
    printf("Enter a string: ");
    scanf("%s",str);

    for(int i = 0; str[i] != '\0'; i++){
        if(str[i] >= 'a' && str[i] <= 'z'){
            str[i] = str[i] - 32;
        }
    }
    printf("Uppercase: %s\n",str);
}

void find_character_in_string(){
    char str[50];
    printf("Enter a string: ");
    scanf("%s",str);
    printf("Enter a character to find: ");
    char c;
    scanf(" %c",&c);
    for (int i = 0; str[i] != '\0'; i++) {
        if (str[i] == c) {
            printf("Character found at index %d\n", i);
            return;
        }
    }
    printf("Character not found\n");
}

void concatenate_strings(){
    char str1[50], str2[50];
    printf("Enter the first string: ");
    scanf("%s",str1);
    printf("Enter the second string: ");
    scanf("%s",str2);

    char result[100];

    strcpy(result, str1); 
    strcat(result, str2); 
    printf("Concatenated string: %s\n", result);
}

void compare_strings(){
    char str1[50], str2[50];
    printf("Enter the first string: ");
    scanf("%s",str1);
    printf("Enter the second string: ");
    scanf("%s",str2);

    int result = strcmp(str1, str2);
    if(result > 0){
        printf("%s > %s\n",str1, str2);
    }else if(result < 0){
        printf("%s < %s\n",str1, str2);
    }else printf("Strings are equal\n"); 
}







int main(){
    help();
    char command;
    while(1){
        printf("\nSelect command: ");
        scanf(" %c", &command);
        switch (command)
        {
        case '0':
            generate_rand(10);
            help();
            break;
        case '1':
            add_two_numbers();
            help();
            break;
        case '2':
            sub_two_numbers();
            help();
            break;
        case '3':
            sqrt_of_number();
            help();
            break;
        case '4':
            generate_rand(1);
            help();
            break;
        case '5':
            decimal_to_hexadecimal(1);
            help();
            break;
        case '6':
            convert_to_uppercase();
            help();
            break;
        case '7':
            find_character_in_string();
            help();
            break;
        case '8':
            concatenate_strings();
            help();
            break;
        case '9':
            compare_strings();
            help();
            break;
        case 'q':
            printf("Exiting the program.");
            return 0;
        default:
            break;
        }
    }

    return 0;
}
