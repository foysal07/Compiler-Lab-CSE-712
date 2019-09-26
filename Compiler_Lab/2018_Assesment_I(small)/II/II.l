
%option noyywrap

%{
    #include "II.tab.h"
    extern void yyerror(const char* msg);
%}


%%

1|"T"     return T;
0|"F"     return F;
"|"       return '|';
"&"       return '&';
"^"       return '^';
.|\n      {}

%%
