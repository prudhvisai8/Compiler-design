%{
#include <stdio.h>
%}

%%

abc     { printf("ABC"); }
.|\n    { putchar(yytext[0]); }

%%

int main(void) {
    yylex();
    return 0;
}

int yywrap(void) {
    return 1;
}
