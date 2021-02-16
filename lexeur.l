%{
#include <stdio.h>
#include "parseur.tab.h"
%}

%%

0|[1-9][0-9]* { printf("lex::NOMBRE %s\n",yytext); return NOMBRE; } { ; } /* ignore space, tab, and line return */
[ \t\n]       { ; } /* ignore space, tab, and line return */
.              { printf("lex::char %s\n",yytext); return yytext[0]; }

%%
