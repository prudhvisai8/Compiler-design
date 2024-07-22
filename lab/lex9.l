%{
#include <stdio.h>

int max_len = 0;
char longest_word[256];

%}

WORD [a-zA-Z0-9_]+

%%

{WORD} {
    int len = strlen(yytext);
    if (len > max_len) {
        max_len = len;
        strncpy(longest_word, yytext, 256);
    }
}

\n { /* ignore newline characters */ }

. { /* ignore other characters */ }

%%

main() {
    yylex();
    printf("Longest word: %s (length: %d)\n", longest_word, max_len);
    return 0;
}