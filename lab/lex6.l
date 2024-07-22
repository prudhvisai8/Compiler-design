%{
#include <stdio.h>
#include <stdlib.h>

int positive_count = 0;
int negative_count = 0;
%}

%%

-?[0-9]+ {
    int num = atoi(yytext);
    if (num > 0) {
        printf("Positive number: %d\n", num);
        positive_count++;
    } else if (num < 0) {
        printf("Negative number: %d\n", num);
        negative_count++;
    }
}

[ \t\n]+  { /* Ignore whitespace */ }

.         { /* Ignore any other character */ }

%%

int main() {
    yylex();
    printf("Total positive numbers: %d\n", positive_count);
    printf("Total negative numbers: %d\n", negative_count);
    return 0;
}

int yywrap() {
    return 1;
}
