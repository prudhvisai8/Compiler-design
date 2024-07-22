%{
#include <stdio.h>
#include <string.h>

#define MAX_URL_LENGTH 256

int protocol_valid = 0;
int domain_valid = 0;
int path_valid = 0;

%}

PROTOCOL (http|https|ftp|sftp)
DOMAIN [a-zA-Z0-9.-]+
PATH [a-zA-Z0-9/._-]+
PORT [0-9]+

%%

{PROTOCOL} {
    printf("Protocol: %s\n", yytext);
    protocol_valid = 1;
}

":" {
    if (!protocol_valid) {
        printf("Error: Protocol not specified\n");
        return 1;
    }
}

"//" {
    if (!protocol_valid) {
        printf("Error: Protocol not specified\n");
        return 1;
    }
}

{DOMAIN} {
    printf("Domain: %s\n", yytext);
    domain_valid = 1;
}

":"{PORT} {
    printf("Port: %s\n", yytext);
}

"/"{PATH} {
    printf("Path: %s\n", yytext);
    path_valid = 1;
}

. {
    printf("Error: Invalid character '%c'\n", yytext[0]);
    return 1;
}

\n {
    if (protocol_valid && domain_valid && path_valid) {
        printf("URL is valid\n");
    } else {
        printf("Error: URL is not valid\n");
    }
    return 0;
}

%%

main() {
    yylex();
    return 0;
}