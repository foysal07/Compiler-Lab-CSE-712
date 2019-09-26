
%option noyywrap

%{
    #include <stdlib.h>
    #include "II2.tab.h"
    extern void yyerror(const char* msg);
%}


%%

[a-zA-Z]        {yylval.i = yytext[0];return N;}
[0-9]           {yylval.i = atoi(yytext);return N;}
"+"             {return '+';}
[\n \t\r]+      {}
.               {}

%%
