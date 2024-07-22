%{
#include <stdio.h>
#include <string.h>
#include <ctype.h>

int vowel_count = 0;
int consonant_count = 0;

%}

VOWEL [aeiou]
CONSONANT [bcdfghjklmnpqrstvwxyz]

%%

{VOWEL} { vowel_count++; }
{CONSONANT} { consonant_count++; }
[ \t\n] ; /* ignore whitespace */
. ; /* ignore other characters */

%%

main() {
    yylex();
    printf("Vowels: %d, Consonants: %d\n", vowel_count, consonant_count);
    return 0;
}