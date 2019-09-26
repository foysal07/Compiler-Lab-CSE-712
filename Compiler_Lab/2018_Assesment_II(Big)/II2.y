
%{
    #include <stdio.h>
    extern int yylex();
    void yyerror(const char* msg);
%}

%error-verbose

%union {
    int      i;
}
%token<i> N

%type<i> expr

%left '+'

%start program

%%
program: expr               {printf("Result = %d\n", $1);}
    | %empty                
    ;
    
expr: N                     {$$ = $1;}
    | expr '+' N            {$$ = $1 + $3;}
    ;
    
%%

int main(){
    return yyparse();
}

void yyerror(const char* msg){
    printf("Error occured: %s\n", msg);
}
