%{
#include <stdlib.h>
#include "tiny_basic.h"
#include "tiny_basic.tab.h"

void showErr(char *);
%}

alphabeta               [A-Z]              
integers                [-+]?(([1-9][0-9]*)|0) 
decimals                [-+]?[0-9]*\.[0-9]+    
%%

"LET"                   { return LET; }
"IF"                    { return IF; }
"THEN"                  { return THEN; }
"GOTO"                  { return GOTO; }
"INPUT"                 { return INPUT; }
"PRINT"                 { return PRINT; }
"END"                   { return END; }
">"                     { return GT; }
">="                    { return GE; }
"<"                     { return LT; }            
"<="                    { return LE; }
"=="                    { return EQ; }
"!="                    { return NE; }
\r?\n\r?                { return CR; }          
{alphabeta}             { yylval.var = yytext[0]; return VARIABLE; }
{integers}              { yylval.num = atoi(yytext); return INTEGER; }
{decimals}              { yylval.dec = atof(yytext); return DECIMAL; }
[-+*/=(),]              { return *yytext; }
[ \t]+                  {  } 
.                       { 
                            showErr("Unknown syntax."); 
                            fprintf(stdout, "%s\n", yytext); 
                        }

%%

int yywrap(void) {
    return 1;
}
