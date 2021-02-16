%{
int yylex(void); /* -Wall : avoid implicit call */ int yyerror(const char*); /* same for bison */
%}
%token NOMBRE
%start resultat
%%
resultat: expression ;
expression:
   expression '+' terme
 | expression '-' terme
 | terme
 ;
terme:
   terme '*' facteur
| facteur ;
facteur:
  '(' expression ')'
 | '-' facteur
 | NOMBRE
 ;
%%
#include <stdio.h>
int yyerror(const char *msg){ printf("Parsing:: syntax error\n"); return 1;} int yywrap(void){ return 1; } /* stop reading flux yyin */
