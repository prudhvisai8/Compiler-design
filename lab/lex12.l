%{
#include <stdio.h>
%}

%%

[a-zA-Z]+    { printf("WORD: %s\n", yytext); }
"=="         { printf("RELATIONAL OPERATOR: %s\n", yytext); }
"!="         { printf("RELATIONAL OPERATOR: %s\n", yytext); }
">="         { printf("RELATIONAL OPERATOR: %s\n", yytext); }
"<="         { printf("RELATIONAL OPERATOR: %s\n", yytext); }
">"          { printf("RELATIONAL OPERATOR: %s\n", yytext); }
"<"          { printf("RELATIONAL OPERATOR: %s\n", yytext); }

%%

int main(void) {
    yylex();
    return 0;
}

int yywrap(void) {
    return 1;
}
