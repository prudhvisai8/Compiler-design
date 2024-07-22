%{
#include <stdio.h>
#include <stdlib.h>
#include <ctype.h>
#include <string.h>

#define MAX_SIZE 100

char words[MAX_SIZE][MAX_SIZE];
int word_count = 0;

char numbers[MAX_SIZE][MAX_SIZE];
int number_count = 0;

void add_word(const char *word) {
    if (word_count < MAX_SIZE) {
        strcpy(words[word_count++], word);
    }
}

void add_number(const char *number) {
    if (number_count < MAX_SIZE) {
        strcpy(numbers[number_count++], number);
    }
}

%}

%%
[0-9]+ { add_number(yytext); }
[A-Za-z]+ { add_word(yytext); }
[ \t\n]+  { /* Ignore whitespace */ }
.         { /* Ignore any other character */ }
%%

int main() {
    yylex();

    printf("Words:\n");
    for (int i = 0; i < word_count; i++) {
        printf("%s\n", words[i]);
    }

    printf("\nNumbers:\n");
    for (int i = 0; i < number_count; i++) {
        printf("%s\n", numbers[i]);
    }

    return 0;
}

int yywrap() {
    return 1;
}
