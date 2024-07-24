%{
#include <stdio.h>
%}

%%

"oldword"    { printf("newword"); }
.            { putchar(yytext[0]); }

%%

int main(int argc, char *argv[]) {
    if (argc > 1) {
        FILE *file = fopen(argv[1], "r");
        if (!file) {
            perror("Failed to open file");
            return 1;
        }
        yyin = file;
        yylex();
        fclose(file);
    } else {
        fprintf(stderr, "Usage: %s <filename>\n", argv[0]);
        return 1;
    }
    return 0;
}

int yywrap(void) {
    return 1;
}
