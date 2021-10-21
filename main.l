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
COMMA [,]
SEMICOLON [;]

DIGIT [0-9]+
ALPHABETICAL [a-zA-Z]

ASCII [!-~]
STRING_WORD {ASCII}+
VAR_NAME {ALPHABETICAL}({ALPHABETICAL}|{DIGIT})*
FLOAT_NUMBER {SIGN}?{DIGIT}?{DOT}{DIGIT}
COMMENT {LCOM}.*{RCOM}

IF if
WHILE while
FOR for
ELSE else
VOID void

INT int
FLOAT float 
BOOL bool
STR str
TRUE true
FALSE false
FUNCTION function
RETURN return
GETHEADINGS getHeading
GETALTITUDE getAltitude
GETTEMPERATURE getTempature
SETVERTICALCLIMB setVerticalClimb
SETHORIZONTAL setHorizontal
SETHEADING setHeading
SETSPRAY setSpray
CONNECT connect
SLEEP sleep
SCANNEXT scanNext
PRINTOUT printOut

%%
{DOT} printf("DOT ");
{LCOM} printf( "LCOM " );
{RCOM} printf( "RCOM " );

{COMMENT} printf(" <There were some comment> ");
{FLOAT_NUMBER}  printf("FLOAT_NUMBER(%s) ", yytext);
{DIGIT} printf("DIGIT(%s) ", yytext);
{IF} printf( "IF ");

{VAR_NAME} printf( "VAR_NAME ");
{STRING_WORD} printf( "STRING_WORD ");


