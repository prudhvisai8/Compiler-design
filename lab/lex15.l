%{
#include <stdio.h>
%}

%%

^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$   { printf("Valid email: %s\n", yytext); }
.                                                   { printf("Invalid email: %s\n", yytext); }

%%

int main(void) {
    yylex();
    return 0;
}

int yywrap(void) {
    return 1;
}
