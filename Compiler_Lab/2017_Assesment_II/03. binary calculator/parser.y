%{
    #include <stdio.h>
    extern int yylex(); 
    void yyerror(char *s);
    int base_convert(int n, int past_base, int future_base);
%}

%token INT
%left '+' '-'

%%

program: program expr '\n' { printf("Result = %d\n", $2); }
    |
;

expr: INT      
    | unary            
    | expr '+' expr { int z = base_convert($1, 2, 10) + base_convert($3, 2, 10);
				      $$ = base_convert(z, 10, 2); }
    | expr '-' expr { int z = base_convert($1, 2, 10) - base_convert($3, 2, 10);
				      $$ = base_convert(z, 10, 2); }
;

unary: '+''+' expr { $$ = base_convert(base_convert($3, 2, 10) + 1, 10, 2); }
    | '-''-' expr { $$ = base_convert(base_convert($3, 2, 10) + 1, 10, 2); }
%%

int main() {
    yyparse();
    return 0;
}

int base_convert(int n, int past_base, int future_base) {
    int number = 0;
    int remainder, i = 1;

    while (n != 0) {
        remainder = n % future_base;
        n /= future_base;
        number += remainder*i;
        i *= past_base;
    }
    return number;
}

void yyerror(char *s) {
    fprintf(stderr, "%s\n", s);
}