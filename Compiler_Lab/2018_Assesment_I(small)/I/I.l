%option noyywrap

%{
    #include <stdio.h>
    
    int count = 0;

%}


%%

[0-9a-fA-F]+    {printf("Found %s\n", yytext);count++;}
.|\n            {}

%%

int main(){

    yylex();
    printf("Total %d\n", count);
    return 0;
}
