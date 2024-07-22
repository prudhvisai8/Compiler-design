%{
#include <stdio.h>

#define MAX_DATE_LENGTH 11

int day_valid = 0;
int month_valid = 0;
int year_valid = 0;

%}

DAY [0-9]{1,2}
MONTH [0-9]{1,2}
YEAR [0-9]{4}

%%

{DAY} {
    int day = atoi(yytext);
    if (day >= 1 && day <= 31) {
        printf("Day: %d\n", day);
        day_valid = 1;
    } else {
        printf("Error: Invalid day (%d)\n", day);
        return 1;
    }
}

"/" {
    if (!day_valid) {
        printf("Error: Day not specified\n");
        return 1;
    }
}

{MONTH} {
    int month = atoi(yytext);
    if (month >= 1 && month <= 12) {
        printf("Month: %d\n", month);
        month_valid = 1;
    } else {
        printf("Error: Invalid month (%d)\n", month);
        return 1;
    }
}

"/" {
    if (!month_valid) {
        printf("Error: Month not specified\n");
        return 1;
    }
}

{YEAR} {
    int year = atoi(yytext);
    if (year >= 1900 && year <= 2100) {
        printf("Year: %d\n", year);
        year_valid = 1;
    } else {
        printf("Error: Invalid year (%d)\n", year);
        return 1;
    }
}

\n {
    if (day_valid && month_valid && year_valid) {
        printf("DOB is valid\n");
    } else {
        printf("Error: DOB is not valid\n");
    }
    return 0;
}

. {
    printf("Error: Invalid character '%c'\n", yytext[0]);
    return 1;
}

%%

main() {
    yylex();
    return 0;
}