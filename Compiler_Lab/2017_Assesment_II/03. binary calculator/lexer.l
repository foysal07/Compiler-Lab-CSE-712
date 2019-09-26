%{
    #include "parser.tab.h"
    void yyerror(char *s);
    int yylval = 0;

%}
%option noyywrap

%%

[0-1]+   {  yylval = atoi(yytext);
            return INT; }

[-+\n]   { return *yytext; }

[ \t]    {}

.        yyerror("Invalid Character.\n");


%% 
