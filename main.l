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
ADD       [+]
SUB       [-]
MUL       [*]
DIV       [/]

LT        <
LE        <=
GT        >
GE        >=
EQ        ==
NOT       !
ASSIGN_OP =


DIGIT [0-9]
INTEGER ({DIGIT})+
ALPHABETICAL [a-zA-Z]

ASCII [!-~]
STRING_WORD {ASCII}+
STRING ["].*["]
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
{COMMA}      printf("COMMA ");
{SEMICOLON}  printf("SEMICOLON ");

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


{ADD}     printf("ADD ");
{SUB}     printf("SUB ");
{MUL}     printf("MUL ");
{DIV}     printf("DIV ");


{GET-HEADINGS} printf("GET-HEADINGS ");
{GET_ALTITUDE} printf("GET_ALTITUDE ");
{GET_TEMPERATURE} printf("GET_TEMPERATURE ");
{SET_VERTICALCLIMB} printf("SET_VERTICALCLIMB ");
{SET_HORIZONTAL} printf("SET_HORIZONTAL ");
{SET_HEADING} printf("SET_HEADING ");
{SET_SPRAY} printf("SET_SPRAY ");
{CONNECT} printf("CONNECT ");
{SLEEP} printf("SLEEP ");
{SCAN_NEXT} printf("SCAN_NEXT ");
{PRINT_OUT} printf("PRINT_OUT ");

   
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

{ASSIGN_OP}   printf("ASSIGN_OP ");
{LT}  printf("LT ");
{LE}  printf("LE ");
{GT}  printf("GT ");
{GE}  printf("GE ");
{EQ}  printf("EQ ");
{NOT}  printf("NOT ");

