%option main

AND       \&\&
OR        \|\|
LP        \(
RP        \)
LB        \{
RB        \}
LCOM      \/\*
RCOM      \*\/
DOT       [.]
SIGN      [+-]
COMMA     [,]
SEMICOLON [;]

DIGIT [0-9]
INTEGER ({DIGIT})+
ALPHABETICAL [a-zA-Z]

ASCII [!-~]
STRING_WORD {ASCII}+
STRING ["]{ASCII}*["]
VAR_NAME {ALPHABETICAL}({ALPHABETICAL}|{INTEGER})*
FLOAT_NUMBER {SIGN}?{INTEGER}?{DOT}{INTEGER}
COMMENT {LCOM}.*{RCOM}

IF    if
WHILE while
FOR   for
ELSE  else
VOID  void

INT      int
FLOAT    float 
BOOL     bool
STR      str
TRUE     true
FALSE    false
FUNCTION function
RETURN   return

GET-HEADINGS      getHeading
GET_ALTITUDE      getAltitude
GET_TEMPERATURE   getTempature
SET_VERTICALCLIMB setVerticalClimb
SET_HORIZONTAL    setHorizontal
SET_HEADING       setHeading
SET_SPRAY         setSpray
CONNECT           connect
SLEEP             sleep
SCAN_NEXT         scanNext
PRINT_OUT         printOut

%%
{DOT} printf("DOT ");
{LCOM} printf( "LCOM " );
{RCOM} printf( "RCOM " );

{AND} printf("AND ");
{OR}  printf("OR ");      
{LP}  printf("LP ");     
{RP}  printf("RP ");      
{LB}  printf("LB ");     
{RB}  printf("RB ");      

{IF}    printf("IF ");
{WHILE} printf("WHILE ");
{FOR}   printf("FOR ");
{ELSE}  printf("ELSE ");
{VOID}  printf("VOID ");


   
{INT}   printf("INT ");
{FLOAT}   printf("FLOAT ");
{BOOL}   printf("BOOL ");
{STR}   printf("STR ");
{TRUE}   printf("TRUE ");
{FALSE}   printf("FALSE ");
{FUNCTION}   printf("FUNCTION ");
{RETURN}   printf("RETURN ");



{COMMENT} printf(" <There were some comment> ");
{FLOAT_NUMBER}  printf("FLOAT_NUMBER(%s) ", yytext);
{INTEGER} printf("INTEGER(%s) ", yytext);

{VAR_NAME} printf( "VAR_NAME ");
{STRING} printf( "STRING ");
