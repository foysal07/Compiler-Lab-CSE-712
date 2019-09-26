%option noyywrap

%{
    #include <stdio.h>
    #include <stdlib.h>
    
    int count = 0;

%}


%%

[0-9a-fA-F]+    {
                    if(strtol(yytext, NULL, 16) > 9999){
                        printf("Found %s\n", yytext);count++;
                    }
                }
\n|.            {}

%%

int main(){

    yylex();
    printf("Total %d\n", count);
    return 0;
}
