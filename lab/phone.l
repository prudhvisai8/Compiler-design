%{
#include <stdio.h>
%}

%%
\+?[0-9]{1,3}?[0-9]{10} { printf("Valid mobile number: %s\n", yytext); }
[^\n]+                  { printf("Invalid mobile number: %s\n", yytext); }
\n                      { /* ignore newline characters */ }
%%

int main(int argc, char **argv)
{
    yylex();
    return 0;
}

int yywrap() {
    return 1;
}
