%{
#include <stdio.h>
#include <string.h>

void print_token(char *type, char *text) {
    printf("%s: %s\n", type, text);
}

%}

%%
"auto"|"break"|"case"|"char"|"const"|"continue"|"default"|"do"|"double"|"else"|"enum"|"extern"|"float"|"for"|"goto"|"if"|"int"|"long"|"register"|"return"|"short"|"signed"|"sizeof"|"static"|"struct"|"switch"|"typedef"|"union"|"unsigned"|"void"|"volatile"|"while" { print_token("Keyword", yytext); }
[a-zA-Z_][a-zA-Z0-9_]* { print_token("Identifier", yytext); }
.|\n { /* Ignore other characters */ }

%%

int main(int argc, char **argv) {
    yylex();
    return 0;
}

int yywrap() {
    return 1;
}
