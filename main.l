%option main

AND \&\&
OR \|\|
LP \(
RP \)
LB \{
RB \}
LCOM \/\*
RCOM \*\/
DOT [.]
SIGN [+-]
DIGIT [0-9]+
COMMA [,]
SEMICOLON [;]


ALPHABETICAL [a-zA-Z]+ 
FLOAT {SIGN}?{DIGIT}?{DOT}{DIGIT}


IF if
WHILE while
FOR for

%%
{DIGIT} printf("DIGIT(%s) ", yytext);
{FLOAT}  printf("FLOAT(%s) ", yytext);
{ALPHABETICAL} printf("ALPHABETICAL ");
{DOT} printf("DOT ");
{LCOM} printf( "LCOM " );
{RCOM} printf( "RCOM " );

IF	printf("IF ");
ELSE  printf("ELSE ");

