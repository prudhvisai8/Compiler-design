%{
#include <stdio.h>

%}

VOWEL [aeiouAEIOU]
CONSONANT [bcdfghjklmnpqrstvwxyzBCDFGHJKLMNPQRSTVWXYZ]
STRING {VOWEL}[a-zA-Z0-9]*

%%

{STRING} { printf("Accepted string: %s\n", yytext); }
. { printf("Rejected string: %s\n", yytext); }

%%

main() {
    yylex();
    return 0;
}