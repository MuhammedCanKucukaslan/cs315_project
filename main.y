%token AND       
%token OR        
%token LP        
%token RP        
%token LB        
%token RB        
%token LCOM      
%token RCOM      
%token DOT       
%token SIGN      
%token COMMA     
%token SEMICOLON 
%token ADD       
%token SUB       
%token MUL       
%token DIV       

%token SPACE     
%token ANYCHAR   

%token LT        
%token LE        
%token GT        
%token GE        
%token EQ        
%token NOT       
%token ASSIGN_OP 

%token DIGIT       
%token INTEGER     
%token ALPHABETICAL
 
%token ASCII       
%token STRING_WORD 
%token STRING      
%token VAR_NAME    
%token FLOAT_NUMBER

%token IF      
%token WHILE   
%token FOR     
%token ELSE    
%token VOID    

%token INT     
%token FLOAT   
%token BOOL    
%token STR     
%token TRUE    
%token FALSE   
%token FUNCTION
%token RETURN  

%token GET_HEADINGS     
%token GET_ALTITUDE     
%token GET_TEMPERATURE  
%token SET_VERTICALCLIMB
%token SET_HORIZONTAL   
%token SET_HEADING      
%token SET_SPRAY        
%token CONNECT          
%token SLEEP            
%token SCAN_NEXT        
%token PRINT_OUT        

%% 

//-------------------------------------------
// Statements
PROGRAM : STATEMENTS


STATEMENTS: STATEMENT // SEMICOLON // moved to NON_IF_STATEMENT part 
    | STATEMENTS STATEMENT // SEMICOLON // moved to NON_IF_STATEMENT part 
    | STATEMENTS FUNCTION_DEFINITION // addition to original bnf grammar

STATEMENT : MATCHED 
    | UNMATCHED 


//-------------------------------------------
// Conditional Statements
MATCHED : IF LP LOGICAL_EXPRESSION RP  MATCHED ELSE MATCHED
    | NON_IF_STATEMENT
UNMATCHED : IF LP LOGICAL_EXPRESSION RP  STATEMENT
    | IF LP LOGICAL_EXPRESSION RP  MATCHED ELSE UNMATCHED
// END OF Conditional Statements

//-------------------------------------------
// Non-conditional Statements
NON_IF_STATEMENT : ITERATIVE_STATEMENT // no SEMICOLON after loop: "while() { ... }"  
    | LB STATEMENTS RB 
    | DECLARATIVE_STATEMENT SEMICOLON
    | ASSIGNMENT_STATEMENT SEMICOLON
    | FUNCTION_CALL SEMICOLON
    | RETURN_STATEMENT SEMICOLON
// END OF Non-conditional Statements

//-------------------------------------------
// Declaration
DECLARATIVE_STATEMENT : TYPE VAR_NAME // combined with VARIABLE_DECLARATION
// END OF Declaration

//-------------------------------------------
// Loops- ITERATIVE_STATEMENT
ITERATIVE_STATEMENT  :  WHILE LP  LOGICAL_EXPRESSION  RP  MATCHED // curly brackets are removed from the original grammar
    | FOR LP  NON_IF_STATEMENT SEMICOLON LOGICAL_EXPRESSION SEMICOLON NON_IF_STATEMENT RP MATCHED  // curly brackets are removed from the original grammar
// END OF Loops

//-------------------------------------------
// Assignment
ASSIGNMENT_STATEMENT :  VAR_NAME ASSIGN_OP  EXPRESSION 
    | VAR_NAME ASSIGN_OP FUNCTION_CALL
    | DECLARATIVE_STATEMENT ASSIGN_OP  EXPRESSION 
    | DECLARATIVE_STATEMENT ASSIGN_OP FUNCTION_CALL


// END OF

//-------------------------------------------
// Expressions
EXPRESSION :  LP EXPRESSION RP 
    | LOGICAL_EXPRESSION
    // | RELATIONAL_EXPRESSION // removed from original grammar. It it conflicts with LOGICAL_EXPRESSION > OR_EXPRESSION > AND_EXPRESSION > BOOLEAN_FACTOR >RELATIONAL_EXPRESSION
    | ARITHMETIC_EXPRESSION

// END OF Expressions

// Arithmetic
ARITHMETIC_EXPRESSION : ARITHMETIC_EXPRESSION ADDITIVE_OPERATOR TERM 
	| TERM
TERM : TERM MULTIPLICATIVE_OPERATOR FACTOR 
	| FACTOR
FACTOR : LP ARITHMETIC_EXPRESSION RP 
	| VALUE

ADDITIVE_OPERATOR : ADD | SUB
MULTIPLICATIVE_OPERATOR :  MUL | DIV
// END OF Arithmetic

// Boolean 
LOGICAL_EXPRESSION :  OR_EXPRESSION
	// | RELATIONAL_EXPRESSION // removed from original grammar, it conflicts with OR_EXPRESSION > AND_EXPRESSION > BOOLEAN_FACTOR >RELATIONAL_EXPRESSION

OR_EXPRESSION : OR_EXPRESSION OR AND_EXPRESSION 
	| AND_EXPRESSION
AND_EXPRESSION : AND_EXPRESSION AND BOOLEAN_FACTOR 
	| BOOLEAN_FACTOR
BOOLEAN_FACTOR : NOT BOOLEAN_FACTOR
    | LP OR_EXPRESSION RP
    | RELATIONAL_EXPRESSION // replacing it with "LP RELATIONAL_EXPRESSION RP" will reduce the conflicts to 4sr/4rr from 6sr/20rr
    | VALUE
// END OF BOOLEAN

// Relation
RELATIONAL_EXPRESSION : ARITHMETIC_EXPRESSION RELATIONAL_OPERATOR ARITHMETIC_EXPRESSION
	| EQUIVALANCE_EXPRESSION

RELATIONAL_OPERATOR : LT
    | GT
    | GE
    | LE

EQUIVALANCE_EXPRESSION : EXPRESSION EQ EXPRESSION 

// ---------------------------
// Variables
// VARIABLE_DECLARATION : TYPE VAR_NAME // combined TO DECLARATIVE_STATEMENT
TYPE: PRIMITIVE_TYPE
	| VOID
PRIMITIVE_TYPE: INT | FLOAT  | BOOL | STR 

VALUE: VAR_NAME | CONSTANT

CONSTANT: BOOLEAN_VAL | FLOAT_NUMBER | INTEGER | STRING

BOOLEAN_VAL: TRUE | FALSE

//-------------------------------------------
// Functions
ARGUMENTS : TYPE VAR_NAME
    | ARGUMENTS COMMA TYPE VAR_NAME 

FUNCTION_DEFINITION : FUNCTION TYPE VAR_NAME LP ARGUMENTS RP  LB STATEMENTS RB
    | FUNCTION TYPE VAR_NAME LP   RP  LB STATEMENTS RB

PARAMETERS : VALUE
    | PARAMETERS COMMA VALUE

FUNCTION_CALL : VAR_NAME LP   RP 
    | VAR_NAME LP  PARAMETERS  RP 
    | PRIMITIVE_FUNCTION_CALL

RETURN_STATEMENT : RETURN  EXPRESSION 
    | RETURN FUNCTION_CALL // addition to original bnf grammar

//-------------------------------------------
// Primitive Functions
PRIMITIVE_FUNCTION_CALL : GET_HEADINGS LP  RP 
    | GET_ALTITUDE LP  RP 
    | GET_TEMPERATURE LP  RP 
    | SET_VERTICALCLIMB LP ARITHMETIC_EXPRESSION RP 
    | SET_HORIZONTAL LP ARITHMETIC_EXPRESSION RP 
    | SET_HEADING LP LOGICAL_EXPRESSION RP 
    | SET_SPRAY LP LOGICAL_EXPRESSION RP 
    | CONNECT LP  STRING  COMMA  STRING  RP 
    | SLEEP LP ARITHMETIC_EXPRESSION RP 
    | SCAN_NEXT LP  RP 
    | PRINT_OUT LP  EXPRESSION RP 

%%

#include "lex.yy.c"
int lineno=0;
int yyerror( char *s ) { fprintf( stderr, "%s: in line %d\n", s, 1+ lineno); }

main() { 
   yyparse(); 
	if(yynerrs < 1){
		printf("Parsing: SUCCESSFUL!\n");
	}
	else
		printf("Parsing: FAILED with at least %d errors!\n",yynerrs);

 	return 0;
}