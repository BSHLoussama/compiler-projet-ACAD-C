%{
    int Line =1, Col=1;
%}

%union {
         int entier;
         char* str;
         float reel;
}

%token <str> IDF
%token <entier> INT
%token <reel> NBR
%token <str> STRING_LITERAL
%token mc_EQ mc_NE mc_LE mc_LT mc_GE mc_GT mc_AND mc_OR mc_FALSE mc_TRUE mc_CHARACTER mc_INTEGER mc_LOGICAL mc_REAL mc_DIMENSION mc_DOWHILE mc_ENDDO mc_IF mc_THEN mc_ELSE mc_ENDIF mc_ROUTINE mc_CALL mc_ENDR mc_PROGRAM mc_END mc_READ mc_WRITE mc_EQUIVALENCE
%token ';' '=' '(' ')' '*' '+' '-' '/' ','  
%token err

%start program

%%

program:
    function_declaration_list
    program_principal
{	
	printf("syntaxe correcte"); 
	YYACCEPT;
}
;



function_declaration_list:
    | function_declaration_list function_declaration
	| function_declaration
;

function_declaration:
    type mc_ROUTINE function_name '(' parameter_list ')'
    declaration_list
    instruction_list
    return_statement
    mc_ENDR
;

function_name: IDF
;

parameter_list:
    | IDF
    | parameter_list ',' IDF
;

declaration_list:
    declaration
    | declaration_list declaration
;

declaration:
    type dec_variable_list ';' 
    | type mc_DIMENSION '(' INT ')' ';'
    | type mc_DIMENSION '(' INT ',' INT ')' ';'
    | mc_CHARACTER IDF '*' INT ';'
;

type:
    mc_INTEGER
    | mc_REAL
    | mc_LOGICAL
    | mc_CHARACTER
;

dec_variable_list:
    IDF
    | dec_variable_list ',' IDF
;

inst_variable_list:
    variable
    |inst_variable_list ',' variable
;

variable:
    IDF
    | IDF '(' INT ')'
    | IDF '(' INT ',' INT ')'	
	| IDF '(' IDF ')'           
    | IDF '(' IDF ',' IDF ')'
	| IDF '(' expression ')'
    | IDF '(' expression ',' expression ')'
;
	
expression:
    term
    | expression '+' term     
    | expression '-' term
;

term:
	factor
	| term '*' factor
	| term '/' factor
;

factor:
	'(' expression ')'
	| '-'  factor
	| variable
	| NBR
;
	
condition:
	condition mc_OR logical_term 
	| logical_term
;

logical_term:
	logical_term mc_AND logical_factor
	| logical_factor
;

logical_factor:
	'(' condition ')'
	| comparison_expression
	| logical_opd
;

comparison_expression:
	expression logical_cmprt expression
;

logical_cmprt:
	mc_EQ
	| mc_NE
	| mc_LT
	| mc_GT
	| mc_LE
	| mc_GE
;

logical_opd:
	mc_TRUE
	| mc_FALSE
;

program_principal:
    mc_PROGRAM IDF
    declaration_list
    instruction_list
    mc_END
;

instruction_list:
    instruction
    | instruction_list instruction
;

instruction:
    assignment
    | read_statement
    | write_statement
    | function_call
    | if_statement
    | do_while_statement
	| equivalence_statement
;

assignment:
    variable '=' expression ';'
;

read_statement:
    mc_READ '(' variable ')' ';'  
;

write_statement:
    mc_WRITE  '(' message ')' ';'
;

message: 
	not_void_message
	| void_message
;
	
not_void_message:
	elt_message
	| message ',' elt_message     
;

void_message:
;

elt_message:
	STRING_LITERAL  
	| expression
;

function_call:
    IDF '=' mc_CALL function_name '(' argument_list ')' ';'
;

return_statement:
    function_name '=' expression ';'
;

argument_list:
    | expression
    | argument_list ',' expression 
;

do_while_statement:
    mc_DOWHILE '(' condition ')' instruction_list mc_ENDDO
;

if_statement:
    mc_IF '(' condition ')' mc_THEN instruction_list mc_ENDIF
    | mc_IF '(' condition ')' mc_THEN instruction_list mc_ELSE instruction_list mc_ENDIF
 
;

equivalence_statement:
    mc_EQUIVALENCE '(' inst_variable_list ')' ',' '(' inst_variable_list ')' ';'
;

%%
int yyerror(char *msg)
{
	printf ("Erreur Syntaxique a ligne %d a colonne %d \n", Line,Col);
	return 1;
}

int main()
{
	initialisation();
	yyparse();
	afficher();
	return 0;
}
int yywrap(void)
{
	return 0;
}
