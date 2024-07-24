%{
#include <stdio.h>
#include <stdlib.h>
%}

%%
[0-9]+      { yylval = atoi(yytext); return NUMBER; }
"+"         { return PLUS; }
"-"         { return MINUS; }
"*"         { return MULTIPLY; }
"/"         { return DIVIDE; }
[ \t\n]+    { /* Ignore whitespace */ }
.           { printf("Invalid character: %c\n", yytext[0]); return yytext[0]; }

%%

int yylval;

int main(void) {
    int token;
    int result = 0;
    int operand;
    
    while ((token = yylex()) != 0) {
        switch (token) {
            case NUMBER:
                if (result == 0) {
                    result = yylval;
                } else {
                    operand = yylval;
                }
                break;
            case PLUS:
                if (yylex() == NUMBER) {
                    result += yylval;
                }
                break;
            case MINUS:
                if (yylex() == NUMBER) {
                    result -= yylval;
                }
                break;
            case MULTIPLY:
                if (yylex() == NUMBER) {
                    result *= yylval;
                }
                break;
            case DIVIDE:
                if (yylex() == NUMBER) {
                    if (yylval != 0) {
                        result /= yylval;
                    } else {
                        printf("Error: Division by zero\n");
                        return 1;
                    }
                }
                break;
            default:
                printf("Unknown operation\n");
                return 1;
        }
    }

    printf("Result: %d\n", result);
    return 0;
}

int yywrap(void) {
    return 1;
}
