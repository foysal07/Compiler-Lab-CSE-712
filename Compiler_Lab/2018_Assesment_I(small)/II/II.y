
%{
    #include <stdio.h>
    extern int yylex();
    void yyerror(const char* msg);
%}

%error-verbose

%union {
    int     i
}

%token<i> T F

%type<i> expr

%left '^'
%left '&'
%left '|'

%start program

%%
program: expr          {printf("Result = %c\n", ($1 ? 'T' : 'F'));}
    | %empty
    ;
    
expr: T                 {$$ = 1;}
    | F                 {$$ = 0;}
    | '^' expr          {$$ = ~$2;}
    | expr '&' expr     {$$ = $1 && $3;}
    | expr '|' expr     {$$ = $1 || $3;}
    ;

%%

int main(){
    return yyparse();
}

void yyerror(const char* msg){
    printf("Error occured: %s\n", msg);
}
