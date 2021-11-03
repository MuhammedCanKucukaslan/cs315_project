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

SPACE     [ ]
ANYCHAR   .

LT        <
LE        <=
GT        >
GE        >=
EQ        ==
NOT       !
ASSIGN_OP =


DIGIT       [0-9]
INTEGER      {SIGN}?({DIGIT})+
ALPHABETICAL [a-zA-Z]

ASCII         [!-~]
STRING_WORD {ASCII}+
STRING       ["][^"]*["]
VAR_NAME     {ALPHABETICAL}({ALPHABETICAL}|{INTEGER})*
FLOAT_NUMBER {SIGN}?{INTEGER}?{DOT}{INTEGER}

IF       if
WHILE    while
FOR      for
ELSE     else
VOID     void

INT      int
FLOAT    float 
BOOL     bool
STR      str
TRUE     true
FALSE    false
FUNCTION function
RETURN   return

GET_HEADINGS      getHeading
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

%x COMMENT
%%
{COMMA}      return(COMMA);
{SEMICOLON}  return(SEMICOLON);

"/*"           { BEGIN(COMMENT); return(COMMENT);}
<COMMENT>"*/" { BEGIN(INITIAL); }
<COMMENT>\n   { }
<COMMENT>.    { }

{DOT} return(DOT);

{AND} return(AND);
{OR}  return(OR);      
{LP}  return(LP);     
{RP}  return(RP);      
{LB}  return(LB);     
{RB}  return(RB);      

{IF}    return(IF);
{WHILE} return(WHILE);
{FOR}   return(FOR);
{ELSE}  return(ELSE);
{VOID}  return(VOID);


{ADD}     return(ADD);
{SUB}     return(SUB);
{MUL}     return(MUL);
{DIV}     return(DIV);


{GET_HEADINGS} return(GET_HEADINGS);
{GET_ALTITUDE} return(GET_ALTITUDE);
{GET_TEMPERATURE} return(GET_TEMPERATURE);
{SET_VERTICALCLIMB} return(SET_VERTICALCLIMB);
{SET_HORIZONTAL} return(SET_HORIZONTAL);
{SET_HEADING} return(SET_HEADING);
{SET_SPRAY} return(SET_SPRAY);
{CONNECT} return(CONNECT);
{SLEEP} return(SLEEP);
{SCAN_NEXT} return(SCAN_NEXT);
{PRINT_OUT} return(PRINT_OUT);

   
{INT}   return (INT);
{FLOAT}   return(FLOAT);
{BOOL}   return(BOOL);
{STR}   return(STR);
{TRUE}   return(TRUE);
{FALSE}   return(FALSE);
{FUNCTION}   return(FUNCTION);
{RETURN}   return(RETURN);

{FLOAT_NUMBER}  return(FLOAT_NUMBER);
{INTEGER} return(INTEGER);

{VAR_NAME} return(VAR_NAME);
{STRING} return(STRING);

{ASSIGN_OP}   return(ASSIGN_OP);
{LT}  return(LT);
{LE}  return(LE);
{GT}  return(GT);
{GE}  return(GE);
{EQ}  return(EQ);
{NOT}  return(NOT);
{SPACE} ;/* ignore the spaces return(SPACE); */
\n      { extern int lineno; lineno++; 
        }
%% 
int yywrap() { return 1; }