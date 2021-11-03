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

// Arithmetic
ARITHMETIC_EXPRESSION : ARITHMETIC_EXPRESSION ADDITIVE_OPERATOR TERM 
| TERM
TERM : TERM MULTIPLICATIVE_OPERATOR FACTOR 
| FACTOR
FACTOR : LP ARITHMETIC_EXPRESSION RP | VALUE 

ADDITIVE_OPERATOR : ADD | SUB
MULTIPLICATIVE_OPERATOR :  MUL | DIV

// END OF Arithmetic


// Variables
VAR_DEC : TYPE VAR_NAME
TYPE: PRIMITIVE_TYPE
	| VOID
PRIMITIVE_TYPE: INT | FLOAT  | BOOL | STR 

VALUE: VAR_NAME | CONSTANT
CONSTANT: BOOLEAN_VAL | FLOAT_NUMBER | INTEGER | STRING


BOOLEAN_VAL: TRUE | FALSE
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