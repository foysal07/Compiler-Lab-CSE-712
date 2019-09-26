%option noyywrap

%{
    #include <stdio.h>
    
    int v = 0, c = 0, d = 0;

%}
V   [aeiouAEIOU]
C   [a-zA-Z]{-}[aeiouAEIOU]
%%

[0-9]+            {printf("Found %s\n", yytext);d++;}
{V}+              {printf("Found %s\n", yytext);v++;}
{C}+              {printf("Found %s\n", yytext);c++;}
.|\n              {}

%%

int main(){

    yylex();
    printf("Total <consonat strings: %d, vowel strings: %d, decimal numbers: %d\n", c, v, d);
    return 0;
}
